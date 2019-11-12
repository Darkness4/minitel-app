import 'package:minitel_toolbox/domain/entities/notifications.dart';

class NotificationSettingsModel extends NotificationSettings {
  const NotificationSettingsModel({
    Duration early = const Duration(minutes: 10),
    Duration range = const Duration(days: 30),
    bool enabled = true,
  }) : super(
          early: early,
          range: range,
          enabled: enabled,
        );
}
