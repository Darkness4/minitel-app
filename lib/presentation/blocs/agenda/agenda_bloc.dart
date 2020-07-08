import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

part 'agenda_bloc.freezed.dart';
part 'agenda_event.dart';
part 'agenda_state.dart';

@injectable
class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  final ICalendarRepository iCalendarRepository;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationDetails notificationDetails;

  AgendaBloc({
    @required this.flutterLocalNotificationsPlugin,
    @required this.notificationDetails,
    @required this.iCalendarRepository,
  })  : assert(flutterLocalNotificationsPlugin != null),
        assert(notificationDetails != null),
        assert(iCalendarRepository != null),
        super(const AgendaState.initial());

  @override
  Stream<AgendaState> mapEventToState(
    AgendaEvent agendaEvent,
  ) async* {
    yield* agendaEvent.when(
      load: _mapAgendaLoadToState,
      download: _mapAgendaDownloadToState,
    );
  }

  Stream<AgendaState> _mapAgendaLoadToState(
      NotificationSettings notificationSettings) async* {
    yield const AgendaState.loading();
    try {
      final ParsedCalendar parsedCalendar =
          await iCalendarRepository.parsedCalendar;

      await flutterLocalNotificationsPlugin.cancelAll();

      final Iterable<Event> events = parsedCalendar.sortedByDTStart
          .where((event) => event.dtstart.isAfter(DateTime.now()));

      yield AgendaState.loaded(events.toList());

      if (notificationSettings.enabled) {
        await Future.wait(events.map((event) => event.addToNotification(
              flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
              notificationSettings: notificationSettings,
              notificationDetails: notificationDetails,
            )));
      }
    } on Exception catch (e) {
      yield AgendaState.error(e);
    }
  }

  Stream<AgendaState> _mapAgendaDownloadToState(
    String uid,
    String pswd,
    NotificationSettings notificationSettings,
  ) async* {
    yield const AgendaState.loading();
    try {
      await iCalendarRepository.download(
        username: uid,
        password: pswd,
      );
      add(AgendaEvent.load(notificationSettings: notificationSettings));
    } on Exception catch (e) {
      yield AgendaState.error(e);
    }
  }
}
