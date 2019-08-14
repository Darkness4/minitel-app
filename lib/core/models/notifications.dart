import 'package:shared_preferences/shared_preferences.dart';

/// Notifications settings
class NotificationSettings {
  /// Notify earlier than the indicated time
  Duration early = Duration(minutes: 10);

  /// Time range for the notification to work
  Duration range = Duration(days: 30);

  Future<void> loadSavedSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int earlyMinutes = prefs.getInt("early");
    int rangeDays = prefs.getInt("range");

    if (earlyMinutes != null && rangeDays != null) {
      // If has data
      early = Duration(minutes: earlyMinutes);
      range = Duration(days: rangeDays);
    } else {
      // Else, save ASAP
      await saveSettings();
    }
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setInt("early", early.inMinutes),
      prefs.setInt("range", range.inDays),
    ]);
  }
}
