import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

void main() {
  group('get props', () {
    test(
      'should return true with same values with equals operator',
      () async {
        // arrange
        final DateTime tDateTime = DateTime.now().add(const Duration(days: 5));

        final tEvent = Event(
          description: "description",
          dtend: tDateTime,
          dtstamp: tDateTime,
          dtstart: tDateTime,
          location: "location",
          summary: "summary",
          uid: "123",
        );
        const tTimezone = Timezone(
          daylight: TimezoneDescription(),
          standard: TimezoneDescription(),
          tzid: "tzid",
        );
        final tParsedCalendar = ParsedCalendar(
          calscale: "calscale",
          events: [tEvent],
          prodID: "prodID",
          timezone: tTimezone,
          version: "version",
        );
        // act
        final expectedCalendar = ParsedCalendar(
          calscale: "calscale",
          events: [tEvent],
          prodID: "prodID",
          timezone: tTimezone,
          version: "version",
        );
        final result = tParsedCalendar == expectedCalendar;
        // assert
        expect(result, true);
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
