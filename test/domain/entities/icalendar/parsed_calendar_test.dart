import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar_builder.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();

  group('parse', () {
    final tEventModel = Event(
      dtend: tz.TZDateTime.parse(
          tz.getLocation('Europe/Paris'), '20200127T100000'),
      dtstamp: tz.TZDateTime.parse(
          tz.getLocation('Europe/Paris'), '20200127T100000'),
      description: 'Description',
      dtstart: tz.TZDateTime.parse(
          tz.getLocation('Europe/Paris'), '20200127T100000'),
      location: 'Location',
      summary: 'Summary',
      uid: 'Uid',
    );
    final tParsedCalendarModel = ParsedCalendar(
      calscale: 'GREGORIAN',
      prodID: '-//hacksw/handcal//NONSGML v1.0//EN',
      timezone: Timezone(
        daylight: TimezoneDescription(
          dtstart: DateTime.parse('19710101T020000'),
          rRule: 'FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU',
          tzName: 'CEST',
          tzOffsetFrom: '+0100',
          tzOffsetTo: '+0200',
        ),
        standard: TimezoneDescription(
          dtstart: DateTime.parse('19710101T030000'),
          rRule: 'FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=10;BYDAY=-1SU',
          tzName: 'CET',
          tzOffsetFrom: '+0200',
          tzOffsetTo: '+0100',
        ),
        tzid: tz.getLocation('Europe/Paris'),
      ),
      version: '2.0',
      events: [
        tEventModel,
      ],
    );

    test(
      'should return a valid model',
      () async {
        // arrange
        const value = '''
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
''';
        // act
        final builder = ParsedCalendarBuilder();
        await builder.fromStream(Stream.value(value));
        final result = builder.build();
        // assert
        expect(result, equals(tParsedCalendarModel));
      },
    );
  });
}
