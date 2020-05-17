part of 'notification_settings_bloc.dart';

@freezed
abstract class NotificationSettingsEvent with _$NotificationSettingsEvent {
  const factory NotificationSettingsEvent.load() = NotificationSettingsLoad;
  const factory NotificationSettingsEvent.save(NotificationSettings settings) =
      SaveNotificationSettings;
  const factory NotificationSettingsEvent.enablingChanged(bool enabled) =
      EnablingChanged;
  const factory NotificationSettingsEvent.rangeChanged(Duration range) =
      RangeChanged;
  const factory NotificationSettingsEvent.earlyChanged(Duration early) =
      EarlyChanged;
}
