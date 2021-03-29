import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/utils/launch_url_utils.dart';
import 'package:minitel_toolbox/data/database/diagnosis.dart';
import 'package:minitel_toolbox/domain/usecases/report_to_slack.dart';
import 'package:share/share.dart';

part 'report_cubit.freezed.dart';
part 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState> {
  final ReportToSlack report;

  ReportCubit({required this.report})
      : super(const ReportState.initial());

  void toInitState() {
    emit(const ReportState.initial());
  }

  Future<void> reportToMail({
    required String room,
    required String name,
    required String title,
    required String description,
    required Diagnosis diagnosis,
  }) async {
    emit(const ReportState.loading());
    try {
      final body = '---Report ${DateTime.now().toString()}---\n\n'
          'Chambre: $room\n'
          'ID: $name\n'
          'Titre: $title\n'
          'Description: $description\n\n'
          '*Diagnosis*\n'
          '${await diagnosis.getReport()}';

      await LaunchURLUtils.launchURL(
          'mailto:minitelismin@gmail.com?subject=$title&body=$body');
      emit(const ReportState.done(''));
      toInitState();
    } on Exception catch (e) {
      emit(ReportState.error(e));
      toInitState();
    }
  }

  Future<void> reportToSlack({
    required String room,
    required String name,
    required String title,
    required String description,
    required Diagnosis diagnosis,
    @Default('minitel_toolbox_notifications') required String channel,
  }) async {
    emit(const ReportState.loading());
    try {
      final status = await report(
        '*Chambre $room*\n'
        '*ID : $name*\n'
        '*$title*\n'
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
    required String room,
    required String name,
    required String title,
    required String description,
    required Diagnosis diagnosis,
  }) async {
    emit(const ReportState.loading());
    try {
      final body = '---Report ${DateTime.now().toString()}---\n\n'
          'Chambre: $room\n'
          'ID: $name\n'
          'Titre: $title\n'
          'Description: $description\n\n'
          '*Diagnosis*\n'
          '${await diagnosis.getReport()}';

      await Share.share(body);
      emit(const ReportState.done(''));
      toInitState();
    } on Exception catch (e) {
      emit(ReportState.error(e));
      toInitState();
    }
  }
}
