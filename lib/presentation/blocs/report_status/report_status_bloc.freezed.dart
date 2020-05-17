// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'report_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReportStatusEventTearOff {
  const _$ReportStatusEventTearOff();

  NameChanged nameChanged(String name) {
    return NameChanged(
      name,
    );
  }

  RoomChanged roomChanged(String room) {
    return RoomChanged(
      room,
    );
  }

  TitleChanged titleChanged(String title) {
    return TitleChanged(
      title,
    );
  }

  DescriptionChanged descriptionChanged(String description) {
    return DescriptionChanged(
      description,
    );
  }
}

// ignore: unused_element
const $ReportStatusEvent = _$ReportStatusEventTearOff();

mixin _$ReportStatusEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result roomChanged(String room),
    @required Result titleChanged(String title),
    @required Result descriptionChanged(String description),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result roomChanged(String room),
    Result titleChanged(String title),
    Result descriptionChanged(String description),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result roomChanged(RoomChanged value),
    @required Result titleChanged(TitleChanged value),
    @required Result descriptionChanged(DescriptionChanged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result roomChanged(RoomChanged value),
    Result titleChanged(TitleChanged value),
    Result descriptionChanged(DescriptionChanged value),
    @required Result orElse(),
  });
}

abstract class $ReportStatusEventCopyWith<$Res> {
  factory $ReportStatusEventCopyWith(
          ReportStatusEvent value, $Res Function(ReportStatusEvent) then) =
      _$ReportStatusEventCopyWithImpl<$Res>;
}

class _$ReportStatusEventCopyWithImpl<$Res>
    implements $ReportStatusEventCopyWith<$Res> {
  _$ReportStatusEventCopyWithImpl(this._value, this._then);

  final ReportStatusEvent _value;
  // ignore: unused_field
  final $Res Function(ReportStatusEvent) _then;
}

abstract class $NameChangedCopyWith<$Res> {
  factory $NameChangedCopyWith(
          NameChanged value, $Res Function(NameChanged) then) =
      _$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

class _$NameChangedCopyWithImpl<$Res>
    extends _$ReportStatusEventCopyWithImpl<$Res>
    implements $NameChangedCopyWith<$Res> {
  _$NameChangedCopyWithImpl(
      NameChanged _value, $Res Function(NameChanged) _then)
      : super(_value, (v) => _then(v as NameChanged));

  @override
  NameChanged get _value => super._value as NameChanged;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(NameChanged(
      name == freezed ? _value.name : name as String,
    ));
  }
}

class _$NameChanged with DiagnosticableTreeMixin implements NameChanged {
  const _$NameChanged(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportStatusEvent.nameChanged(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportStatusEvent.nameChanged'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  $NameChangedCopyWith<NameChanged> get copyWith =>
      _$NameChangedCopyWithImpl<NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result roomChanged(String room),
    @required Result titleChanged(String title),
    @required Result descriptionChanged(String description),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result roomChanged(String room),
    Result titleChanged(String title),
    Result descriptionChanged(String description),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result roomChanged(RoomChanged value),
    @required Result titleChanged(TitleChanged value),
    @required Result descriptionChanged(DescriptionChanged value),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result roomChanged(RoomChanged value),
    Result titleChanged(TitleChanged value),
    Result descriptionChanged(DescriptionChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements ReportStatusEvent {
  const factory NameChanged(String name) = _$NameChanged;

  String get name;
  $NameChangedCopyWith<NameChanged> get copyWith;
}

abstract class $RoomChangedCopyWith<$Res> {
  factory $RoomChangedCopyWith(
          RoomChanged value, $Res Function(RoomChanged) then) =
      _$RoomChangedCopyWithImpl<$Res>;
  $Res call({String room});
}

class _$RoomChangedCopyWithImpl<$Res>
    extends _$ReportStatusEventCopyWithImpl<$Res>
    implements $RoomChangedCopyWith<$Res> {
  _$RoomChangedCopyWithImpl(
      RoomChanged _value, $Res Function(RoomChanged) _then)
      : super(_value, (v) => _then(v as RoomChanged));

  @override
  RoomChanged get _value => super._value as RoomChanged;

  @override
  $Res call({
    Object room = freezed,
  }) {
    return _then(RoomChanged(
      room == freezed ? _value.room : room as String,
    ));
  }
}

class _$RoomChanged with DiagnosticableTreeMixin implements RoomChanged {
  const _$RoomChanged(this.room) : assert(room != null);

  @override
  final String room;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportStatusEvent.roomChanged(room: $room)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportStatusEvent.roomChanged'))
      ..add(DiagnosticsProperty('room', room));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoomChanged &&
            (identical(other.room, room) ||
                const DeepCollectionEquality().equals(other.room, room)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(room);

  @override
  $RoomChangedCopyWith<RoomChanged> get copyWith =>
      _$RoomChangedCopyWithImpl<RoomChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result roomChanged(String room),
    @required Result titleChanged(String title),
    @required Result descriptionChanged(String description),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return roomChanged(room);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result roomChanged(String room),
    Result titleChanged(String title),
    Result descriptionChanged(String description),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (roomChanged != null) {
      return roomChanged(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result roomChanged(RoomChanged value),
    @required Result titleChanged(TitleChanged value),
    @required Result descriptionChanged(DescriptionChanged value),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return roomChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result roomChanged(RoomChanged value),
    Result titleChanged(TitleChanged value),
    Result descriptionChanged(DescriptionChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (roomChanged != null) {
      return roomChanged(this);
    }
    return orElse();
  }
}

abstract class RoomChanged implements ReportStatusEvent {
  const factory RoomChanged(String room) = _$RoomChanged;

  String get room;
  $RoomChangedCopyWith<RoomChanged> get copyWith;
}

abstract class $TitleChangedCopyWith<$Res> {
  factory $TitleChangedCopyWith(
          TitleChanged value, $Res Function(TitleChanged) then) =
      _$TitleChangedCopyWithImpl<$Res>;
  $Res call({String title});
}

class _$TitleChangedCopyWithImpl<$Res>
    extends _$ReportStatusEventCopyWithImpl<$Res>
    implements $TitleChangedCopyWith<$Res> {
  _$TitleChangedCopyWithImpl(
      TitleChanged _value, $Res Function(TitleChanged) _then)
      : super(_value, (v) => _then(v as TitleChanged));

  @override
  TitleChanged get _value => super._value as TitleChanged;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(TitleChanged(
      title == freezed ? _value.title : title as String,
    ));
  }
}

class _$TitleChanged with DiagnosticableTreeMixin implements TitleChanged {
  const _$TitleChanged(this.title) : assert(title != null);

  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportStatusEvent.titleChanged(title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportStatusEvent.titleChanged'))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TitleChanged &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  $TitleChangedCopyWith<TitleChanged> get copyWith =>
      _$TitleChangedCopyWithImpl<TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result roomChanged(String room),
    @required Result titleChanged(String title),
    @required Result descriptionChanged(String description),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return titleChanged(title);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result roomChanged(String room),
    Result titleChanged(String title),
    Result descriptionChanged(String description),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (titleChanged != null) {
      return titleChanged(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result roomChanged(RoomChanged value),
    @required Result titleChanged(TitleChanged value),
    @required Result descriptionChanged(DescriptionChanged value),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result roomChanged(RoomChanged value),
    Result titleChanged(TitleChanged value),
    Result descriptionChanged(DescriptionChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class TitleChanged implements ReportStatusEvent {
  const factory TitleChanged(String title) = _$TitleChanged;

  String get title;
  $TitleChangedCopyWith<TitleChanged> get copyWith;
}

abstract class $DescriptionChangedCopyWith<$Res> {
  factory $DescriptionChangedCopyWith(
          DescriptionChanged value, $Res Function(DescriptionChanged) then) =
      _$DescriptionChangedCopyWithImpl<$Res>;
  $Res call({String description});
}

class _$DescriptionChangedCopyWithImpl<$Res>
    extends _$ReportStatusEventCopyWithImpl<$Res>
    implements $DescriptionChangedCopyWith<$Res> {
  _$DescriptionChangedCopyWithImpl(
      DescriptionChanged _value, $Res Function(DescriptionChanged) _then)
      : super(_value, (v) => _then(v as DescriptionChanged));

  @override
  DescriptionChanged get _value => super._value as DescriptionChanged;

  @override
  $Res call({
    Object description = freezed,
  }) {
    return _then(DescriptionChanged(
      description == freezed ? _value.description : description as String,
    ));
  }
}

class _$DescriptionChanged
    with DiagnosticableTreeMixin
    implements DescriptionChanged {
  const _$DescriptionChanged(this.description) : assert(description != null);

  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportStatusEvent.descriptionChanged(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportStatusEvent.descriptionChanged'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DescriptionChanged &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(description);

  @override
  $DescriptionChangedCopyWith<DescriptionChanged> get copyWith =>
      _$DescriptionChangedCopyWithImpl<DescriptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result roomChanged(String room),
    @required Result titleChanged(String title),
    @required Result descriptionChanged(String description),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return descriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result roomChanged(String room),
    Result titleChanged(String title),
    Result descriptionChanged(String description),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (descriptionChanged != null) {
      return descriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result roomChanged(RoomChanged value),
    @required Result titleChanged(TitleChanged value),
    @required Result descriptionChanged(DescriptionChanged value),
  }) {
    assert(nameChanged != null);
    assert(roomChanged != null);
    assert(titleChanged != null);
    assert(descriptionChanged != null);
    return descriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result roomChanged(RoomChanged value),
    Result titleChanged(TitleChanged value),
    Result descriptionChanged(DescriptionChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (descriptionChanged != null) {
      return descriptionChanged(this);
    }
    return orElse();
  }
}

abstract class DescriptionChanged implements ReportStatusEvent {
  const factory DescriptionChanged(String description) = _$DescriptionChanged;

  String get description;
  $DescriptionChangedCopyWith<DescriptionChanged> get copyWith;
}

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
