import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

void main() {
  group('TimezoneDescription', () {
    group('get props', () {
      test(
        'should return work with equals',
        () async {
          // arrange
          final tDateTime = DateTime.now();
          // ignore: prefer_const_constructors
          final TimezoneDescription tTimezoneDescription = TimezoneDescription(
            dtstart: tDateTime,
            rRule: "rRule",
            tzName: "tzName",
            tzOffsetFrom: "tzOffsetFrom",
            tzOffsetTo: "tzOffsetTo",
          );
          // assert
          // ignore: prefer_const_constructors
          final TimezoneDescription expectedTimezoneDescription =
              TimezoneDescription(
            dtstart: tDateTime,
            rRule: "rRule",
            tzName: "tzName",
            tzOffsetFrom: "tzOffsetFrom",
            tzOffsetTo: "tzOffsetTo",
          );
          expect(
            tTimezoneDescription,
            equals(expectedTimezoneDescription),
          );
        },
      );
    });
  });
}
