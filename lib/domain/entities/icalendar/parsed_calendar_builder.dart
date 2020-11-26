import 'dart:convert';

import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone_builder.dart';
import 'package:timezone/timezone.dart';

class ParsedCalendarBuilder {
  String version;
  String prodID;
  String calscale;
  final TimezoneBuilder timezone = TimezoneBuilder();
  final List<Event> events = <Event>[];

  ParsedCalendar build() {
    return ParsedCalendar(
      version: version,
      prodID: prodID,
      calscale: calscale,
      timezone: timezone.build(),
      events: events,
    );
  }

  /// Get existing the stream .ics from file
  Future<void> fromStream(Stream<String> calendarStream) async {
    var mode = ICalSection.None;
    final lines = calendarStream.transform(const LineSplitter());

    final vEvent = <String, String>{};
    await for (final String data in lines) {
      final line = data.trim().split(':');
      // Inside a VEVENT
      if (line[0] == 'BEGIN' && line[1] == 'VEVENT') {
        vEvent.clear();
        mode = ICalSection.VEVENT;
        continue; // Skip BEGIN:VEVENT
      }
      if (line[0] == 'END' && line[1] == 'VEVENT') {
        events.add(Event.fromMap(vEvent, timezone.tzid));
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
            if (line[0] == 'TZID') {
              timezone.tzid = getLocation(line[1]);
            }
            break;
          case ICalSection.STANDARD:
            timezone.standard.set(line[0], line[1]);
            break;
          case ICalSection.DAYLIGHT:
            timezone.daylight.set(line[0], line[1]);
            break;
          case ICalSection.None:
            switch (line[0]) {
              case 'VERSION':
                version = line[1];
                break;
              case 'PRODID':
                prodID = line[1];
                break;
              case 'CALSCALE':
                calscale = line[1];
                break;
            }
        }
      }
    }
  }
}
