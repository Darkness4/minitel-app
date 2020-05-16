// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'timezone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TimezoneTearOff {
  const _$TimezoneTearOff();

  _Timezone call(
      {@required @nullable String tzid,
      @required @nullable TimezoneDescription daylight,
      @required @nullable TimezoneDescription standard}) {
    return _Timezone(
      tzid: tzid,
      daylight: daylight,
      standard: standard,
    );
  }
}

// ignore: unused_element
const $Timezone = _$TimezoneTearOff();

mixin _$Timezone {
  @nullable
  String get tzid;
  @nullable
  TimezoneDescription get daylight;
  @nullable
  TimezoneDescription get standard;

  $TimezoneCopyWith<Timezone> get copyWith;
}

abstract class $TimezoneCopyWith<$Res> {
  factory $TimezoneCopyWith(Timezone value, $Res Function(Timezone) then) =
      _$TimezoneCopyWithImpl<$Res>;
  $Res call(
      {@nullable String tzid,
      @nullable TimezoneDescription daylight,
      @nullable TimezoneDescription standard});
}

class _$TimezoneCopyWithImpl<$Res> implements $TimezoneCopyWith<$Res> {
  _$TimezoneCopyWithImpl(this._value, this._then);

  final Timezone _value;
  // ignore: unused_field
  final $Res Function(Timezone) _then;

  @override
  $Res call({
    Object tzid = freezed,
    Object daylight = freezed,
    Object standard = freezed,
  }) {
    return _then(_value.copyWith(
      tzid: tzid == freezed ? _value.tzid : tzid as String,
      daylight: daylight == freezed
          ? _value.daylight
          : daylight as TimezoneDescription,
      standard: standard == freezed
          ? _value.standard
          : standard as TimezoneDescription,
    ));
  }
}

abstract class _$TimezoneCopyWith<$Res> implements $TimezoneCopyWith<$Res> {
  factory _$TimezoneCopyWith(_Timezone value, $Res Function(_Timezone) then) =
      __$TimezoneCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String tzid,
      @nullable TimezoneDescription daylight,
      @nullable TimezoneDescription standard});
}

class __$TimezoneCopyWithImpl<$Res> extends _$TimezoneCopyWithImpl<$Res>
    implements _$TimezoneCopyWith<$Res> {
  __$TimezoneCopyWithImpl(_Timezone _value, $Res Function(_Timezone) _then)
      : super(_value, (v) => _then(v as _Timezone));

  @override
  _Timezone get _value => super._value as _Timezone;

  @override
  $Res call({
    Object tzid = freezed,
    Object daylight = freezed,
    Object standard = freezed,
  }) {
    return _then(_Timezone(
      tzid: tzid == freezed ? _value.tzid : tzid as String,
      daylight: daylight == freezed
          ? _value.daylight
          : daylight as TimezoneDescription,
      standard: standard == freezed
          ? _value.standard
          : standard as TimezoneDescription,
    ));
  }
}

class _$_Timezone with DiagnosticableTreeMixin implements _Timezone {
  const _$_Timezone(
      {@required @nullable this.tzid,
      @required @nullable this.daylight,
      @required @nullable this.standard});

  @override
  @nullable
  final String tzid;
  @override
  @nullable
  final TimezoneDescription daylight;
  @override
  @nullable
  final TimezoneDescription standard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Timezone(tzid: $tzid, daylight: $daylight, standard: $standard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Timezone'))
      ..add(DiagnosticsProperty('tzid', tzid))
      ..add(DiagnosticsProperty('daylight', daylight))
      ..add(DiagnosticsProperty('standard', standard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Timezone &&
            (identical(other.tzid, tzid) ||
                const DeepCollectionEquality().equals(other.tzid, tzid)) &&
            (identical(other.daylight, daylight) ||
                const DeepCollectionEquality()
                    .equals(other.daylight, daylight)) &&
            (identical(other.standard, standard) ||
                const DeepCollectionEquality()
                    .equals(other.standard, standard)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tzid) ^
      const DeepCollectionEquality().hash(daylight) ^
      const DeepCollectionEquality().hash(standard);

  @override
  _$TimezoneCopyWith<_Timezone> get copyWith =>
      __$TimezoneCopyWithImpl<_Timezone>(this, _$identity);
}

abstract class _Timezone implements Timezone {
  const factory _Timezone(
      {@required @nullable String tzid,
      @required @nullable TimezoneDescription daylight,
      @required @nullable TimezoneDescription standard}) = _$_Timezone;

  @override
  @nullable
  String get tzid;
  @override
  @nullable
  TimezoneDescription get daylight;
  @override
  @nullable
  TimezoneDescription get standard;
  @override
  _$TimezoneCopyWith<_Timezone> get copyWith;
}

class _$TimezoneDescriptionTearOff {
  const _$TimezoneDescriptionTearOff();

  _TimezoneDescription call(
      {@required @nullable DateTime dtstart,
      @required @nullable String tzOffsetTo,
      @required @nullable String tzOffsetFrom,
      @required @nullable String rRule,
      @required @nullable String tzName}) {
    return _TimezoneDescription(
      dtstart: dtstart,
      tzOffsetTo: tzOffsetTo,
      tzOffsetFrom: tzOffsetFrom,
      rRule: rRule,
      tzName: tzName,
    );
  }
}

// ignore: unused_element
const $TimezoneDescription = _$TimezoneDescriptionTearOff();

mixin _$TimezoneDescription {
  @nullable
  DateTime get dtstart;
  @nullable
  String get tzOffsetTo;
  @nullable
  String get tzOffsetFrom;
  @nullable
  String get rRule;
  @nullable
  String get tzName;

  $TimezoneDescriptionCopyWith<TimezoneDescription> get copyWith;
}

abstract class $TimezoneDescriptionCopyWith<$Res> {
  factory $TimezoneDescriptionCopyWith(
          TimezoneDescription value, $Res Function(TimezoneDescription) then) =
      _$TimezoneDescriptionCopyWithImpl<$Res>;
  $Res call(
      {@nullable DateTime dtstart,
      @nullable String tzOffsetTo,
      @nullable String tzOffsetFrom,
      @nullable String rRule,
      @nullable String tzName});
}

class _$TimezoneDescriptionCopyWithImpl<$Res>
    implements $TimezoneDescriptionCopyWith<$Res> {
  _$TimezoneDescriptionCopyWithImpl(this._value, this._then);

  final TimezoneDescription _value;
  // ignore: unused_field
  final $Res Function(TimezoneDescription) _then;

  @override
  $Res call({
    Object dtstart = freezed,
    Object tzOffsetTo = freezed,
    Object tzOffsetFrom = freezed,
    Object rRule = freezed,
    Object tzName = freezed,
  }) {
    return _then(_value.copyWith(
      dtstart: dtstart == freezed ? _value.dtstart : dtstart as DateTime,
      tzOffsetTo:
          tzOffsetTo == freezed ? _value.tzOffsetTo : tzOffsetTo as String,
      tzOffsetFrom: tzOffsetFrom == freezed
          ? _value.tzOffsetFrom
          : tzOffsetFrom as String,
      rRule: rRule == freezed ? _value.rRule : rRule as String,
      tzName: tzName == freezed ? _value.tzName : tzName as String,
    ));
  }
}

abstract class _$TimezoneDescriptionCopyWith<$Res>
    implements $TimezoneDescriptionCopyWith<$Res> {
  factory _$TimezoneDescriptionCopyWith(_TimezoneDescription value,
          $Res Function(_TimezoneDescription) then) =
      __$TimezoneDescriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable DateTime dtstart,
      @nullable String tzOffsetTo,
      @nullable String tzOffsetFrom,
      @nullable String rRule,
      @nullable String tzName});
}

class __$TimezoneDescriptionCopyWithImpl<$Res>
    extends _$TimezoneDescriptionCopyWithImpl<$Res>
    implements _$TimezoneDescriptionCopyWith<$Res> {
  __$TimezoneDescriptionCopyWithImpl(
      _TimezoneDescription _value, $Res Function(_TimezoneDescription) _then)
      : super(_value, (v) => _then(v as _TimezoneDescription));

  @override
  _TimezoneDescription get _value => super._value as _TimezoneDescription;

  @override
  $Res call({
    Object dtstart = freezed,
    Object tzOffsetTo = freezed,
    Object tzOffsetFrom = freezed,
    Object rRule = freezed,
    Object tzName = freezed,
  }) {
    return _then(_TimezoneDescription(
      dtstart: dtstart == freezed ? _value.dtstart : dtstart as DateTime,
      tzOffsetTo:
          tzOffsetTo == freezed ? _value.tzOffsetTo : tzOffsetTo as String,
      tzOffsetFrom: tzOffsetFrom == freezed
          ? _value.tzOffsetFrom
          : tzOffsetFrom as String,
      rRule: rRule == freezed ? _value.rRule : rRule as String,
      tzName: tzName == freezed ? _value.tzName : tzName as String,
    ));
  }
}

class _$_TimezoneDescription
    with DiagnosticableTreeMixin
    implements _TimezoneDescription {
  const _$_TimezoneDescription(
      {@required @nullable this.dtstart,
      @required @nullable this.tzOffsetTo,
      @required @nullable this.tzOffsetFrom,
      @required @nullable this.rRule,
      @required @nullable this.tzName});

  @override
  @nullable
  final DateTime dtstart;
  @override
  @nullable
  final String tzOffsetTo;
  @override
  @nullable
  final String tzOffsetFrom;
  @override
  @nullable
  final String rRule;
  @override
  @nullable
  final String tzName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimezoneDescription(dtstart: $dtstart, tzOffsetTo: $tzOffsetTo, tzOffsetFrom: $tzOffsetFrom, rRule: $rRule, tzName: $tzName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimezoneDescription'))
      ..add(DiagnosticsProperty('dtstart', dtstart))
      ..add(DiagnosticsProperty('tzOffsetTo', tzOffsetTo))
      ..add(DiagnosticsProperty('tzOffsetFrom', tzOffsetFrom))
      ..add(DiagnosticsProperty('rRule', rRule))
      ..add(DiagnosticsProperty('tzName', tzName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimezoneDescription &&
            (identical(other.dtstart, dtstart) ||
                const DeepCollectionEquality()
                    .equals(other.dtstart, dtstart)) &&
            (identical(other.tzOffsetTo, tzOffsetTo) ||
                const DeepCollectionEquality()
                    .equals(other.tzOffsetTo, tzOffsetTo)) &&
            (identical(other.tzOffsetFrom, tzOffsetFrom) ||
                const DeepCollectionEquality()
                    .equals(other.tzOffsetFrom, tzOffsetFrom)) &&
            (identical(other.rRule, rRule) ||
                const DeepCollectionEquality().equals(other.rRule, rRule)) &&
            (identical(other.tzName, tzName) ||
                const DeepCollectionEquality().equals(other.tzName, tzName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dtstart) ^
      const DeepCollectionEquality().hash(tzOffsetTo) ^
      const DeepCollectionEquality().hash(tzOffsetFrom) ^
      const DeepCollectionEquality().hash(rRule) ^
      const DeepCollectionEquality().hash(tzName);

  @override
  _$TimezoneDescriptionCopyWith<_TimezoneDescription> get copyWith =>
      __$TimezoneDescriptionCopyWithImpl<_TimezoneDescription>(
          this, _$identity);
}

abstract class _TimezoneDescription implements TimezoneDescription {
  const factory _TimezoneDescription(
      {@required @nullable DateTime dtstart,
      @required @nullable String tzOffsetTo,
      @required @nullable String tzOffsetFrom,
      @required @nullable String rRule,
      @required @nullable String tzName}) = _$_TimezoneDescription;

  @override
  @nullable
  DateTime get dtstart;
  @override
  @nullable
  String get tzOffsetTo;
  @override
  @nullable
  String get tzOffsetFrom;
  @override
  @nullable
  String get rRule;
  @override
  @nullable
  String get tzName;
  @override
  _$TimezoneDescriptionCopyWith<_TimezoneDescription> get copyWith;
}
