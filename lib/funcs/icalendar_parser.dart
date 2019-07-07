import 'dart:convert';
import 'dart:io';

enum _Mode { None, VEVENT, VTIMEZONE, STANDARD, DAYLIGHT }

/// GET the .ics from url
Future<Stream<String>> getCalendar(String url) async {
  var client = HttpClient();
  client.badCertificateCallback = (cert, host, port) => true;

  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return response.cast<List<int>>().transform(utf8.decoder);
    } else
      throw Exception("HttpError: ${response.statusCode}");
  } catch (e) {}

  throw Exception("getCalender ends unexpectedly!");
}

Future<ICalendar> parseCalendar(Stream<String> calendar) async {
  ICalendar iCalendar = ICalendar();

  _Mode mode = _Mode.None;
  Map<String, String> vEvent = {};

  await for (var data in calendar.transform(LineSplitter())) {
    var line = data.trim().split(":");
    // Inside a VEVENT
    if (line[0] == 'BEGIN' && line[1] == 'VEVENT') {
      vEvent = {};
      mode = _Mode.VEVENT;
      continue; // Skip BEGIN:VEVENT
    }
    if (line[0] == 'END' && line[1] == 'VEVENT') {
      iCalendar.events.add(vEvent);
      mode = _Mode.None;
      continue; // Skip END:VEVENT
    }
    if (line[0] == 'BEGIN' && line[1] == 'VTIMEZONE') {
      mode = _Mode.VTIMEZONE;
      continue; // Skip BEGIN:VTIMEZONE
    }
    if (line[0] == 'END' && line[1] == 'VTIMEZONE') {
      mode = _Mode.None;
      continue; // Skip END:VTIMEZONE
    }
    if (line[0] == 'BEGIN' && line[1] == 'STANDARD') {
      mode = _Mode.STANDARD;
      continue; // Skip BEGIN:STANDARD
    }
    if (line[0] == 'END' && line[1] == 'STANDARD') {
      mode = _Mode.VTIMEZONE;
      continue; // Skip END:STANDARD
    }
    if (line[0] == 'BEGIN' && line[1] == 'DAYLIGHT') {
      mode = _Mode.DAYLIGHT;
      continue; // Skip BEGIN:DAYLIGHT
    }
    if (line[0] == 'END' && line[1] == 'DAYLIGHT') {
      mode = _Mode.VTIMEZONE;
      continue; // Skip END:DAYLIGHT
    }

    switch (mode) {
      case _Mode.VEVENT:
        vEvent[line[0]] = line[1];
        break;
      case _Mode.VTIMEZONE:
        if (line[0] == "TZID") iCalendar.timezone.tzid = line[1];
        break;
      case _Mode.STANDARD:
        iCalendar.timezone.standard[line[0]] = line[1];
        break;
      case _Mode.DAYLIGHT:
        iCalendar.timezone.daylight[line[0]] = line[1];
        break;
      case _Mode.None:
        if (line[0] == "VERSION") iCalendar.version = line[1];
        if (line[0] == "PRODID") iCalendar.prodID = line[1];
        if (line[0] == "CALSCALE") iCalendar.calscale = line[1];
        break;
      default:
    }
  }

  return iCalendar;
}

class ICalendar {
  String version = "";
  String prodID = "";
  String calscale = "";
  Timezone timezone = Timezone();
  List<Map<String, String>> events = [];
}

class Timezone {
  String tzid = "";
  Map<String, String> daylight = {};
  Map<String, String> standard = {};
}
