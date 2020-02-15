import 'package:minitel_toolbox/domain/entities/notifications.dart';

abstract class NotificationSettingsRepository {
  Future<void> save(NotificationSettings settings);
  NotificationSettings load();
}
