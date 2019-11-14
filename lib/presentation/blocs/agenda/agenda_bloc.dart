import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:rxdart/rxdart.dart';

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
      yield const AgendaLoading();
      try {
        final ParsedCalendar parsedCalendar =
            await iCalendarRepository.parsedCalendar;

        await flutterLocalNotificationsPlugin.cancelAll();

        print(
            "Notifications set up with settings: ${agendaEvent.notificationSettings.toString()}");

        final Stream<Event> events = parsedCalendar.sortedEvents
            .where((event) => event.dtstart.isAfter(DateTime.now()))
            .doOnData((event) => event.addToNotification(
                  flutterLocalNotificationsPlugin:
                      flutterLocalNotificationsPlugin,
                  notificationSettings: agendaEvent.notificationSettings,
                  notificationDetails: notificationDetails,
                ));

        yield AgendaLoaded(events: events);
      } catch (e) {
        yield AgendaError(e);
      }
    } else if (agendaEvent is AgendaDownload) {
      yield const AgendaLoading();
      await iCalendarRepository.download(
        username: agendaEvent.uid,
        password: agendaEvent.pswd,
      );
      add(AgendaLoad(notificationSettings: agendaEvent.notificationSettings));
    }
  }
}
