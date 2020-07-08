import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

void main() {
  group('parse', () {
    final tEventModel = Event(
      dtend: DateTime.parse("20200127T100000"),
      dtstamp: DateTime.parse("20200127T100000"),
      description: "Description",
      dtstart: DateTime.parse("20200127T100000"),
      location: "Location",
      summary: "Summary",
      uid: "Uid",
    );
    final tParsedCalendarModel = ParsedCalendar(
      calscale: "GREGORIAN",
      prodID: "-//hacksw/handcal//NONSGML v1.0//EN",
      timezone: Timezone(
        daylight: TimezoneDescription(
          dtstart: DateTime.parse("19710101T020000"),
          rRule: "FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU",
          tzName: "CEST",
          tzOffsetFrom: "+0100",
          tzOffsetTo: "+0200",
        ),
        standard: TimezoneDescription(
          dtstart: DateTime.parse("19710101T030000"),
          rRule: "FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=10;BYDAY=-1SU",
          tzName: "CET",
          tzOffsetFrom: "+0200",
          tzOffsetTo: "+0100",
        ),
        tzid: "Europe/Paris",
      ),
      version: "2.0",
      events: [
        tEventModel,
      ],
    );

    test(
      'should return a valid model',
      () async {
        // arrange
        const String value = """
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//hacksw/handcal//NONSGML v1.0//EN
CALSCALE:GREGORIAN
BEGIN:VTIMEZONE
TZID:Europe/Paris
BEGIN:STANDARD
DTSTART:19710101T030000
TZOFFSETTO:+0100
TZOFFSETFROM:+0200
RRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=10;BYDAY=-1SU
TZNAME:CET
END:STANDARD
BEGIN:DAYLIGHT
DTSTART:19710101T020000
TZOFFSETTO:+0200
TZOFFSETFROM:+0100
RRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU
TZNAME:CEST
END:DAYLIGHT
END:VTIMEZONE

BEGIN:VEVENT
DTEND:20200127T100000
UID:Uid
DTSTAMP:20200127T100000
LOCATION:Location 
DESCRIPTION:Description  
SUMMARY:Summary
DTSTART:20200127T100000
END:VEVENT
END:VCALENDAR
""";
        // act
        final result = await ParsedCalendar.parse(Stream.value(value));
        // assert
        expect(result, equals(tParsedCalendarModel));
      },
    );
  });
  group('sortedEvents', () {
    test('should return a sorted by datetime events', () {
      // Arrange
      final DateTime tDateTimeEarliest = DateTime.now();
      final DateTime tDateTimeLatest =
          DateTime.now().add(const Duration(days: 5));
      const tTimezone = Timezone(
        daylight: TimezoneDescription(),
        standard: TimezoneDescription(),
        tzid: "tzid",
      );
      final tEventEarly = Event(
        description: "description",
        dtend: tDateTimeEarliest,
        dtstamp: tDateTimeEarliest,
        dtstart: tDateTimeEarliest,
        location: "location",
        summary: "summary",
        uid: "123",
      );
      final tEventLate = Event(
        description: "description",
        dtend: tDateTimeLatest,
        dtstamp: tDateTimeLatest,
        dtstart: tDateTimeLatest,
        location: "location",
        summary: "summary",
        uid: "123",
      );
      final tParsedCalendar = ParsedCalendar(
        calscale: "calscale",
        events: [tEventLate, tEventEarly],
        prodID: "prodID",
        timezone: tTimezone,
        version: "version",
      );
      // Act
      final result = tParsedCalendar.sortedByDTStart.toList();
      // Assert
      expect(result, orderedEquals(<Event>[tEventEarly, tEventLate]));
    });
  });
}
