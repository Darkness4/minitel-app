// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'parsed_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ParsedCalendarTearOff {
  const _$ParsedCalendarTearOff();

// ignore: unused_element
  _ParsedCalendar call(
      {@required @nullable String version,
      @required @nullable String prodID,
      @required @nullable String calscale,
      @required @nullable Timezone timezone,
      @required @nullable List<Event> events}) {
    return _ParsedCalendar(
      version: version,
      prodID: prodID,
      calscale: calscale,
      timezone: timezone,
      events: events,
    );
  }
}

// ignore: unused_element
const $ParsedCalendar = _$ParsedCalendarTearOff();

mixin _$ParsedCalendar {
  @nullable
  String get version;
  @nullable
  String get prodID;
  @nullable
  String get calscale;
  @nullable
  Timezone get timezone;
  @nullable
  List<Event> get events;

  $ParsedCalendarCopyWith<ParsedCalendar> get copyWith;
}

abstract class $ParsedCalendarCopyWith<$Res> {
  factory $ParsedCalendarCopyWith(
          ParsedCalendar value, $Res Function(ParsedCalendar) then) =
      _$ParsedCalendarCopyWithImpl<$Res>;
  $Res call(
      {@nullable String version,
      @nullable String prodID,
      @nullable String calscale,
      @nullable Timezone timezone,
      @nullable List<Event> events});

  $TimezoneCopyWith<$Res> get timezone;
}

class _$ParsedCalendarCopyWithImpl<$Res>
    implements $ParsedCalendarCopyWith<$Res> {
  _$ParsedCalendarCopyWithImpl(this._value, this._then);

  final ParsedCalendar _value;
  // ignore: unused_field
  final $Res Function(ParsedCalendar) _then;

  @override
  $Res call({
    Object version = freezed,
    Object prodID = freezed,
    Object calscale = freezed,
    Object timezone = freezed,
    Object events = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed ? _value.version : version as String,
      prodID: prodID == freezed ? _value.prodID : prodID as String,
      calscale: calscale == freezed ? _value.calscale : calscale as String,
      timezone: timezone == freezed ? _value.timezone : timezone as Timezone,
      events: events == freezed ? _value.events : events as List<Event>,
    ));
  }

  @override
  $TimezoneCopyWith<$Res> get timezone {
    if (_value.timezone == null) {
      return null;
    }
    return $TimezoneCopyWith<$Res>(_value.timezone, (value) {
      return _then(_value.copyWith(timezone: value));
    });
  }
}

abstract class _$ParsedCalendarCopyWith<$Res>
    implements $ParsedCalendarCopyWith<$Res> {
  factory _$ParsedCalendarCopyWith(
          _ParsedCalendar value, $Res Function(_ParsedCalendar) then) =
      __$ParsedCalendarCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String version,
      @nullable String prodID,
      @nullable String calscale,
      @nullable Timezone timezone,
      @nullable List<Event> events});

  @override
  $TimezoneCopyWith<$Res> get timezone;
}

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
    Object version = freezed,
    Object prodID = freezed,
    Object calscale = freezed,
    Object timezone = freezed,
    Object events = freezed,
  }) {
    return _then(_ParsedCalendar(
      version: version == freezed ? _value.version : version as String,
      prodID: prodID == freezed ? _value.prodID : prodID as String,
      calscale: calscale == freezed ? _value.calscale : calscale as String,
      timezone: timezone == freezed ? _value.timezone : timezone as Timezone,
      events: events == freezed ? _value.events : events as List<Event>,
    ));
  }
}

class _$_ParsedCalendar implements _ParsedCalendar {
  const _$_ParsedCalendar(
      {@required @nullable this.version,
      @required @nullable this.prodID,
      @required @nullable this.calscale,
      @required @nullable this.timezone,
      @required @nullable this.events});

  @override
  @nullable
  final String version;
  @override
  @nullable
  final String prodID;
  @override
  @nullable
  final String calscale;
  @override
  @nullable
  final Timezone timezone;
  @override
  @nullable
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

  @override
  _$ParsedCalendarCopyWith<_ParsedCalendar> get copyWith =>
      __$ParsedCalendarCopyWithImpl<_ParsedCalendar>(this, _$identity);
}

abstract class _ParsedCalendar implements ParsedCalendar {
  const factory _ParsedCalendar(
      {@required @nullable String version,
      @required @nullable String prodID,
      @required @nullable String calscale,
      @required @nullable Timezone timezone,
      @required @nullable List<Event> events}) = _$_ParsedCalendar;

  @override
  @nullable
  String get version;
  @override
  @nullable
  String get prodID;
  @override
  @nullable
  String get calscale;
  @override
  @nullable
  Timezone get timezone;
  @override
  @nullable
  List<Event> get events;
  @override
  _$ParsedCalendarCopyWith<_ParsedCalendar> get copyWith;
}
