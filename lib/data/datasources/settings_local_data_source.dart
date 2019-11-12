import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/data/models/notifications_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  /// Load notifications settings from SharedPreferences
  NotificationSettingsModel loadNotificationSettings();

  /// Save notifications settings to SharedPreferences
  Future<void> saveNotificationSettings(NotificationSettingsModel settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences prefs;

  const SettingsLocalDataSourceImpl({@required this.prefs});

  @override
  NotificationSettingsModel loadNotificationSettings() {
    final int earlyMinutes = prefs.getInt(CacheConstants.early);
    final int rangeDays = prefs.getInt(CacheConstants.range);
    final bool enabled = prefs.getBool(CacheConstants.enabled);

    return NotificationSettingsModel(
      early: Duration(minutes: earlyMinutes),
      range: Duration(days: rangeDays),
      enabled: enabled,
    );
  }

  @override
  Future<void> saveNotificationSettings(NotificationSettingsModel settings) {
    return Future.wait(<Future<bool>>[
      prefs.setInt(CacheConstants.early, settings.early.inMinutes),
      prefs.setInt(CacheConstants.range, settings.range.inDays),
      prefs.setBool(CacheConstants.enabled, settings.enabled),
    ]);
  }
}
