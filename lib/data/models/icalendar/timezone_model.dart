import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/timezone.dart';

/// Timezone field from icalendar
class TimezoneModel extends Timezone {
  const TimezoneModel({
    String tzid,
    TimezoneDescriptionModel daylight,
    TimezoneDescriptionModel standard,
  }) : super(
          tzid: tzid,
          daylight: daylight,
          standard: standard,
        );

  TimezoneModel copyWith({
    String tzid,
    TimezoneDescriptionModel daylight,
    TimezoneDescriptionModel standard,
  }) {
    return TimezoneModel(
      tzid: tzid ?? this.tzid,
      daylight: daylight ?? TimezoneDescriptionModel.fromEntity(this.daylight),
      standard: standard ?? TimezoneDescriptionModel.fromEntity(this.standard),
    );
  }
}

@immutable
class TimezoneDescriptionModel extends TimezoneDescription {
  const TimezoneDescriptionModel({
    DateTime dtstart,
    String tzOffsetTo = "",
    String tzOffsetFrom = "",
    String rRule = "",
    String tzName = "",
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

  TimezoneDescriptionModel copyWithKeyValue(String key, String value) {
    switch (key) {
      case "DTSTART":
        return this.copyWith(dtstart: DateTime.parse(value));
        break;
      case "TZOFFSETTO":
        return this.copyWith(tzOffsetTo: value);
        break;
      case "TZOFFSETFROM":
        return this.copyWith(tzOffsetFrom: value);
        break;
      case "RRULE":
        return this.copyWith(rRule: value);
        break;
      case "TZNAME":
        return this.copyWith(tzName: value);
        break;
    }
    return this;
  }

  TimezoneDescriptionModel copyWith({
    DateTime dtstart,
    String tzOffsetTo,
    String tzOffsetFrom,
    String rRule,
    String tzName,
  }) {
    return TimezoneDescriptionModel(
      dtstart: dtstart ?? this.dtstart,
      tzOffsetTo: tzOffsetTo ?? this.tzOffsetTo,
      tzOffsetFrom: tzOffsetFrom ?? this.tzOffsetFrom,
      rRule: rRule ?? this.rRule,
      tzName: tzName ?? this.tzName,
    );
  }

  factory TimezoneDescriptionModel.fromEntity(TimezoneDescription entity) {
    return TimezoneDescriptionModel(
      dtstart: entity.dtstart,
      rRule: entity.rRule,
      tzName: entity.tzName,
      tzOffsetFrom: entity.tzOffsetFrom,
      tzOffsetTo: entity.tzOffsetTo,
    );
  }
}
