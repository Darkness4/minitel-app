part of 'notification_settings_bloc.dart';

class NotificationSettingsState extends Equatable {
  final NotificationSettings notificationSettings;

  final bool isSaved;
  final bool isLoaded;

  const NotificationSettingsState({
    @required this.notificationSettings,
    @required this.isSaved,
    @required this.isLoaded,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        this.notificationSettings,
        this.isSaved,
        this.isLoaded,
      ];

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

  NotificationSettingsState update({
    Duration early,
    Duration range,
    bool enabled,
    bool isLoaded,
  }) {
    return copyWith(
      notificationSettings: notificationSettings.copyWith(
        early: early,
        enabled: enabled,
        range: range,
      ),
      isSaved: false,
      isLoaded: isLoaded,
    );
  }

  NotificationSettingsState copyWith({
    NotificationSettings notificationSettings,
    bool isSaved,
    bool isLoaded,
  }) {
    return NotificationSettingsState(
      notificationSettings: notificationSettings ?? this.notificationSettings,
      isSaved: isSaved ?? this.isSaved,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
