import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';

part 'notification_settings_cubit.freezed.dart';
part 'notification_settings_state.dart';

@injectable
class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  final NotificationSettingsRepository repository;

  NotificationSettingsCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(NotificationSettingsState.initial());

  void earlyChanged(Duration early) {
    emit(state.update(early: early));
  }

  void rangeChanged(Duration range) {
    emit(state.update(range: range));
  }

  void enablingChanged(bool enabled) {
    emit(state.update(enabled: enabled));
  }

  Future<void> saveNotificationSettings(NotificationSettings settings) async {
    try {
      await repository.save(settings);
      emit(state.copyWith(isSaved: true));
    } catch (e) {
      emit(state.copyWith(isSaved: false));
    }
  }

  Future<void> notificationSettingsLoad() async {
    try {
      final settings = repository.load();
      emit(state.update(
        early: settings.early,
        enabled: settings.enabled,
        range: settings.range,
        isLoaded: true,
      ));
    } catch (e) {
      try {
        await repository.save(state.notificationSettings);
        emit(state.copyWith(
          isSaved: true,
          isLoaded: true,
        ));
      } catch (e) {
        emit(state.copyWith(
          isSaved: false,
          isLoaded: true,
        ));
      }
    }
  }
}
