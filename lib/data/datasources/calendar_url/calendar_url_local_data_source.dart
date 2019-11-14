import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/cache_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CalendarURLLocalDataSource {
  /// Get cached .ics url
  Future<String> getLastCalendarURL();

  /// Save .ics url
  Future<void> saveCalendarURL(String url);
}

/// Calendar Url "API"
class CalendarURLLocalDataSourceImpl implements CalendarURLLocalDataSource {
  final SharedPreferences prefs;

  const CalendarURLLocalDataSourceImpl({@required this.prefs});

  /// Get from SharedPrefs the url to get the ical
  @override
  Future<String> getLastCalendarURL() async {
    final String contents = prefs.getString(CacheKeys.calendarURL);

    if (contents != null && contents.isNotEmpty) {
      return contents;
    } else {
      throw CacheException();
    }
  }

  /// Save the url to get the ical in a SharedPrefs
  @override
  Future<void> saveCalendarURL(String url) =>
      prefs.setString(CacheKeys.calendarURL, url);
}
