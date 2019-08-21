import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/models/icalendar/event.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:path_provider/path_provider.dart';

/// ICalendar model
///
/// Use [saveCalendar(String url)] to create/update the calendar. It needs the
/// calendarUrlAPI to work.
/// If the calendar has been succefully updated, uses [getCalendarFromFile] and
/// [parseCalendar] to finally get a parsed calendar.
class ICalendar {
  Future<File> get _calendar async {
    final path = await _localPath;
    return File('$path/calendar.ics');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// Get existing the stream .ics from file
  Future<ParsedCalendar> getParsedCalendarFromFile() async {
    final file = await _calendar;
    final parsedCalendar = ParsedCalendar();
    var mode = ICalSection.None;
    var vEvent = <String, String>{};

    if (!file.existsSync()) {
      throw Exception("File calendar.ics do not exists");
    }

    // Use this line of code to inject a template.ics
    // await file
    //     .writeAsString(await rootBundle.loadString(AssetsPaths.TemplateICS));

    // Read the file
    final calendarStream = file.openRead().transform(utf8.decoder);

    final lines = calendarStream.transform(const LineSplitter());

    await for (final data in lines) {
      final line = data.trim().split(":");
      // Inside a VEVENT
      if (line[0] == 'BEGIN' && line[1] == 'VEVENT') {
        vEvent = <String, String>{};
        mode = ICalSection.VEVENT;
        continue; // Skip BEGIN:VEVENT
      }
      if (line[0] == 'END' && line[1] == 'VEVENT') {
        parsedCalendar.events.add(Event.fromJson(vEvent));
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
            if (line[0] == "TZID") parsedCalendar.timezone.tzid = line[1];
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
    final file = await _calendar;

    final sink = file.openWrite();
    final stream = await _getICalendar(url);
    stream.listen(
      (var data) => sink.write(data),
      onDone: sink.close,
    );

    await calendarUrlAPI.saveCalendarURL(url);
  }

  /// GET the .ics from url
  Future<Stream<String>> _getICalendar(String url) async {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(url))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    final HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return response.cast<List<int>>().transform(utf8.decoder);
    } else {
      throw Exception("HttpError: ${response.statusCode}");
    }
  }
}

/// Section of an icalendar
enum ICalSection { None, VEVENT, VTIMEZONE, STANDARD, DAYLIGHT }
