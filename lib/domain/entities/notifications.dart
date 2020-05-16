import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications.freezed.dart';

/// Notifications settings
@freezed
abstract class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @required @nullable Duration early,
    @required @nullable Duration range,
    @required @nullable bool enabled,
  }) = _NotificationSettings;
}
