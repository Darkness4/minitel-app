import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/cache_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/notifications_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationSettingsDataSource {
  /// Load notifications settings from SharedPreferences
  NotificationSettingsModel loadNotificationSettings();

  /// Save notifications settings to SharedPreferences
  Future<void> saveNotificationSettings(NotificationSettingsModel settings);
}

class NotificationSettingsDataSourceImpl
    implements NotificationSettingsDataSource {
  final SharedPreferences prefs;

  const NotificationSettingsDataSourceImpl({@required this.prefs});

  @override
  NotificationSettingsModel loadNotificationSettings() {
    if (prefs.containsKey(CacheKeys.early) &&
        prefs.containsKey(CacheKeys.range) &&
        prefs.containsKey(CacheKeys.enabled)) {
      final int earlyMinutes = prefs.getInt(CacheKeys.early);
      final int rangeDays = prefs.getInt(CacheKeys.range);
      final bool enabled = prefs.getBool(CacheKeys.enabled);

      return NotificationSettingsModel(
        early: Duration(minutes: earlyMinutes),
        range: Duration(days: rangeDays),
        enabled: enabled,
      );
    } else {
      throw CacheException("No notificationSettings saved.");
    }
  }

  @override
  Future<void> saveNotificationSettings(NotificationSettingsModel settings) {
    return Future.wait(<Future<bool>>[
      prefs.setInt(CacheKeys.early, settings.early.inMinutes),
      prefs.setInt(CacheKeys.range, settings.range.inDays),
      prefs.setBool(CacheKeys.enabled, settings.enabled),
    ]);
  }
}