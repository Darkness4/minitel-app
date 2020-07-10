import 'dart:async';

import 'package:cubit/cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

part 'agenda_cubit.freezed.dart';
part 'agenda_state.dart';

@injectable
class AgendaCubit extends Cubit<AgendaState> {
  final ICalendarRepository iCalendarRepository;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationDetails notificationDetails;

  AgendaCubit({
    @required this.flutterLocalNotificationsPlugin,
    @required this.notificationDetails,
    @required this.iCalendarRepository,
  })  : assert(flutterLocalNotificationsPlugin != null),
        assert(notificationDetails != null),
        assert(iCalendarRepository != null),
        super(const AgendaState.initial());

  Future<void> agendaLoad(NotificationSettings notificationSettings) async {
    emit(const AgendaState.loading());
    try {
      final parsedCalendar = await iCalendarRepository.parsedCalendar;

      await flutterLocalNotificationsPlugin.cancelAll();

      final events = parsedCalendar.sortedByDTStart
          .where((event) => event.dtstart.isAfter(DateTime.now()))
          .toList();

      emit(AgendaState.loaded(events));

      if (notificationSettings.enabled) {
        await Future.wait(events.map((event) => event.addToNotification(
              flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
              notificationSettings: notificationSettings,
              notificationDetails: notificationDetails,
            )));
      }
    } on Exception catch (e) {
      emit(AgendaState.error(e));
    }
  }

  Future<void> agendaDownload({
    @required String uid,
    @required String pswd,
    @required NotificationSettings notificationSettings,
  }) async {
    emit(const AgendaState.loading());
    try {
      await iCalendarRepository.download(
        username: uid,
        password: pswd,
      );
      await agendaLoad(notificationSettings);
    } on Exception catch (e) {
      emit(AgendaState.error(e));
    }
  }
}
