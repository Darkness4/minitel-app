import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:minitel_toolbox/presentation/cubits/news/notification_settings/notification_settings_cubit.dart';

part 'agenda_cubit.freezed.dart';
part 'agenda_state.dart';

@injectable
class AgendaCubit extends Cubit<AgendaState> {
  final ICalendarRepository iCalendarRepository;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationDetails notificationDetails;
  final NotificationSettingsCubit? notificationSettingsCubit;
  late StreamSubscription<NotificationSettingsState> subscription;

  AgendaCubit({
    required this.flutterLocalNotificationsPlugin,
    required this.notificationDetails,
    required this.iCalendarRepository,
    @factoryParam required this.notificationSettingsCubit,
  }) : super(const AgendaState.initial()) {
    subscription =
        notificationSettingsCubit!.stream.listen((notificationSettingsState) {
      if (notificationSettingsState.isLoaded) {
        if (state is AgendaInitial) {
          agendaLoad(notificationSettingsState.notificationSettings);
        }
      }
    });
    notificationSettingsCubit!.notificationSettingsLoad();
  }

  Future<void> agendaLoad(NotificationSettings notificationSettings) async {
    emit(const AgendaState.loading());
    try {
      final parsedCalendar = await iCalendarRepository.parsedCalendar;

      await flutterLocalNotificationsPlugin.cancelAll();

      final events = parsedCalendar.events
          .sortedBy<DateTime>((Event e) => e.dtstart)
          .where((Event e) => e.dtstart.isAfter(DateTime.now()))
          .toList();

      emit(AgendaState.loaded(events));

      if (notificationSettings.enabled) {
        await Future.wait(events.map((event) => event.addToNotification(
              flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
              notificationSettings: notificationSettings,
              notificationDetails: notificationDetails,
            )));
        print('Scheduled ${events.length} !');
      }
    } on Exception catch (e) {
      emit(AgendaState.error(e));
    }
  }

  Future<void> agendaDownload({
    required String uid,
    required String pswd,
    required NotificationSettings notificationSettings,
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

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
