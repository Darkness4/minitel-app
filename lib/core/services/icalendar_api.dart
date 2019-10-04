import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/models/icalendar/event.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:path_provider/path_provider.dart';

/// ICalendar model
///
/// Use [saveCalendar(String url)] to create/update the calendar. It needs the
/// calendarUrlAPI to work.
/// If the calendar has been succefully updated, uses [getCalendarFromFile] and
/// [parseCalendar] to finally get a parsed calendar.
class ICalendarAPI {
  Future<File> get _calendar async {
    final String path = await _localPath;
    return File('$path/calendar.ics');
  }

  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// Get existing the stream .ics from file
  Future<ParsedCalendar> getParsedCalendarFromFile() async {
    final File file = await _calendar;
    final ParsedCalendar parsedCalendar = ParsedCalendar();
    ICalSection mode = ICalSection.None;
    final Map<String, String> vEvent = <String, String>{};

    if (!file.existsSync()) {
      throw FileCalendarNotExistException();
    }

    // Use this line of code to inject a template.ics
    // await file
    //     .writeAsString(await rootBundle.loadString(AssetsPaths.TemplateICS));

    // Read the file
    final Stream<String> calendarStream =
        file.openRead().transform(utf8.decoder);

    final Stream<String> lines = calendarStream.transform(const LineSplitter());

    await for (final String data in lines) {
      final List<String> line = data.trim().split(":");
      // Inside a VEVENT
      if (line[0] == 'BEGIN' && line[1] == 'VEVENT') {
        vEvent.clear();
        mode = ICalSection.VEVENT;
        continue; // Skip BEGIN:VEVENT
      }
      if (line[0] == 'END' && line[1] == 'VEVENT') {
        parsedCalendar.events.add(Event.fromMap(vEvent));
        mode = ICalSection.None;
        continue; // Skip END:VEVENT
      }
      if (line[0] == 'BEGIN' && line[1] == 'VTIMEZONE') {
        mode = ICalSection.VTIMEZONE;
        continue; // Skip BEGIN:VTIMEZONE
      }
      if (line[0] == 'END' && line[1] == 'VTIMEZONE') {
        mode = ICalSection.None;
        continue; // Skip END:VTIMEZONE
      }
      if (line[0] == 'BEGIN' && line[1] == 'STANDARD') {
        mode = ICalSection.STANDARD;
        continue; // Skip BEGIN:STANDARD
      }
      if (line[0] == 'END' && line[1] == 'STANDARD') {
        mode = ICalSection.VTIMEZONE;
        continue; // Skip END:STANDARD
      }
      if (line[0] == 'BEGIN' && line[1] == 'DAYLIGHT') {
        mode = ICalSection.DAYLIGHT;
        continue; // Skip BEGIN:DAYLIGHT
      }
      if (line[0] == 'END' && line[1] == 'DAYLIGHT') {
        mode = ICalSection.VTIMEZONE;
        continue; // Skip END:DAYLIGHT
      }

      if (line.length >= 2) {
        switch (mode) {
          case ICalSection.VEVENT:
            vEvent[line[0]] = line[1];
            break;
          case ICalSection.VTIMEZONE:
            if (line[0] == "TZID") {
              parsedCalendar.timezone.tzid = line[1];
            }
            break;
          case ICalSection.STANDARD:
            parsedCalendar.timezone.standard.set(line[0], line[1]);
            break;
          case ICalSection.DAYLIGHT:
            parsedCalendar.timezone.daylight.set(line[0], line[1]);
            break;
          case ICalSection.None:
            parsedCalendar.set(line[0], line[1]);
            break;
        }
      }
    }

    return parsedCalendar;
  }

  /// Get the calendar from url and save the .ics (and the url)
  Future<void> saveCalendar(String url, CalendarUrlAPI calendarUrlAPI) async {
    final File file = await _calendar;

    final IOSink sink = file.openWrite();
    final Stream<String> stream = await _getICalendar(url);

    await stream.forEach(sink.write);
    await sink.close();

    await calendarUrlAPI.saveCalendarURL(url);
  }

  /// GET the .ics from url
  Future<Stream<String>> _getICalendar(String url) async {
    final HttpClient client = HttpClient();

    final HttpClientRequest request = await client.getUrl(Uri.parse(url));
    final HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return response.transform(utf8.decoder);
    } else {
      throw Exception("HttpError: ${response.statusCode}");
    }
  }
}

/// Section of an icalendar
enum ICalSection { None, VEVENT, VTIMEZONE, STANDARD, DAYLIGHT }

class FileCalendarNotExistException implements Exception {
  @override
  String toString() {
    return "File calendar.ics do not exists";
  }
}
