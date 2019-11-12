import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CalendarURLLocalDataSource {
  /// Get cached .ics url
  Future<String> get lastCalendarURL;

  /// Save .ics url
  Future<void> saveCalendarURL(String url);
}

/// Calendar Url "API"
class CalendarURLLocalDataSourceImpl implements CalendarURLLocalDataSource {
  final SharedPreferences prefs;

  const CalendarURLLocalDataSourceImpl({this.prefs});

  /// Get from SharedPrefs the url to get the ical
  @override
  Future<String> get lastCalendarURL async {
    final String contents = prefs.getString(CacheConstants.calendarURL);

    if (contents != null && contents.isNotEmpty) {
      return contents;
    } else {
      throw CacheException();
    }
  }

  /// Save the url to get the ical in a SharedPrefs
  @override
  Future<void> saveCalendarURL(String url) =>
      prefs.setString(CacheConstants.calendarURL, url);
}
