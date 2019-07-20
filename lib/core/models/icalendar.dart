import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/funcs/http_calendar_url.dart';
import 'package:path_provider/path_provider.dart';

class ICalendar {
  Stream<String> _calendarStream;
  String _version = "";
  String _prodID = "";
  String _calscale = "";
  Timezone _timezone = Timezone();
  List<Map<String, String>> _events = [];

  String get calscale => _calscale;

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
  List<Map<String, String>> get events => _events;

  /// Production ID
  String get prodID => _prodID;

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
  Timezone get timezone => _timezone;

  String get version => _version;

  Future<File> get _calendar async {
    final path = await _localPath;
    return File('$path/calendar.ics');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// GET the .ics from url
  Future<void> getCalendar(String url) async {
    var client = HttpClient();
    client.badCertificateCallback = (cert, host, port) => true;

    try {
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        _calendarStream = response.cast<List<int>>().transform(utf8.decoder);
      } else
        throw Exception("HttpError: ${response.statusCode}");
    } catch (e) {
      throw e;
    }
  }

  /// Get existing the .ics from file
  Future<void> getCalendarFromFile() async {
    final file = await _calendar;
    if (!(await file.exists()))
      throw Exception("File calendar.ics do not exists");

    // Read the file
    _calendarStream = file.openRead().transform(utf8.decoder);
  }

  Future<void> parseCalendar() async {
    ICalSection mode = ICalSection.None;
    Map<String, String> vEvent = {};

    if (_calendarStream == null) {
      throw "Calendar stream not found. Please use getCalendar or getCalendarFromFile (after a saveCalendar).";
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
        _events.add(vEvent);
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
          if (line[0] == "TZID") _timezone.tzid = line[1];
          break;
        case ICalSection.STANDARD:
          _timezone.standard[line[0]] = line[1];
          break;
        case ICalSection.DAYLIGHT:
          _timezone.daylight[line[0]] = line[1];
          break;
        case ICalSection.None:
          if (line[0] == "VERSION") _version = line[1];
          if (line[0] == "PRODID") _prodID = line[1];
          if (line[0] == "CALSCALE") _calscale = line[1];
          break;
        default:
      }
    }
  }

  Future<void> saveCalendar(String url) async {
    final file = await _calendar;
    try {
      await getCalendar(url);
    } catch (e) {
      throw e;
    }

    var sink = file.openWrite();
    await for (var data in _calendarStream) sink.write(data);
    sink.close();

    CalendarURL.saveCalendarURL(url);
  }
}

enum ICalSection { None, VEVENT, VTIMEZONE, STANDARD, DAYLIGHT }

class Timezone {
  String tzid = "";
  Map<String, String> daylight = {};
  Map<String, String> standard = {};
}
