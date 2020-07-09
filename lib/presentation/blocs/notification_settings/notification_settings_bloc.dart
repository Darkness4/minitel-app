import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';

part 'notification_settings_bloc.freezed.dart';
part 'notification_settings_event.dart';
part 'notification_settings_state.dart';

@injectable
class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  final NotificationSettingsRepository repository;

  NotificationSettingsBloc({
    @required this.repository,
  })  : assert(repository != null),
        super(NotificationSettingsState.initial());

  @override
  Stream<NotificationSettingsState> mapEventToState(
    NotificationSettingsEvent event,
  ) {
    return event.when(
      load: _mapNotificationSettingsLoadToState,
      save: _mapSaveNotificationSettingsToState,
      enablingChanged: _mapEnablingChangedToState,
      rangeChanged: _mapRangeChangedToState,
      earlyChanged: _mapEarlyChangedToState,
    );
  }

  Stream<NotificationSettingsState> _mapEarlyChangedToState(
      Duration early) async* {
    yield state.update(early: early);
  }

  Stream<NotificationSettingsState> _mapRangeChangedToState(
      Duration range) async* {
    yield state.update(range: range);
  }

  Stream<NotificationSettingsState> _mapEnablingChangedToState(
      bool enabled) async* {
    yield state.update(enabled: enabled);
  }

  Stream<NotificationSettingsState> _mapSaveNotificationSettingsToState(
      NotificationSettings settings) async* {
    try {
      await repository.save(settings);
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
      add(SaveNotificationSettings(state.notificationSettings));
      yield state.update(
        isLoaded: true,
      );
    }
  }
}
