import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';

@immutable
abstract class NotificationSettingsState extends Equatable {
  const NotificationSettingsState();
}

class NotificationSettingsStateError extends NotificationSettingsState {
  final String message;

  const NotificationSettingsStateError({@required this.message});

  @override
  List<Object> get props => [message];
}

class NotificationSettingsStateInitial extends NotificationSettingsState {
  const NotificationSettingsStateInitial();
  @override
  List<Object> get props => [];
}

class NotificationSettingsStateLoaded extends NotificationSettingsState {
  final NotificationSettings settings;

  const NotificationSettingsStateLoaded({@required this.settings});

  @override
  List<Object> get props => [settings];
}

class NotificationSettingsStateLoading extends NotificationSettingsState {
  const NotificationSettingsStateLoading();
  @override
  List<Object> get props => [];
}
