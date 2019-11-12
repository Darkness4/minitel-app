import 'package:minitel_toolbox/data/datasources/settings_local_data_source.dart';
import 'package:minitel_toolbox/data/models/notifications_model.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';

class NotificationSettingsRepositoryImpl
    implements NotificationSettingsRepository {
  final SettingsLocalDataSource localDataSource;

  const NotificationSettingsRepositoryImpl({this.localDataSource});

  @override
  NotificationSettings load() => localDataSource.loadNotificationSettings();

  @override
  Future<void> save(NotificationSettings settings) => localDataSource
      .saveNotificationSettings(settings as NotificationSettingsModel);
}
