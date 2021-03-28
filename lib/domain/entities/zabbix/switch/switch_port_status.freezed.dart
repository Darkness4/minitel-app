// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'switch_port_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SwitchPortStatusTearOff {
  const _$SwitchPortStatusTearOff();

  _SwitchPortStatus call({required int speed, required int operStatus}) {
    return _SwitchPortStatus(
      speed: speed,
      operStatus: operStatus,
    );
  }
}

/// @nodoc
const $SwitchPortStatus = _$SwitchPortStatusTearOff();

/// @nodoc
mixin _$SwitchPortStatus {
  int get speed => throw _privateConstructorUsedError;
  int get operStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwitchPortStatusCopyWith<SwitchPortStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchPortStatusCopyWith<$Res> {
  factory $SwitchPortStatusCopyWith(
          SwitchPortStatus value, $Res Function(SwitchPortStatus) then) =
      _$SwitchPortStatusCopyWithImpl<$Res>;
  $Res call({int speed, int operStatus});
}

/// @nodoc
class _$SwitchPortStatusCopyWithImpl<$Res>
    implements $SwitchPortStatusCopyWith<$Res> {
  _$SwitchPortStatusCopyWithImpl(this._value, this._then);

  final SwitchPortStatus _value;
  // ignore: unused_field
  final $Res Function(SwitchPortStatus) _then;

  @override
  $Res call({
    Object? speed = freezed,
    Object? operStatus = freezed,
  }) {
    return _then(_value.copyWith(
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      operStatus: operStatus == freezed
          ? _value.operStatus
          : operStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SwitchPortStatusCopyWith<$Res>
    implements $SwitchPortStatusCopyWith<$Res> {
  factory _$SwitchPortStatusCopyWith(
          _SwitchPortStatus value, $Res Function(_SwitchPortStatus) then) =
      __$SwitchPortStatusCopyWithImpl<$Res>;
  @override
  $Res call({int speed, int operStatus});
}

/// @nodoc
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
    Object? speed = freezed,
    Object? operStatus = freezed,
  }) {
    return _then(_SwitchPortStatus(
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      operStatus: operStatus == freezed
          ? _value.operStatus
          : operStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_SwitchPortStatus implements _SwitchPortStatus {
  const _$_SwitchPortStatus({required this.speed, required this.operStatus});

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

  @JsonKey(ignore: true)
  @override
  _$SwitchPortStatusCopyWith<_SwitchPortStatus> get copyWith =>
      __$SwitchPortStatusCopyWithImpl<_SwitchPortStatus>(this, _$identity);
}

abstract class _SwitchPortStatus implements SwitchPortStatus {
  const factory _SwitchPortStatus(
      {required int speed, required int operStatus}) = _$_SwitchPortStatus;

  @override
  int get speed => throw _privateConstructorUsedError;
  @override
  int get operStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SwitchPortStatusCopyWith<_SwitchPortStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
