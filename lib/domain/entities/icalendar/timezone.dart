import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timezone/timezone.dart';

part 'timezone.freezed.dart';

/// Timezone field from icalendar
@freezed
abstract class Timezone with _$Timezone {
  const factory Timezone({
    Location tzid,
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
