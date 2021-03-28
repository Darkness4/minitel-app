// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required TZDateTime dtend,
      required String uid,
      required TZDateTime dtstamp,
      required String location,
      required String description,
      required String summary,
      required TZDateTime dtstart}) {
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

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  TZDateTime get dtend => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  TZDateTime get dtstamp => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  TZDateTime get dtstart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {TZDateTime dtend,
      String uid,
      TZDateTime dtstamp,
      String location,
      String description,
      String summary,
      TZDateTime dtstart});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? dtend = freezed,
    Object? uid = freezed,
    Object? dtstamp = freezed,
    Object? location = freezed,
    Object? description = freezed,
    Object? summary = freezed,
    Object? dtstart = freezed,
  }) {
    return _then(_value.copyWith(
      dtend: dtend == freezed
          ? _value.dtend
          : dtend // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      dtstamp: dtstamp == freezed
          ? _value.dtstamp
          : dtstamp // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      dtstart: dtstart == freezed
          ? _value.dtstart
          : dtstart // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {TZDateTime dtend,
      String uid,
      TZDateTime dtstamp,
      String location,
      String description,
      String summary,
      TZDateTime dtstart});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? dtend = freezed,
    Object? uid = freezed,
    Object? dtstamp = freezed,
    Object? location = freezed,
    Object? description = freezed,
    Object? summary = freezed,
    Object? dtstart = freezed,
  }) {
    return _then(_Event(
      dtend: dtend == freezed
          ? _value.dtend
          : dtend // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      dtstamp: dtstamp == freezed
          ? _value.dtstamp
          : dtstamp // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      dtstart: dtstart == freezed
          ? _value.dtstart
          : dtstart // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
    ));
  }
}

/// @nodoc
class _$_Event with DiagnosticableTreeMixin implements _Event {
  const _$_Event(
      {required this.dtend,
      required this.uid,
      required this.dtstamp,
      required this.location,
      required this.description,
      required this.summary,
      required this.dtstart});

  @override
  final TZDateTime dtend;
  @override
  final String uid;
  @override
  final TZDateTime dtstamp;
  @override
  final String location;
  @override
  final String description;
  @override
  final String summary;
  @override
  final TZDateTime dtstart;

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

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {required TZDateTime dtend,
      required String uid,
      required TZDateTime dtstamp,
      required String location,
      required String description,
      required String summary,
      required TZDateTime dtstart}) = _$_Event;

  @override
  TZDateTime get dtend => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  TZDateTime get dtstamp => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get summary => throw _privateConstructorUsedError;
  @override
  TZDateTime get dtstart => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
