import 'dart:async';

import 'package:cubit/cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/utils/launch_url_utils.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:share/share.dart';

part 'report_cubit.freezed.dart';
part 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState> {
  final SlackRemoteDataSource slackRemoteDataSource;

  ReportCubit({@required this.slackRemoteDataSource})
      : assert(slackRemoteDataSource != null),
        super(const ReportState.initial());

  void toInitState() {
    emit(const ReportState.initial());
  }

  Future<void> reportToMail({
    @required @nullable String room,
    @required @nullable String name,
    @required @nullable String title,
    @required @nullable String description,
    @required @nullable Diagnosis diagnosis,
  }) async {
    emit(const ReportState.loading());
    try {
      final body = '---Report ${DateTime.now().toString()}---\n\n'
          'Chambre: ${room}\n'
          'ID: ${name}\n'
          'Titre: ${title}\n'
          'Description: ${description}\n\n'
          '*Diagnosis*\n'
          '${await diagnosis.getReport()}';

      await LaunchURLUtils.launchURL(
          'mailto:minitelismin@gmail.com?subject=${title}&body=$body');
      emit(const ReportState.done(null));
      toInitState();
    } on Exception catch (e) {
      emit(ReportState.error(e));
      toInitState();
    }
  }

  Future<void> reportToSlack({
    @required @nullable String room,
    @required @nullable String name,
    @required @nullable String title,
    @required @nullable String description,
    @required @nullable Diagnosis diagnosis,
    @Default('minitel_toolbox_notifications') String channel,
  }) async {
    emit(const ReportState.loading());
    try {
      final status = await slackRemoteDataSource.report(
        '*Chambre ${room}*\n'
        '*ID : ${name}*\n'
        '*${title}*\n'
        '_${description}_\n\n',
        attachments: await diagnosis.waitAll(),
        channel: channel,
      );
      emit(ReportState.done(status));
      toInitState();
    } on Exception catch (e) {
      emit(ReportState.error(e));
      toInitState();
    }
  }

  Future<void> reportToShare({
    @required @nullable String room,
    @required @nullable String name,
    @required @nullable String title,
    @required @nullable String description,
    @required @nullable Diagnosis diagnosis,
  }) async {
    emit(const ReportState.loading());
    try {
      final body = '---Report ${DateTime.now().toString()}---\n\n'
          'Chambre: ${room}\n'
          'ID: ${name}\n'
          'Titre: ${title}\n'
          'Description: ${description}\n\n'
          '*Diagnosis*\n'
          '${await diagnosis.getReport()}';

      await Share.share(body);
      emit(const ReportState.done(null));
      toInitState();
    } on Exception catch (e) {
      emit(ReportState.error(e));
      toInitState();
    }
  }
}
