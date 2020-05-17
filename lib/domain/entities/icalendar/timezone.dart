import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timezone.freezed.dart';

/// Timezone field from icalendar
@freezed
abstract class Timezone with _$Timezone {
  const factory Timezone({
    String tzid,
    TimezoneDescription daylight,
    TimezoneDescription standard,
  }) = _Timezone;
}

@freezed
abstract class TimezoneDescription with _$TimezoneDescription {
  const factory TimezoneDescription({
    DateTime dtstart,
    String tzOffsetTo,
    String tzOffsetFrom,
    String rRule,
    String tzName,
  }) = _TimezoneDescription;
}

extension TimezoneDescriptionX on TimezoneDescription {
  TimezoneDescription copyWithKeyValue(String key, String value) {
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
}
