// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EventTearOff {
  const _$EventTearOff();

// ignore: unused_element
  _Event call(
      {@required @nullable DateTime dtend,
      @required @nullable String uid,
      @required @nullable DateTime dtstamp,
      @required @nullable String location,
      @required @nullable String description,
      @required @nullable String summary,
      @required @nullable DateTime dtstart}) {
    return _Event(
      dtend: dtend,
      uid: uid,
      dtstamp: dtstamp,
      location: location,
      description: description,
      summary: summary,
      dtstart: dtstart,
    );
  }
}

// ignore: unused_element
const $Event = _$EventTearOff();

mixin _$Event {
  @nullable
  DateTime get dtend;
  @nullable
  String get uid;
  @nullable
  DateTime get dtstamp;
  @nullable
  String get location;
  @nullable
  String get description;
  @nullable
  String get summary;
  @nullable
  DateTime get dtstart;

  $EventCopyWith<Event> get copyWith;
}

abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {@nullable DateTime dtend,
      @nullable String uid,
      @nullable DateTime dtstamp,
      @nullable String location,
      @nullable String description,
      @nullable String summary,
      @nullable DateTime dtstart});
}

class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object dtend = freezed,
    Object uid = freezed,
    Object dtstamp = freezed,
    Object location = freezed,
    Object description = freezed,
    Object summary = freezed,
    Object dtstart = freezed,
  }) {
    return _then(_value.copyWith(
      dtend: dtend == freezed ? _value.dtend : dtend as DateTime,
      uid: uid == freezed ? _value.uid : uid as String,
      dtstamp: dtstamp == freezed ? _value.dtstamp : dtstamp as DateTime,
      location: location == freezed ? _value.location : location as String,
      description:
          description == freezed ? _value.description : description as String,
      summary: summary == freezed ? _value.summary : summary as String,
      dtstart: dtstart == freezed ? _value.dtstart : dtstart as DateTime,
    ));
  }
}

abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable DateTime dtend,
      @nullable String uid,
      @nullable DateTime dtstamp,
      @nullable String location,
      @nullable String description,
      @nullable String summary,
      @nullable DateTime dtstart});
}

class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object dtend = freezed,
    Object uid = freezed,
    Object dtstamp = freezed,
    Object location = freezed,
    Object description = freezed,
    Object summary = freezed,
    Object dtstart = freezed,
  }) {
    return _then(_Event(
      dtend: dtend == freezed ? _value.dtend : dtend as DateTime,
      uid: uid == freezed ? _value.uid : uid as String,
      dtstamp: dtstamp == freezed ? _value.dtstamp : dtstamp as DateTime,
      location: location == freezed ? _value.location : location as String,
      description:
          description == freezed ? _value.description : description as String,
      summary: summary == freezed ? _value.summary : summary as String,
      dtstart: dtstart == freezed ? _value.dtstart : dtstart as DateTime,
    ));
  }
}

class _$_Event with DiagnosticableTreeMixin implements _Event {
  const _$_Event(
      {@required @nullable this.dtend,
      @required @nullable this.uid,
      @required @nullable this.dtstamp,
      @required @nullable this.location,
      @required @nullable this.description,
      @required @nullable this.summary,
      @required @nullable this.dtstart});

  @override
  @nullable
  final DateTime dtend;
  @override
  @nullable
  final String uid;
  @override
  @nullable
  final DateTime dtstamp;
  @override
  @nullable
  final String location;
  @override
  @nullable
  final String description;
  @override
  @nullable
  final String summary;
  @override
  @nullable
  final DateTime dtstart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(dtend: $dtend, uid: $uid, dtstamp: $dtstamp, location: $location, description: $description, summary: $summary, dtstart: $dtstart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('dtend', dtend))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('dtstamp', dtstamp))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('summary', summary))
      ..add(DiagnosticsProperty('dtstart', dtstart));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.dtend, dtend) ||
                const DeepCollectionEquality().equals(other.dtend, dtend)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.dtstamp, dtstamp) ||
                const DeepCollectionEquality()
                    .equals(other.dtstamp, dtstamp)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.dtstart, dtstart) ||
                const DeepCollectionEquality().equals(other.dtstart, dtstart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dtend) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(dtstamp) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(dtstart);

  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {@required @nullable DateTime dtend,
      @required @nullable String uid,
      @required @nullable DateTime dtstamp,
      @required @nullable String location,
      @required @nullable String description,
      @required @nullable String summary,
      @required @nullable DateTime dtstart}) = _$_Event;

  @override
  @nullable
  DateTime get dtend;
  @override
  @nullable
  String get uid;
  @override
  @nullable
  DateTime get dtstamp;
  @override
  @nullable
  String get location;
  @override
  @nullable
  String get description;
  @override
  @nullable
  String get summary;
  @override
  @nullable
  DateTime get dtstart;
  @override
  _$EventCopyWith<_Event> get copyWith;
}
