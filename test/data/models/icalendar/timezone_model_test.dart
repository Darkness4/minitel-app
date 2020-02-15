import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/icalendar/timezone_model.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

void main() {
  final tDaylight = TimezoneDescriptionModel(
    dtstart: DateTime.parse("19710101T020000"),
    rRule: "FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU",
    tzName: "CEST",
    tzOffsetFrom: "+0100",
    tzOffsetTo: "+0200",
  );
  final tStandard = TimezoneDescriptionModel(
    dtstart: DateTime.parse("19710101T030000"),
    rRule: "FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=10;BYDAY=-1SU",
    tzName: "CET",
    tzOffsetFrom: "+0200",
    tzOffsetTo: "+0100",
  );
  final tTimezone = TimezoneModel(
    daylight: tDaylight,
    standard: tStandard,
    tzid: "Europe/Paris",
  );

  group('TimezoneModel', () {
    group('copyWith', () {
      test(
        'should return a valid model',
        () async {
          // act
          final result = tTimezone.copyWith(tzid: "Europe/Marseille");
          // assert
          final expectedTimezone = TimezoneModel(
            daylight: tDaylight,
            standard: tStandard,
            tzid: "Europe/Marseille",
          );
          expect(result, equals(expectedTimezone));
        },
      );
    });
    test(
      'should be a subclass of an entity',
      () async {
        // assert
        expect(tTimezone, isA<Timezone>());
      },
    );
  });

  group('TimezoneDescriptionModel', () {
    group('copyWith', () {
      test(
        'should return a valid model',
        () async {
          // act
          final result = tDaylight.copyWith(rRule: "test");
          // assert
          final extectedResult = TimezoneDescriptionModel(
            dtstart: DateTime.parse("19710101T020000"),
            rRule: "test",
            tzName: "CEST",
            tzOffsetFrom: "+0100",
            tzOffsetTo: "+0200",
          );
          expect(result, equals(extectedResult));
        },
      );
    });
    group('copyWithKeyValue', () {
      test(
        'should return a valid model',
        () async {
          // act
          final result = tDaylight.copyWithKeyValue("RRULE", "test");
          // assert
          final extectedResult = TimezoneDescriptionModel(
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
    test(
      'should be a subclass of an entity',
      () async {
        // assert
        expect(tDaylight, isA<TimezoneDescription>());
      },
    );
  });
}
