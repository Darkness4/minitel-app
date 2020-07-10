// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'report_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReportStatusStateTearOff {
  const _$ReportStatusStateTearOff();

  _ReportStatusState call(
      {@required @nullable String name,
      @required @nullable String room,
      @required @nullable String title,
      @required @nullable String description,
      @required bool isValidName,
      @required bool isValidTitle,
      @required bool isValidRoom}) {
    return _ReportStatusState(
      name: name,
      room: room,
      title: title,
      description: description,
      isValidName: isValidName,
      isValidTitle: isValidTitle,
      isValidRoom: isValidRoom,
    );
  }
}

// ignore: unused_element
const $ReportStatusState = _$ReportStatusStateTearOff();

mixin _$ReportStatusState {
  @nullable
  String get name;
  @nullable
  String get room;
  @nullable
  String get title;
  @nullable
  String get description;
  bool get isValidName;
  bool get isValidTitle;
  bool get isValidRoom;

  $ReportStatusStateCopyWith<ReportStatusState> get copyWith;
}

abstract class $ReportStatusStateCopyWith<$Res> {
  factory $ReportStatusStateCopyWith(
          ReportStatusState value, $Res Function(ReportStatusState) then) =
      _$ReportStatusStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable String name,
      @nullable String room,
      @nullable String title,
      @nullable String description,
      bool isValidName,
      bool isValidTitle,
      bool isValidRoom});
}

class _$ReportStatusStateCopyWithImpl<$Res>
    implements $ReportStatusStateCopyWith<$Res> {
  _$ReportStatusStateCopyWithImpl(this._value, this._then);

  final ReportStatusState _value;
  // ignore: unused_field
  final $Res Function(ReportStatusState) _then;

  @override
  $Res call({
    Object name = freezed,
    Object room = freezed,
    Object title = freezed,
    Object description = freezed,
    Object isValidName = freezed,
    Object isValidTitle = freezed,
    Object isValidRoom = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      room: room == freezed ? _value.room : room as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      isValidName:
          isValidName == freezed ? _value.isValidName : isValidName as bool,
      isValidTitle:
          isValidTitle == freezed ? _value.isValidTitle : isValidTitle as bool,
      isValidRoom:
          isValidRoom == freezed ? _value.isValidRoom : isValidRoom as bool,
    ));
  }
}

abstract class _$ReportStatusStateCopyWith<$Res>
    implements $ReportStatusStateCopyWith<$Res> {
  factory _$ReportStatusStateCopyWith(
          _ReportStatusState value, $Res Function(_ReportStatusState) then) =
      __$ReportStatusStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String name,
      @nullable String room,
      @nullable String title,
      @nullable String description,
      bool isValidName,
      bool isValidTitle,
      bool isValidRoom});
}

class __$ReportStatusStateCopyWithImpl<$Res>
    extends _$ReportStatusStateCopyWithImpl<$Res>
    implements _$ReportStatusStateCopyWith<$Res> {
  __$ReportStatusStateCopyWithImpl(
      _ReportStatusState _value, $Res Function(_ReportStatusState) _then)
      : super(_value, (v) => _then(v as _ReportStatusState));

  @override
  _ReportStatusState get _value => super._value as _ReportStatusState;

  @override
  $Res call({
    Object name = freezed,
    Object room = freezed,
    Object title = freezed,
    Object description = freezed,
    Object isValidName = freezed,
    Object isValidTitle = freezed,
    Object isValidRoom = freezed,
  }) {
    return _then(_ReportStatusState(
      name: name == freezed ? _value.name : name as String,
      room: room == freezed ? _value.room : room as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      isValidName:
          isValidName == freezed ? _value.isValidName : isValidName as bool,
      isValidTitle:
          isValidTitle == freezed ? _value.isValidTitle : isValidTitle as bool,
      isValidRoom:
          isValidRoom == freezed ? _value.isValidRoom : isValidRoom as bool,
    ));
  }
}

class _$_ReportStatusState
    with DiagnosticableTreeMixin
    implements _ReportStatusState {
  const _$_ReportStatusState(
      {@required @nullable this.name,
      @required @nullable this.room,
      @required @nullable this.title,
      @required @nullable this.description,
      @required this.isValidName,
      @required this.isValidTitle,
      @required this.isValidRoom})
      : assert(isValidName != null),
        assert(isValidTitle != null),
        assert(isValidRoom != null);

  @override
  @nullable
  final String name;
  @override
  @nullable
  final String room;
  @override
  @nullable
  final String title;
  @override
  @nullable
  final String description;
  @override
  final bool isValidName;
  @override
  final bool isValidTitle;
  @override
  final bool isValidRoom;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportStatusState(name: $name, room: $room, title: $title, description: $description, isValidName: $isValidName, isValidTitle: $isValidTitle, isValidRoom: $isValidRoom)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportStatusState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('room', room))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('isValidName', isValidName))
      ..add(DiagnosticsProperty('isValidTitle', isValidTitle))
      ..add(DiagnosticsProperty('isValidRoom', isValidRoom));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReportStatusState &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.room, room) ||
                const DeepCollectionEquality().equals(other.room, room)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isValidName, isValidName) ||
                const DeepCollectionEquality()
                    .equals(other.isValidName, isValidName)) &&
            (identical(other.isValidTitle, isValidTitle) ||
                const DeepCollectionEquality()
                    .equals(other.isValidTitle, isValidTitle)) &&
            (identical(other.isValidRoom, isValidRoom) ||
                const DeepCollectionEquality()
                    .equals(other.isValidRoom, isValidRoom)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(room) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isValidName) ^
      const DeepCollectionEquality().hash(isValidTitle) ^
      const DeepCollectionEquality().hash(isValidRoom);

  @override
  _$ReportStatusStateCopyWith<_ReportStatusState> get copyWith =>
      __$ReportStatusStateCopyWithImpl<_ReportStatusState>(this, _$identity);
}

abstract class _ReportStatusState implements ReportStatusState {
  const factory _ReportStatusState(
      {@required @nullable String name,
      @required @nullable String room,
      @required @nullable String title,
      @required @nullable String description,
      @required bool isValidName,
      @required bool isValidTitle,
      @required bool isValidRoom}) = _$_ReportStatusState;

  @override
  @nullable
  String get name;
  @override
  @nullable
  String get room;
  @override
  @nullable
  String get title;
  @override
  @nullable
  String get description;
  @override
  bool get isValidName;
  @override
  bool get isValidTitle;
  @override
  bool get isValidRoom;
  @override
  _$ReportStatusStateCopyWith<_ReportStatusState> get copyWith;
}
