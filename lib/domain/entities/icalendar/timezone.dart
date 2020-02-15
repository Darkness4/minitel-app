import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Timezone field from icalendar
class Timezone extends Equatable {
  final String tzid;
  final TimezoneDescription daylight;
  final TimezoneDescription standard;

  const Timezone({
    this.tzid,
    this.daylight,
    this.standard,
  });

  @override
  List<Object> get props => [
        this.tzid,
        this.daylight,
        this.standard,
      ];
}

@immutable
class TimezoneDescription extends Equatable {
  final DateTime dtstart;
  final String tzOffsetTo;
  final String tzOffsetFrom;
  final String rRule;
  final String tzName;

  const TimezoneDescription({
    this.dtstart,
    this.tzOffsetTo,
    this.tzOffsetFrom,
    this.rRule,
    this.tzName,
  });

  @override
  List<Object> get props => [
        this.dtstart,
        this.tzOffsetTo,
        this.tzOffsetFrom,
        this.rRule,
        this.tzName,
      ];
}
