import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications.freezed.dart';

/// Notifications settings
@freezed
abstract class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(Duration(minutes: 10)) @nullable Duration early,
    @Default(Duration(days: 30)) @nullable Duration range,
    @Default(true) @nullable bool enabled,
  }) = _NotificationSettings;
}
