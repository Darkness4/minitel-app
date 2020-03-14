import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';

part 'notification_settings_event.dart';
part 'notification_settings_state.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  final NotificationSettingsRepository repository;

  NotificationSettingsBloc({
    @required this.repository,
  }) : assert(repository != null);

  @override
  NotificationSettingsState get initialState =>
      NotificationSettingsState.initial();

  @override
  Stream<NotificationSettingsState> mapEventToState(
    NotificationSettingsEvent event,
  ) async* {
    if (event is NotificationSettingsLoad) {
      yield* _mapNotificationSettingsLoadToState();
    } else if (event is SaveNotificationSettings) {
      yield* _mapSaveNotificationSettingsToState(event);
    } else if (event is EnablingChanged) {
      yield* _mapEnablingChangedToState(event);
    } else if (event is RangeChanged) {
      yield* _mapRangeChangedToState(event);
    } else if (event is EarlyChanged) {
      yield* _mapEarlyChangedToState(event);
    }
  }

  Stream<NotificationSettingsState> _mapEarlyChangedToState(
      EarlyChanged event) async* {
    yield state.update(
      early: event.early,
    );
  }

  Stream<NotificationSettingsState> _mapRangeChangedToState(
      RangeChanged event) async* {
    yield state.update(
      range: event.range,
    );
  }

  Stream<NotificationSettingsState> _mapEnablingChangedToState(
      EnablingChanged event) async* {
    yield state.update(
      enabled: event.enabled,
    );
  }

  Stream<NotificationSettingsState> _mapSaveNotificationSettingsToState(
      SaveNotificationSettings event) async* {
    try {
      await repository.save(event.settings);
      yield state.copyWith(isSaved: true);
    } catch (e) {
      yield state.copyWith(isSaved: false);
    }
  }

  Stream<NotificationSettingsState>
      _mapNotificationSettingsLoadToState() async* {
    try {
      final settings = repository.load();
      yield state.update(
        early: settings.early,
        enabled: settings.enabled,
        range: settings.range,
        isLoaded: true,
      );
    } catch (e) {
      print("No notification settings saved. Saving a new one...");
      add(SaveNotificationSettings(state.notificationSettings));
      yield state.update(
        isLoaded: true,
      );
    }
  }
}
