import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timezone.freezed.dart';

/// Timezone field from icalendar
@freezed
abstract class Timezone with _$Timezone {
  const factory Timezone({
    @required @nullable String tzid,
    @required @nullable TimezoneDescription daylight,
    @required @nullable TimezoneDescription standard,
  }) = _Timezone;
}

@freezed
abstract class TimezoneDescription with _$TimezoneDescription {
  const factory TimezoneDescription({
    @required @nullable DateTime dtstart,
    @required @nullable String tzOffsetTo,
    @required @nullable String tzOffsetFrom,
    @required @nullable String rRule,
    @required @nullable String tzName,
  }) = _TimezoneDescription;
}
