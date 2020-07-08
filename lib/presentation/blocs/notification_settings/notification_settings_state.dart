part of 'notification_settings_bloc.dart';

@freezed
abstract class NotificationSettingsState with _$NotificationSettingsState {
  const factory NotificationSettingsState({
    @required @nullable NotificationSettings notificationSettings,
    @required @nullable bool isSaved,
    @required @nullable bool isLoaded,
  }) = _NotificationSettingsState;

  factory NotificationSettingsState.initial() {
    return const NotificationSettingsState(
      notificationSettings: NotificationSettings(
        early: Duration(minutes: 10),
        enabled: true,
        range: Duration(days: 30),
      ),
      isSaved: false,
      isLoaded: false,
    );
  }
}

extension NotificationSettingsStateX on NotificationSettingsState {
  NotificationSettingsState update({
    Duration early,
    Duration range,
    bool enabled,
    bool isLoaded,
  }) {
    return copyWith(
      notificationSettings: notificationSettings.copyWith(
        early: early ?? notificationSettings.early,
        enabled: enabled ?? notificationSettings.enabled,
        range: range ?? notificationSettings.range,
      ),
      isSaved: false,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
