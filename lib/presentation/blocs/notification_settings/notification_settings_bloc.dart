import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';

import 'bloc.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  final NotificationSettingsRepository repository;

  NotificationSettingsBloc({
    @required this.repository,
  }) : assert(repository != null);

  @override
  NotificationSettingsState get initialState =>
      const NotificationSettingsStateInitial();

  @override
  Stream<NotificationSettingsState> mapEventToState(
    NotificationSettingsEvent event,
  ) async* {
    if (event is GetNotificationSettingsEvent) {
      yield const NotificationSettingsStateLoading();
      try {
        final settings = repository.load();
        yield NotificationSettingsStateLoaded(settings: settings);
      } catch (e) {
        yield NotificationSettingsStateError(message: e.toString());
      }
    } else if (event is SetNotificationSettingsEvent) {
      yield const NotificationSettingsStateLoading();
      try {
        await repository.save(event.settings);
        add(const GetNotificationSettingsEvent());
      } catch (e) {
        yield NotificationSettingsStateError(message: e.toString());
      }
    }
  }
}
