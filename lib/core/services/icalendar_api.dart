import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:path_provider/path_provider.dart';

/// ICalendar model
///
/// Use [saveCalendar(String url)] to create/update the calendar. It needs the
/// calendarUrlAPI to work.
/// If the calendar has been succefully updated, uses [getCalendarFromFile] and
/// [parseCalendar] to finally get a parsed calendar.
class ICalendarAPI {
  /// Get PATH of file
  static Future<String> get calendarPATH async {
    final String path = await _localPath;
    return '$path/calendar.ics';
  }

  static Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// Get the calendar from url and save the .ics (and the url)
  Future<String> downloadCalendar(String url) async {
    final File file = File(await calendarPATH);

    final IOSink sink = file.openWrite();
    final Stream<String> stream = await _getICalendar(url);

    await stream.forEach(sink.write);
    await sink.close();

    await CalendarUrlAPI.saveCalendarURL(url);

    return calendarPATH;
  }

  /// HTTP GET the .ics from url
  Future<Stream<String>> _getICalendar(String url) async {
    final HttpClient client = HttpClient();

    final HttpClientRequest request = await client.getUrl(Uri.parse(url));
    final HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return response.transform(utf8.decoder);
    } else {
      throw HttpException("HttpError: ${response.statusCode}");
    }
  }
}
