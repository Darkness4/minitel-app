import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/cache_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationSettingsDataSource {
  /// Load notifications settings from SharedPreferences
  NotificationSettings loadNotificationSettings();

  /// Save notifications settings to SharedPreferences
  Future<void> saveNotificationSettings(NotificationSettings settings);
}

@LazySingleton(as: NotificationSettingsDataSource)
class NotificationSettingsDataSourceImpl
    implements NotificationSettingsDataSource {
  final SharedPreferences prefs;

  const NotificationSettingsDataSourceImpl({@required this.prefs});

  @override
  NotificationSettings loadNotificationSettings() {
    if (prefs.containsKey(CacheKeys.early) &&
        prefs.containsKey(CacheKeys.range) &&
        prefs.containsKey(CacheKeys.enabled)) {
      final earlyMinutes = prefs.getInt(CacheKeys.early);
      final rangeDays = prefs.getInt(CacheKeys.range);
      final enabled = prefs.getBool(CacheKeys.enabled);

      return NotificationSettings(
        early: Duration(minutes: earlyMinutes),
        range: Duration(days: rangeDays),
        enabled: enabled,
      );
    } else {
      throw CacheException('No notificationSettings saved.');
    }
  }

  @override
  Future<void> saveNotificationSettings(NotificationSettings settings) {
    return Future.wait<bool>([
      prefs.setInt(CacheKeys.early, settings.early.inMinutes),
      prefs.setInt(CacheKeys.range, settings.range.inDays),
      prefs.setBool(CacheKeys.enabled, settings.enabled),
    ]);
  }
}
