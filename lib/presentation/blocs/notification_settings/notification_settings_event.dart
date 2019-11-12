import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';

class GetNotificationSettingsEvent extends NotificationSettingsEvent {
  const GetNotificationSettingsEvent();
  @override
  List<Object> get props => [];
}

class SetNotificationSettingsEvent extends NotificationSettingsEvent {
  final NotificationSettings settings;

  const SetNotificationSettingsEvent(this.settings);

  @override
  List<Object> get props => [settings];
}

@immutable
abstract class NotificationSettingsEvent extends Equatable {
  const NotificationSettingsEvent();
}
