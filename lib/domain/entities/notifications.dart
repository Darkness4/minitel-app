import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications.freezed.dart';

/// Notifications settings
@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(Duration(minutes: 10)) Duration early,
    @Default(Duration(days: 30)) Duration range,
    @Default(true) bool enabled,
  }) = _NotificationSettings;
}
