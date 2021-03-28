import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timezone/timezone.dart';

part 'timezone.freezed.dart';

/// Timezone field from icalendar
@freezed
class Timezone with _$Timezone {
  const factory Timezone({
    required Location tzid,
    required TimezoneDescription daylight,
    required TimezoneDescription standard,
  }) = _Timezone;
}

@freezed
class TimezoneDescription with _$TimezoneDescription {
  const factory TimezoneDescription({
    required DateTime dtstart,
    required String tzOffsetTo,
    required String tzOffsetFrom,
    required String rRule,
    required String tzName,
  }) = _TimezoneDescription;
}
