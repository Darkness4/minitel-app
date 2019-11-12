import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

/// Timezone field from icalendar
class TimezoneModel extends Timezone {
  const TimezoneModel({
    String tzid,
    TimezoneDescription daylight,
    TimezoneDescription standard,
  }) : super(
          tzid: tzid,
          daylight: daylight,
          standard: standard,
        );
}

class TimezoneModelBuffer {
  String tzid;
  final TimezoneDescriptionModelBuffer daylight =
      TimezoneDescriptionModelBuffer();
  final TimezoneDescriptionModelBuffer standard =
      TimezoneDescriptionModelBuffer();

  TimezoneModel toTimezoneModel() => TimezoneModel(
        daylight: daylight.toTimezoneDescriptionModel(),
        standard: standard.toTimezoneDescriptionModel(),
        tzid: tzid,
      );
}

@immutable
class TimezoneDescriptionModel extends TimezoneDescription {
  const TimezoneDescriptionModel({
    DateTime dtstart,
    String tzOffsetTo,
    String tzOffsetFrom,
    String rRule,
    String tzName,
  }) : super(
          dtstart: dtstart,
          tzOffsetTo: tzOffsetTo,
          tzOffsetFrom: tzOffsetFrom,
          rRule: rRule,
          tzName: tzName,
        );

  @override
  List<Object> get props => [
        this.dtstart,
        this.tzOffsetTo,
        this.tzOffsetFrom,
        this.rRule,
        this.tzName,
      ];
}

class TimezoneDescriptionModelBuffer {
  DateTime dtstart;
  String tzOffsetTo;
  String tzOffsetFrom;
  String rRule;
  String tzName;

  void set(String key, String value) {
    switch (key) {
      case "DTSTART":
        dtstart = DateTime.parse(value);
        break;
      case "TZOFFSETTO":
        tzOffsetTo = value;
        break;
      case "TZOFFSETFROM":
        tzOffsetFrom = value;
        break;
      case "RRULE":
        rRule = value;
        break;
      case "TZNAME":
        tzName = value;
        break;
    }
  }

  TimezoneDescriptionModel toTimezoneDescriptionModel() =>
      TimezoneDescriptionModel(
        dtstart: dtstart,
        rRule: rRule,
        tzName: tzName,
        tzOffsetFrom: tzOffsetFrom,
        tzOffsetTo: tzOffsetTo,
      );
}
