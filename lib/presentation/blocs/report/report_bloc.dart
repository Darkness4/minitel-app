import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/utils.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:share/share.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final SlackRemoteDataSource slackRemoteDataSource;

  ReportBloc({@required this.slackRemoteDataSource});

  @override
  ReportState get initialState => const ReportInitial();

  @override
  Stream<ReportState> mapEventToState(
    ReportEvent event,
  ) async* {
    if (event is ReportToShare) {
      yield const ReportLoading();
      try {
        final String body = "---Report ${DateTime.now().toString()}---\n\n"
            "Chambre: ${event.room}\n"
            "ID: ${event.name}\n"
            "Titre: ${event.title}\n"
            "Description: ${event.description}\n\n"
            "*Diagnosis*\n"
            "${await event.diagnosis.getReport()}";

        await Share.share(body);
        yield const ReportDone(null);
        add(ReportToInitState());
      } catch (e) {
        yield ReportError(error: e);
        add(ReportToInitState());
      }
    } else if (event is ReportToSlack) {
      yield const ReportLoading();
      try {
        final String status = await slackRemoteDataSource.report(
          "*Chambre ${event.room}*\n"
          "*ID : ${event.name}*\n"
          "*${event.title}*\n"
          "_${event.description}_\n\n",
          attachments: await event.diagnosis.waitAll(),
          channel: event.channel,
        );
        yield ReportDone(status);
        add(ReportToInitState());
      } catch (e) {
        yield ReportError(error: e);
        add(ReportToInitState());
      }
    } else if (event is ReportToMail) {
      yield const ReportLoading();
      try {
        final String body = "---Report ${DateTime.now().toString()}---\n\n"
            "Chambre: ${event.room}\n"
            "ID: ${event.name}\n"
            "Titre: ${event.title}\n"
            "Description: ${event.description}\n\n"
            "*Diagnosis*\n"
            "${await event.diagnosis.getReport()}";

        await LaunchURLUtils.launchURL(
            "mailto:minitelismin@gmail.com?subject=${event.title}&body=$body");
        yield const ReportDone(null);
        add(ReportToInitState());
      } catch (e) {
        yield ReportError(error: e);
        add(ReportToInitState());
      }
    } else if (event is ReportToInitState) {
      yield const ReportInitial();
    }
  }
}
