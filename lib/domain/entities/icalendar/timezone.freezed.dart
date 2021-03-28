// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timezone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimezoneTearOff {
  const _$TimezoneTearOff();

  _Timezone call(
      {required Location tzid,
      required TimezoneDescription daylight,
      required TimezoneDescription standard}) {
    return _Timezone(
      tzid: tzid,
      daylight: daylight,
      standard: standard,
    );
  }
}

/// @nodoc
const $Timezone = _$TimezoneTearOff();

/// @nodoc
mixin _$Timezone {
  Location get tzid => throw _privateConstructorUsedError;
  TimezoneDescription get daylight => throw _privateConstructorUsedError;
  TimezoneDescription get standard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimezoneCopyWith<Timezone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimezoneCopyWith<$Res> {
  factory $TimezoneCopyWith(Timezone value, $Res Function(Timezone) then) =
      _$TimezoneCopyWithImpl<$Res>;
  $Res call(
      {Location tzid,
      TimezoneDescription daylight,
      TimezoneDescription standard});

  $TimezoneDescriptionCopyWith<$Res> get daylight;
  $TimezoneDescriptionCopyWith<$Res> get standard;
}

/// @nodoc
class _$TimezoneCopyWithImpl<$Res> implements $TimezoneCopyWith<$Res> {
  _$TimezoneCopyWithImpl(this._value, this._then);

  final Timezone _value;
  // ignore: unused_field
  final $Res Function(Timezone) _then;

  @override
  $Res call({
    Object? tzid = freezed,
    Object? daylight = freezed,
    Object? standard = freezed,
  }) {
    return _then(_value.copyWith(
      tzid: tzid == freezed
          ? _value.tzid
          : tzid // ignore: cast_nullable_to_non_nullable
              as Location,
      daylight: daylight == freezed
          ? _value.daylight
          : daylight // ignore: cast_nullable_to_non_nullable
              as TimezoneDescription,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as TimezoneDescription,
    ));
  }

  @override
  $TimezoneDescriptionCopyWith<$Res> get daylight {
    return $TimezoneDescriptionCopyWith<$Res>(_value.daylight, (value) {
      return _then(_value.copyWith(daylight: value));
    });
  }

  @override
  $TimezoneDescriptionCopyWith<$Res> get standard {
    return $TimezoneDescriptionCopyWith<$Res>(_value.standard, (value) {
      return _then(_value.copyWith(standard: value));
    });
  }
}

/// @nodoc
abstract class _$TimezoneCopyWith<$Res> implements $TimezoneCopyWith<$Res> {
  factory _$TimezoneCopyWith(_Timezone value, $Res Function(_Timezone) then) =
      __$TimezoneCopyWithImpl<$Res>;
  @override
  $Res call(
      {Location tzid,
      TimezoneDescription daylight,
      TimezoneDescription standard});

  @override
  $TimezoneDescriptionCopyWith<$Res> get daylight;
  @override
  $TimezoneDescriptionCopyWith<$Res> get standard;
}

/// @nodoc
class __$TimezoneCopyWithImpl<$Res> extends _$TimezoneCopyWithImpl<$Res>
    implements _$TimezoneCopyWith<$Res> {
  __$TimezoneCopyWithImpl(_Timezone _value, $Res Function(_Timezone) _then)
      : super(_value, (v) => _then(v as _Timezone));

  @override
  _Timezone get _value => super._value as _Timezone;

  @override
  $Res call({
    Object? tzid = freezed,
    Object? daylight = freezed,
    Object? standard = freezed,
  }) {
    return _then(_Timezone(
      tzid: tzid == freezed
          ? _value.tzid
          : tzid // ignore: cast_nullable_to_non_nullable
              as Location,
      daylight: daylight == freezed
          ? _value.daylight
          : daylight // ignore: cast_nullable_to_non_nullable
              as TimezoneDescription,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as TimezoneDescription,
    ));
  }
}

/// @nodoc
class _$_Timezone implements _Timezone {
  const _$_Timezone(
      {required this.tzid, required this.daylight, required this.standard});

  @override
  final Location tzid;
  @override
  final TimezoneDescription daylight;
  @override
  final TimezoneDescription standard;

  @override
  String toString() {
    return 'Timezone(tzid: $tzid, daylight: $daylight, standard: $standard)';
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

  @JsonKey(ignore: true)
  @override
  _$TimezoneCopyWith<_Timezone> get copyWith =>
      __$TimezoneCopyWithImpl<_Timezone>(this, _$identity);
}

abstract class _Timezone implements Timezone {
  const factory _Timezone(
      {required Location tzid,
      required TimezoneDescription daylight,
      required TimezoneDescription standard}) = _$_Timezone;

  @override
  Location get tzid => throw _privateConstructorUsedError;
  @override
  TimezoneDescription get daylight => throw _privateConstructorUsedError;
  @override
  TimezoneDescription get standard => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimezoneCopyWith<_Timezone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimezoneDescriptionTearOff {
  const _$TimezoneDescriptionTearOff();

  _TimezoneDescription call(
      {required DateTime dtstart,
      required String tzOffsetTo,
      required String tzOffsetFrom,
      required String rRule,
      required String tzName}) {
    return _TimezoneDescription(
      dtstart: dtstart,
      tzOffsetTo: tzOffsetTo,
      tzOffsetFrom: tzOffsetFrom,
      rRule: rRule,
      tzName: tzName,
    );
  }
}

/// @nodoc
const $TimezoneDescription = _$TimezoneDescriptionTearOff();

/// @nodoc
mixin _$TimezoneDescription {
  DateTime get dtstart => throw _privateConstructorUsedError;
  String get tzOffsetTo => throw _privateConstructorUsedError;
  String get tzOffsetFrom => throw _privateConstructorUsedError;
  String get rRule => throw _privateConstructorUsedError;
  String get tzName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimezoneDescriptionCopyWith<TimezoneDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimezoneDescriptionCopyWith<$Res> {
  factory $TimezoneDescriptionCopyWith(
          TimezoneDescription value, $Res Function(TimezoneDescription) then) =
      _$TimezoneDescriptionCopyWithImpl<$Res>;
  $Res call(
      {DateTime dtstart,
      String tzOffsetTo,
      String tzOffsetFrom,
      String rRule,
      String tzName});
}

/// @nodoc
class _$TimezoneDescriptionCopyWithImpl<$Res>
    implements $TimezoneDescriptionCopyWith<$Res> {
  _$TimezoneDescriptionCopyWithImpl(this._value, this._then);

  final TimezoneDescription _value;
  // ignore: unused_field
  final $Res Function(TimezoneDescription) _then;

  @override
  $Res call({
    Object? dtstart = freezed,
    Object? tzOffsetTo = freezed,
    Object? tzOffsetFrom = freezed,
    Object? rRule = freezed,
    Object? tzName = freezed,
  }) {
    return _then(_value.copyWith(
      dtstart: dtstart == freezed
          ? _value.dtstart
          : dtstart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tzOffsetTo: tzOffsetTo == freezed
          ? _value.tzOffsetTo
          : tzOffsetTo // ignore: cast_nullable_to_non_nullable
              as String,
      tzOffsetFrom: tzOffsetFrom == freezed
          ? _value.tzOffsetFrom
          : tzOffsetFrom // ignore: cast_nullable_to_non_nullable
              as String,
      rRule: rRule == freezed
          ? _value.rRule
          : rRule // ignore: cast_nullable_to_non_nullable
              as String,
      tzName: tzName == freezed
          ? _value.tzName
          : tzName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TimezoneDescriptionCopyWith<$Res>
    implements $TimezoneDescriptionCopyWith<$Res> {
  factory _$TimezoneDescriptionCopyWith(_TimezoneDescription value,
          $Res Function(_TimezoneDescription) then) =
      __$TimezoneDescriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime dtstart,
      String tzOffsetTo,
      String tzOffsetFrom,
      String rRule,
      String tzName});
}

/// @nodoc
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
    Object? dtstart = freezed,
    Object? tzOffsetTo = freezed,
    Object? tzOffsetFrom = freezed,
    Object? rRule = freezed,
    Object? tzName = freezed,
  }) {
    return _then(_TimezoneDescription(
      dtstart: dtstart == freezed
          ? _value.dtstart
          : dtstart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tzOffsetTo: tzOffsetTo == freezed
          ? _value.tzOffsetTo
          : tzOffsetTo // ignore: cast_nullable_to_non_nullable
              as String,
      tzOffsetFrom: tzOffsetFrom == freezed
          ? _value.tzOffsetFrom
          : tzOffsetFrom // ignore: cast_nullable_to_non_nullable
              as String,
      rRule: rRule == freezed
          ? _value.rRule
          : rRule // ignore: cast_nullable_to_non_nullable
              as String,
      tzName: tzName == freezed
          ? _value.tzName
          : tzName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_TimezoneDescription implements _TimezoneDescription {
  const _$_TimezoneDescription(
      {required this.dtstart,
      required this.tzOffsetTo,
      required this.tzOffsetFrom,
      required this.rRule,
      required this.tzName});

  @override
  final DateTime dtstart;
  @override
  final String tzOffsetTo;
  @override
  final String tzOffsetFrom;
  @override
  final String rRule;
  @override
  final String tzName;

  @override
  String toString() {
    return 'TimezoneDescription(dtstart: $dtstart, tzOffsetTo: $tzOffsetTo, tzOffsetFrom: $tzOffsetFrom, rRule: $rRule, tzName: $tzName)';
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

  @JsonKey(ignore: true)
  @override
  _$TimezoneDescriptionCopyWith<_TimezoneDescription> get copyWith =>
      __$TimezoneDescriptionCopyWithImpl<_TimezoneDescription>(
          this, _$identity);
}

abstract class _TimezoneDescription implements TimezoneDescription {
  const factory _TimezoneDescription(
      {required DateTime dtstart,
      required String tzOffsetTo,
      required String tzOffsetFrom,
      required String rRule,
      required String tzName}) = _$_TimezoneDescription;

  @override
  DateTime get dtstart => throw _privateConstructorUsedError;
  @override
  String get tzOffsetTo => throw _privateConstructorUsedError;
  @override
  String get tzOffsetFrom => throw _privateConstructorUsedError;
  @override
  String get rRule => throw _privateConstructorUsedError;
  @override
  String get tzName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimezoneDescriptionCopyWith<_TimezoneDescription> get copyWith =>
      throw _privateConstructorUsedError;
}
