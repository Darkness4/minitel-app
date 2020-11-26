import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';
import 'package:timezone/timezone.dart';

class TimezoneBuilder {
  Location tzid;
  final daylight = TimezoneDescriptionBuilder();
  final standard = TimezoneDescriptionBuilder();

  Timezone build() {
    return Timezone(
      tzid: tzid,
      daylight: daylight.build(),
      standard: standard.build(),
    );
  }
}

class TimezoneDescriptionBuilder {
  DateTime dtstart;
  String tzOffsetTo;
  String tzOffsetFrom;
  String rRule;
  String tzName;

  TimezoneDescription build() {
    return TimezoneDescription(
      dtstart: dtstart,
      rRule: rRule,
      tzName: tzName,
      tzOffsetFrom: tzOffsetFrom,
      tzOffsetTo: tzOffsetTo,
    );
  }

  void set(String key, String value) {
    switch (key) {
      case 'DTSTART':
        dtstart = DateTime.parse(value);
        break;
      case 'TZOFFSETTO':
        tzOffsetTo = value;
        break;
      case 'TZOFFSETFROM':
        tzOffsetFrom = value;
        break;
      case 'RRULE':
        rRule = value;
        break;
      case 'TZNAME':
        tzName = value;
        break;
    }
  }
}
