import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
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
  Stream<NotificationSettingsState> transformEvents(
    Stream<NotificationSettingsEvent> events,
    Stream<NotificationSettingsState> Function(NotificationSettingsEvent event)
        next,
  ) {
    final nonDebounceStream = events.where((event) {
      return event is! RangeChanged && event is! EarlyChanged;
    });
    final debounceStream = events.where((event) {
      return event is RangeChanged || event is EarlyChanged;
    }).debounceTime(const Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<NotificationSettingsState> mapEventToState(
    NotificationSettingsEvent event,
  ) async* {
    if (event is NotificationSettingsLoad) {
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
    } else if (event is SaveNotificationSettings) {
      try {
        await repository.save(event.settings);
        yield state.copyWith(isSaved: true);
      } catch (e) {
        yield state.copyWith(isSaved: false);
      }
    } else if (event is EnablingChanged) {
      yield state.update(
        enabled: event.enabled,
      );
    } else if (event is RangeChanged) {
      yield state.update(
        range: event.range,
      );
    } else if (event is EarlyChanged) {
      yield state.update(
        early: event.early,
      );
    }
  }
}
