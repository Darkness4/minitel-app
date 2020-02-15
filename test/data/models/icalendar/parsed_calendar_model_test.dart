import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/icalendar/event_model.dart';
import 'package:minitel_toolbox/data/models/icalendar/parsed_calendar_model.dart';
import 'package:minitel_toolbox/data/models/icalendar/timezone_model.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';

void main() {
  final tEventModel = EventModel(
    dtend: DateTime.parse("20200127T100000"),
    dtstamp: DateTime.parse("20200127T100000"),
    description: "Description",
    dtstart: DateTime.parse("20200127T100000"),
    location: "Location",
    summary: "Summary",
    uid: "Uid",
  );
  final tParsedCalendarModel = ParsedCalendarModel(
    calscale: "GREGORIAN",
    prodID: "-//hacksw/handcal//NONSGML v1.0//EN",
    timezone: TimezoneModel(
      daylight: TimezoneDescriptionModel(
        dtstart: DateTime.parse("19710101T020000"),
        rRule: "FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU",
        tzName: "CEST",
        tzOffsetFrom: "+0100",
        tzOffsetTo: "+0200",
      ),
      standard: TimezoneDescriptionModel(
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

  group('parse', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        const String value = """BEGIN:VCALENDAR
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
        final result = await ParsedCalendarModel.parse(Stream.value(value));
        // assert
        expect(result, equals(tParsedCalendarModel));
      },
    );
  });
  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tParsedCalendarModel, isA<ParsedCalendar>());
    },
  );
}
