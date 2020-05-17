// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'switch_port_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SwitchPortStatusTearOff {
  const _$SwitchPortStatusTearOff();

  _SwitchPortStatus call({int speed, int operStatus}) {
    return _SwitchPortStatus(
      speed: speed,
      operStatus: operStatus,
    );
  }
}

// ignore: unused_element
const $SwitchPortStatus = _$SwitchPortStatusTearOff();

mixin _$SwitchPortStatus {
  int get speed;
  int get operStatus;

  $SwitchPortStatusCopyWith<SwitchPortStatus> get copyWith;
}

abstract class $SwitchPortStatusCopyWith<$Res> {
  factory $SwitchPortStatusCopyWith(
          SwitchPortStatus value, $Res Function(SwitchPortStatus) then) =
      _$SwitchPortStatusCopyWithImpl<$Res>;
  $Res call({int speed, int operStatus});
}

class _$SwitchPortStatusCopyWithImpl<$Res>
    implements $SwitchPortStatusCopyWith<$Res> {
  _$SwitchPortStatusCopyWithImpl(this._value, this._then);

  final SwitchPortStatus _value;
  // ignore: unused_field
  final $Res Function(SwitchPortStatus) _then;

  @override
  $Res call({
    Object speed = freezed,
    Object operStatus = freezed,
  }) {
    return _then(_value.copyWith(
      speed: speed == freezed ? _value.speed : speed as int,
      operStatus: operStatus == freezed ? _value.operStatus : operStatus as int,
    ));
  }
}

abstract class _$SwitchPortStatusCopyWith<$Res>
    implements $SwitchPortStatusCopyWith<$Res> {
  factory _$SwitchPortStatusCopyWith(
          _SwitchPortStatus value, $Res Function(_SwitchPortStatus) then) =
      __$SwitchPortStatusCopyWithImpl<$Res>;
  @override
  $Res call({int speed, int operStatus});
}

class __$SwitchPortStatusCopyWithImpl<$Res>
    extends _$SwitchPortStatusCopyWithImpl<$Res>
    implements _$SwitchPortStatusCopyWith<$Res> {
  __$SwitchPortStatusCopyWithImpl(
      _SwitchPortStatus _value, $Res Function(_SwitchPortStatus) _then)
      : super(_value, (v) => _then(v as _SwitchPortStatus));

  @override
  _SwitchPortStatus get _value => super._value as _SwitchPortStatus;

  @override
  $Res call({
    Object speed = freezed,
    Object operStatus = freezed,
  }) {
    return _then(_SwitchPortStatus(
      speed: speed == freezed ? _value.speed : speed as int,
      operStatus: operStatus == freezed ? _value.operStatus : operStatus as int,
    ));
  }
}

class _$_SwitchPortStatus implements _SwitchPortStatus {
  const _$_SwitchPortStatus({this.speed, this.operStatus});

  @override
  final int speed;
  @override
  final int operStatus;

  @override
  String toString() {
    return 'SwitchPortStatus(speed: $speed, operStatus: $operStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SwitchPortStatus &&
            (identical(other.speed, speed) ||
                const DeepCollectionEquality().equals(other.speed, speed)) &&
            (identical(other.operStatus, operStatus) ||
                const DeepCollectionEquality()
                    .equals(other.operStatus, operStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(speed) ^
      const DeepCollectionEquality().hash(operStatus);

  @override
  _$SwitchPortStatusCopyWith<_SwitchPortStatus> get copyWith =>
      __$SwitchPortStatusCopyWithImpl<_SwitchPortStatus>(this, _$identity);
}

abstract class _SwitchPortStatus implements SwitchPortStatus {
  const factory _SwitchPortStatus({int speed, int operStatus}) =
      _$_SwitchPortStatus;

  @override
  int get speed;
  @override
  int get operStatus;
  @override
  _$SwitchPortStatusCopyWith<_SwitchPortStatus> get copyWith;
}
