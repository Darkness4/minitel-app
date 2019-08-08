import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:path_provider/path_provider.dart';

class ParsedCalendar {
  String version = "";
  String prodID = "";
  String calscale = "";

  /// Timezone standard and daylight
  ///
  /// [Timezone.tzid] is the actual timezone
  /// Timezone.tzid.daylight["FIELD"] to get infos on daylight
  /// Timezone.tzid.standard["FIELD"] to get infos on standard
  ///
  /// Fields:
  /// - DTSTART
  /// - TZOFFSETTO
  /// - TZOFFSETFROM
  /// - RRULE
  /// - TZNAME
  Timezone timezone = Timezone();

  /// events[event_i]["FIELD"]
  ///
  /// Fields:
  /// - DTEND
  /// - UID
  /// - DTSTAMP
  /// - LOCATION
  /// - DESCRIPTION (Participating Professors)
  /// - SUMMARY (Name of the course)
  /// - DTSTART
  List<Map<String, String>> events = [];
}

/// ICalendar model
///
/// Use [saveCalendar(String url)] to create/update the calendar. It needs the
/// calendarUrlAPI to work.
/// If the calendar has been succefully updated, uses [getCalendarFromFile] and
/// [parseCalendar] to finally get a parsed calendar.
class ICalendar {
  Stream<String> _calendarStream;
  final CalendarUrlAPI calendarUrlAPI;
  ICalendar(this.calendarUrlAPI);

  Future<File> get _calendar async {
    final path = await _localPath;
    return File('$path/calendar.ics');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// GET the .ics from url
  Future<void> _getICalendar(String url) async {
    var client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;

    HttpClientRequest request = await client.getUrl(Uri.parse(url))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      _calendarStream = response.cast<List<int>>().transform(utf8.decoder);
    } else {
      throw Exception("HttpError: ${response.statusCode}");
    }
  }

  /// Get existing the stream .ics from file
  Future<void> getCalendarFromFile() async {
    final file = await _calendar;
    if (!(await file.exists())) {
      throw Exception("File calendar.ics do not exists");
    }

    // Read the file
    _calendarStream = file.openRead().transform(utf8.decoder);
  }

  /// Parse the ical to a json-like structure
  Future<ParsedCalendar> parseCalendar() async {
    ParsedCalendar parsedCalendar = ParsedCalendar();
    ICalSection mode = ICalSection.None;
    Map<String, String> vEvent = {};

    if (_calendarStream == null) {
      throw Exception(
          "Calendar stream not found. Please use getCalendar or getICalendarFromFile (after a saveCalendar).");
    }

    await for (var data in _calendarStream.transform(LineSplitter())) {
      var line = data.trim().split(":");
      // Inside a VEVENT
      if (line[0] == 'BEGIN' && line[1] == 'VEVENT') {
        vEvent = {};
        mode = ICalSection.VEVENT;
        continue; // Skip BEGIN:VEVENT
      }
      if (line[0] == 'END' && line[1] == 'VEVENT') {
        parsedCalendar.events.add(vEvent);
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

      switch (mode) {
        case ICalSection.VEVENT:
          vEvent[line[0]] = line[1];
          break;
        case ICalSection.VTIMEZONE:
          if (line[0] == "TZID") parsedCalendar.timezone.tzid = line[1];
          break;
        case ICalSection.STANDARD:
          parsedCalendar.timezone.standard[line[0]] = line[1];
          break;
        case ICalSection.DAYLIGHT:
          parsedCalendar.timezone.daylight[line[0]] = line[1];
          break;
        case ICalSection.None:
          if (line[0] == "VERSION") parsedCalendar.version = line[1];
          if (line[0] == "PRODID") parsedCalendar.prodID = line[1];
          if (line[0] == "CALSCALE") parsedCalendar.calscale = line[1];
          break;
        default:
      }
    }
    return parsedCalendar;
  }

  /// Get the calendar from url and save the .ics (and the url)
  Future<void> saveCalendar(String url) async {
    final file = await _calendar;
    await _getICalendar(url);

    var sink = file.openWrite();
    _calendarStream.listen(
      (var data) => sink.write(data),
      onDone: sink.close,
    );

    await calendarUrlAPI.saveCalendarURL(url);
  }
}

enum ICalSection { None, VEVENT, VTIMEZONE, STANDARD, DAYLIGHT }

class Timezone {
  String tzid = "";
  Map<String, String> daylight = {};
  Map<String, String> standard = {};
}
