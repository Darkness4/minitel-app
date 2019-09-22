import 'package:shared_preferences/shared_preferences.dart';

/// Notifications settings
class NotificationSettings {
  /// Notify earlier than the indicated time
  Duration early = const Duration(minutes: 10);

  /// Time range for the notification to work
  Duration range = const Duration(days: 30);

  /// Enable notifications
  bool enabled = true;

  Future<void> loadSavedSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int earlyMinutes = prefs.getInt("early");
    final int rangeDays = prefs.getInt("range");
    final bool enabledPrefs = prefs.getBool("enabled");

    if (earlyMinutes != null && rangeDays != null && enabled != null) {
      // If has data
      early = Duration(minutes: earlyMinutes);
      range = Duration(days: rangeDays);
      enabled = enabledPrefs;
    } else {
      // Else, save ASAP
      await saveSettings();
    }
  }

  Future<void> saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.wait(<Future<bool>>[
      prefs.setInt("early", early.inMinutes),
      prefs.setInt("range", range.inDays),
      prefs.setBool("enabled", enabled)
    ]);
  }
}
