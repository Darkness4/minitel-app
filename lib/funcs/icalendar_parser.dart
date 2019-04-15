import 'dart:io';
import 'dart:convert';

/// GET the .ics from url
Future<String> getCalendar(String url) async {
  var status = "";

  var client = HttpClient();
  client.badCertificateCallback = (cert, host, port) => true;

  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      status = await response.transform(Utf8Decoder()).join();
    } else
      throw Exception("HttpError: ${response.statusCode}");
  } catch (e) {
    status = e.toString();
  }

  return status;
}

///
Future<ICalendar> parseCalendar(String calendar) async {
  ICalendar iCalendar = ICalendar();
  List<List<String>> lines =
      calendar.split("\n").map((line) => line.trim().split(":")).toList();
  for (var i = 1; i < lines.length - 1; i++) {
    // Inside VTIMEZONE
    if (lines[i][0] == 'BEGIN' && lines[i][1] == 'VTIMEZONE') {
      i++; // Skip BEGIN:VTIMEZONE
      while (!(lines[i][0] == 'END' && lines[i][1] == 'VTIMEZONE')) {
        // Inside STANDARD
        if (lines[i][0] == 'BEGIN' && lines[i][1] == 'STANDARD') {
          i++; // Skip BEGIN:STANDARD
          while (!(lines[i][0] == 'END' && lines[i][1] == 'STANDARD')) {
            iCalendar.timezone.standard[lines[i][0]] = lines[i][1];
            i++;
          }
        }

        // Inside DAYLIGHT
        if (lines[i][0] == 'BEGIN' && lines[i][1] == 'DAYLIGHT') {
          i++; // Skip BEGIN:DAYLIGHT
          while (!(lines[i][0] == 'END' && lines[i][1] == 'DAYLIGHT')) {
            iCalendar.timezone.daylight[lines[i][0]] = lines[i][1];
            i++;
          }
        }

        // Inside VTIMEZONE
        if (lines[i][0] == "TZID") iCalendar.timezone.tzid = lines[i][1];
        i++;
      }
    }

    // Inside a VEVENT
    if (lines[i][0] == 'BEGIN' && lines[i][1] == 'VEVENT') {
      Map<String, String> vEvent = {};
      i++; // Skip BEGIN:VEVENT
      while (!(lines[i][0] == 'END' && lines[i][1] == 'VEVENT')) {
        vEvent[lines[i][0]] = lines[i][1];
        i++;
      }
      iCalendar.events.add(vEvent);
    }

    // Inside VCALENDAR
    if (lines[i][0] == "VERSION") iCalendar.version = lines[i][1];
    if (lines[i][0] == "PRODID") iCalendar.prodID = lines[i][1];
    if (lines[i][0] == "CALSCALE") iCalendar.calscale = lines[i][1];
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
