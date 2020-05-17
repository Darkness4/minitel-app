import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

void main() {
  final tDaylight = TimezoneDescription(
    dtstart: DateTime.parse("19710101T020000"),
    rRule: "FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU",
    tzName: "CEST",
    tzOffsetFrom: "+0100",
    tzOffsetTo: "+0200",
  );

  group('TimezoneDescriptionModel', () {
    group('copyWithKeyValue', () {
      test(
        'should return a valid model',
        () async {
          // act
          final result = tDaylight.copyWithKeyValue("RRULE", "test");
          // assert
          final extectedResult = TimezoneDescription(
            dtstart: DateTime.parse("19710101T020000"),
            rRule: "test",
            tzName: "CEST",
            tzOffsetFrom: "+0100",
            tzOffsetTo: "+0200",
          );
          expect(result, equals(extectedResult));
        },
      );

      test(
        'should return self if no change',
        () async {
          // act
          final result =
              tDaylight.copyWithKeyValue("KeyNotFound", "ValueIllegal");
          // assert
          expect(result, equals(tDaylight));
        },
      );
    });
  });
}
