import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/utils/launch_url_utils.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:share/share.dart';

part 'report_bloc.freezed.dart';
part 'report_event.dart';
part 'report_state.dart';

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final SlackRemoteDataSource slackRemoteDataSource;

  ReportBloc({@required this.slackRemoteDataSource})
      : assert(slackRemoteDataSource != null),
        super(const ReportState.initial());

  @override
  Stream<ReportState> mapEventToState(
    ReportEvent event,
  ) {
    return event.map(
      toInitState: _mapReportToInitStateToState,
      share: _mapReportToShareToState,
      slack: _mapReportToSlackToState,
      mail: _mapReportToMailToState,
    );
  }

  Stream<ReportState> _mapReportToInitStateToState(
      ReportToInitState event) async* {
    yield const ReportState.initial();
  }

  Stream<ReportState> _mapReportToMailToState(ReportToMail event) async* {
    yield const ReportState.loading();
    try {
      final body = '---Report ${DateTime.now().toString()}---\n\n'
          'Chambre: ${event.room}\n'
          'ID: ${event.name}\n'
          'Titre: ${event.title}\n'
          'Description: ${event.description}\n\n'
          '*Diagnosis*\n'
          '${await event.diagnosis.getReport()}';

      await LaunchURLUtils.launchURL(
          'mailto:minitelismin@gmail.com?subject=${event.title}&body=$body');
      yield const ReportState.done(null);
      add(const ReportEvent.toInitState());
    } on Exception catch (e) {
      yield ReportError(e);
      add(const ReportEvent.toInitState());
    }
  }

  Stream<ReportState> _mapReportToSlackToState(ReportToSlack event) async* {
    yield const ReportState.loading();
    try {
      final status = await slackRemoteDataSource.report(
        '*Chambre ${event.room}*\n'
        '*ID : ${event.name}*\n'
        '*${event.title}*\n'
        '_${event.description}_\n\n',
        attachments: await event.diagnosis.waitAll(),
        channel: event.channel,
      );
      yield ReportState.done(status);
      add(const ReportEvent.toInitState());
    } on Exception catch (e) {
      yield ReportState.error(e);
      add(const ReportEvent.toInitState());
    }
  }

  Stream<ReportState> _mapReportToShareToState(ReportToShare event) async* {
    yield const ReportState.loading();
    try {
      final body = '---Report ${DateTime.now().toString()}---\n\n'
          'Chambre: ${event.room}\n'
          'ID: ${event.name}\n'
          'Titre: ${event.title}\n'
          'Description: ${event.description}\n\n'
          '*Diagnosis*\n'
          '${await event.diagnosis.getReport()}';

      await Share.share(body);
      yield const ReportState.done(null);
      add(const ReportEvent.toInitState());
    } on Exception catch (e) {
      yield ReportState.error(e);
      add(const ReportEvent.toInitState());
    }
  }
}
