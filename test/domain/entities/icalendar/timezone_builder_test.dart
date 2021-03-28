import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone_builder.dart';

void main() {
  late TimezoneDescriptionBuilder tDaylight;

  setUp(() {
    tDaylight = TimezoneDescriptionBuilder()
      ..dtstart = DateTime.parse('19710101T020000')
      ..rRule = 'FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU'
      ..tzName = 'CEST'
      ..tzOffsetFrom = '+0100'
      ..tzOffsetTo = '+0200';
  });
  group('TimezoneDescriptionModel', () {
    group('set', () {
      test(
        'should return a valid model',
        () async {
          // act
          tDaylight.set('RRULE', 'test');

          // assert
          final extectedResult = TimezoneDescription(
            dtstart: DateTime.parse('19710101T020000'),
            rRule: 'test',
            tzName: 'CEST',
            tzOffsetFrom: '+0100',
            tzOffsetTo: '+0200',
          );
          expect(tDaylight.build(), equals(extectedResult));
        },
      );

      test(
        'should do nothing if no change',
        () async {
          // act
          tDaylight.set('KeyNotFound', 'ValueIllegal');
          // assert
          final extectedResult = TimezoneDescription(
            dtstart: DateTime.parse('19710101T020000'),
            rRule: 'FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU',
            tzName: 'CEST',
            tzOffsetFrom: '+0100',
            tzOffsetTo: '+0200',
          );
          expect(tDaylight.build(), equals(extectedResult));
        },
      );
    });
  });
}
