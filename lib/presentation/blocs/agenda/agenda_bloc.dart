import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

part 'agenda_event.dart';
part 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  final ICalendarRepository iCalendarRepository;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationDetails notificationDetails;

  AgendaBloc({
    @required this.flutterLocalNotificationsPlugin,
    @required this.notificationDetails,
    @required this.iCalendarRepository,
  });

  @override
  AgendaState get initialState => const AgendaInitial();

  @override
  Stream<AgendaState> mapEventToState(
    AgendaEvent agendaEvent,
  ) async* {
    if (agendaEvent is AgendaLoad) {
      yield* _mapAgendaLoadToState(agendaEvent);
    } else if (agendaEvent is AgendaDownload) {
      yield* _mapAgendaDownloadToState(agendaEvent);
    }
  }

  Stream<AgendaState> _mapAgendaLoadToState(AgendaLoad agendaEvent) async* {
    yield const AgendaLoading();
    try {
      final ParsedCalendar parsedCalendar =
          await iCalendarRepository.parsedCalendar;

      await flutterLocalNotificationsPlugin.cancelAll();

      print(
          "Notifications set up with settings: ${agendaEvent.notificationSettings.toString()}");

      final Iterable<Event> events = parsedCalendar.sortedByDTStart
          .where((event) => event.dtstart.isAfter(DateTime.now()));

      yield AgendaLoaded(events: events.toList());

      if (agendaEvent.notificationSettings.enabled) {
        events.forEach((event) => event.addToNotification(
              flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
              notificationSettings: agendaEvent.notificationSettings,
              notificationDetails: notificationDetails,
            ));
      }
    } catch (e) {
      yield AgendaError(e);
    }
  }

  Stream<AgendaState> _mapAgendaDownloadToState(
      AgendaDownload agendaEvent) async* {
    yield const AgendaLoading();
    try {
      await iCalendarRepository.download(
        username: agendaEvent.uid,
        password: agendaEvent.pswd,
      );
      add(AgendaLoad(notificationSettings: agendaEvent.notificationSettings));
    } catch (e) {
      yield AgendaError(e);
    }
  }
}
