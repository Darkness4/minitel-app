import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/settings/notification_settings_data_source.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';

@LazySingleton(as: NotificationSettingsRepository)
class NotificationSettingsRepositoryImpl
    implements NotificationSettingsRepository {
  final NotificationSettingsDataSource localDataSource;

  const NotificationSettingsRepositoryImpl({this.localDataSource});

  @override
  NotificationSettings load() => localDataSource.loadNotificationSettings();

  @override
  Future<void> save(NotificationSettings settings) =>
      localDataSource.saveNotificationSettings(settings);
}
