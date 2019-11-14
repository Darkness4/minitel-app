part of 'notification_settings_bloc.dart';

class NotificationSettingsLoad extends NotificationSettingsEvent {
  const NotificationSettingsLoad();
}

abstract class NotificationSettingsEvent extends Equatable {
  const NotificationSettingsEvent();

  @override
  List<Object> get props => [];
}

class SaveNotificationSettings extends NotificationSettingsEvent {
  final NotificationSettings settings;

  const SaveNotificationSettings(this.settings);
}

class EnablingChanged extends NotificationSettingsEvent {
  final bool enabled;

  const EnablingChanged({
    @required this.enabled,
  });

  @override
  List<Object> get props => [enabled];
}

class RangeChanged extends NotificationSettingsEvent {
  final Duration range;

  const RangeChanged({
    @required this.range,
  });

  @override
  List<Object> get props => [range];
}

class EarlyChanged extends NotificationSettingsEvent {
  final Duration early;

  const EarlyChanged({
    @required this.early,
  });

  @override
  List<Object> get props => [early];
}
