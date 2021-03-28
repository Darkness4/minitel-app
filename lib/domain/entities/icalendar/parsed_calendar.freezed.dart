// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'parsed_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ParsedCalendarTearOff {
  const _$ParsedCalendarTearOff();

  _ParsedCalendar call(
      {required String version,
      required String prodID,
      required String calscale,
      required Timezone timezone,
      required List<Event> events}) {
    return _ParsedCalendar(
      version: version,
      prodID: prodID,
      calscale: calscale,
      timezone: timezone,
      events: events,
    );
  }
}

/// @nodoc
const $ParsedCalendar = _$ParsedCalendarTearOff();

/// @nodoc
mixin _$ParsedCalendar {
  String get version => throw _privateConstructorUsedError;
  String get prodID => throw _privateConstructorUsedError;
  String get calscale => throw _privateConstructorUsedError;
  Timezone get timezone => throw _privateConstructorUsedError;
  List<Event> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParsedCalendarCopyWith<ParsedCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParsedCalendarCopyWith<$Res> {
  factory $ParsedCalendarCopyWith(
          ParsedCalendar value, $Res Function(ParsedCalendar) then) =
      _$ParsedCalendarCopyWithImpl<$Res>;
  $Res call(
      {String version,
      String prodID,
      String calscale,
      Timezone timezone,
      List<Event> events});

  $TimezoneCopyWith<$Res> get timezone;
}

/// @nodoc
class _$ParsedCalendarCopyWithImpl<$Res>
    implements $ParsedCalendarCopyWith<$Res> {
  _$ParsedCalendarCopyWithImpl(this._value, this._then);

  final ParsedCalendar _value;
  // ignore: unused_field
  final $Res Function(ParsedCalendar) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? prodID = freezed,
    Object? calscale = freezed,
    Object? timezone = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      prodID: prodID == freezed
          ? _value.prodID
          : prodID // ignore: cast_nullable_to_non_nullable
              as String,
      calscale: calscale == freezed
          ? _value.calscale
          : calscale // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }

  @override
  $TimezoneCopyWith<$Res> get timezone {
    return $TimezoneCopyWith<$Res>(_value.timezone, (value) {
      return _then(_value.copyWith(timezone: value));
    });
  }
}

/// @nodoc
abstract class _$ParsedCalendarCopyWith<$Res>
    implements $ParsedCalendarCopyWith<$Res> {
  factory _$ParsedCalendarCopyWith(
          _ParsedCalendar value, $Res Function(_ParsedCalendar) then) =
      __$ParsedCalendarCopyWithImpl<$Res>;
  @override
  $Res call(
      {String version,
      String prodID,
      String calscale,
      Timezone timezone,
      List<Event> events});

  @override
  $TimezoneCopyWith<$Res> get timezone;
}

/// @nodoc
class __$ParsedCalendarCopyWithImpl<$Res>
    extends _$ParsedCalendarCopyWithImpl<$Res>
    implements _$ParsedCalendarCopyWith<$Res> {
  __$ParsedCalendarCopyWithImpl(
      _ParsedCalendar _value, $Res Function(_ParsedCalendar) _then)
      : super(_value, (v) => _then(v as _ParsedCalendar));

  @override
  _ParsedCalendar get _value => super._value as _ParsedCalendar;

  @override
  $Res call({
    Object? version = freezed,
    Object? prodID = freezed,
    Object? calscale = freezed,
    Object? timezone = freezed,
    Object? events = freezed,
  }) {
    return _then(_ParsedCalendar(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      prodID: prodID == freezed
          ? _value.prodID
          : prodID // ignore: cast_nullable_to_non_nullable
              as String,
      calscale: calscale == freezed
          ? _value.calscale
          : calscale // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
class _$_ParsedCalendar implements _ParsedCalendar {
  const _$_ParsedCalendar(
      {required this.version,
      required this.prodID,
      required this.calscale,
      required this.timezone,
      required this.events});

  @override
  final String version;
  @override
  final String prodID;
  @override
  final String calscale;
  @override
  final Timezone timezone;
  @override
  final List<Event> events;

  @override
  String toString() {
    return 'ParsedCalendar(version: $version, prodID: $prodID, calscale: $calscale, timezone: $timezone, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParsedCalendar &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.prodID, prodID) ||
                const DeepCollectionEquality().equals(other.prodID, prodID)) &&
            (identical(other.calscale, calscale) ||
                const DeepCollectionEquality()
                    .equals(other.calscale, calscale)) &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(prodID) ^
      const DeepCollectionEquality().hash(calscale) ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  _$ParsedCalendarCopyWith<_ParsedCalendar> get copyWith =>
      __$ParsedCalendarCopyWithImpl<_ParsedCalendar>(this, _$identity);
}

abstract class _ParsedCalendar implements ParsedCalendar {
  const factory _ParsedCalendar(
      {required String version,
      required String prodID,
      required String calscale,
      required Timezone timezone,
      required List<Event> events}) = _$_ParsedCalendar;

  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get prodID => throw _privateConstructorUsedError;
  @override
  String get calscale => throw _privateConstructorUsedError;
  @override
  Timezone get timezone => throw _privateConstructorUsedError;
  @override
  List<Event> get events => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ParsedCalendarCopyWith<_ParsedCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}
