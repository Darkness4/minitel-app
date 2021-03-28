// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'server_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServerStatusTearOff {
  const _$ServerStatusTearOff();

  _ServerStatus call(
      {required double pingResponseTime, required int icmpAvailable}) {
    return _ServerStatus(
      pingResponseTime: pingResponseTime,
      icmpAvailable: icmpAvailable,
    );
  }
}

/// @nodoc
const $ServerStatus = _$ServerStatusTearOff();

/// @nodoc
mixin _$ServerStatus {
  double get pingResponseTime => throw _privateConstructorUsedError;
  int get icmpAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerStatusCopyWith<ServerStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerStatusCopyWith<$Res> {
  factory $ServerStatusCopyWith(
          ServerStatus value, $Res Function(ServerStatus) then) =
      _$ServerStatusCopyWithImpl<$Res>;
  $Res call({double pingResponseTime, int icmpAvailable});
}

/// @nodoc
class _$ServerStatusCopyWithImpl<$Res> implements $ServerStatusCopyWith<$Res> {
  _$ServerStatusCopyWithImpl(this._value, this._then);

  final ServerStatus _value;
  // ignore: unused_field
  final $Res Function(ServerStatus) _then;

  @override
  $Res call({
    Object? pingResponseTime = freezed,
    Object? icmpAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
      icmpAvailable: icmpAvailable == freezed
          ? _value.icmpAvailable
          : icmpAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ServerStatusCopyWith<$Res>
    implements $ServerStatusCopyWith<$Res> {
  factory _$ServerStatusCopyWith(
          _ServerStatus value, $Res Function(_ServerStatus) then) =
      __$ServerStatusCopyWithImpl<$Res>;
  @override
  $Res call({double pingResponseTime, int icmpAvailable});
}

/// @nodoc
class __$ServerStatusCopyWithImpl<$Res> extends _$ServerStatusCopyWithImpl<$Res>
    implements _$ServerStatusCopyWith<$Res> {
  __$ServerStatusCopyWithImpl(
      _ServerStatus _value, $Res Function(_ServerStatus) _then)
      : super(_value, (v) => _then(v as _ServerStatus));

  @override
  _ServerStatus get _value => super._value as _ServerStatus;

  @override
  $Res call({
    Object? pingResponseTime = freezed,
    Object? icmpAvailable = freezed,
  }) {
    return _then(_ServerStatus(
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
      icmpAvailable: icmpAvailable == freezed
          ? _value.icmpAvailable
          : icmpAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_ServerStatus implements _ServerStatus {
  const _$_ServerStatus(
      {required this.pingResponseTime, required this.icmpAvailable});

  @override
  final double pingResponseTime;
  @override
  final int icmpAvailable;

  @override
  String toString() {
    return 'ServerStatus(pingResponseTime: $pingResponseTime, icmpAvailable: $icmpAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerStatus &&
            (identical(other.pingResponseTime, pingResponseTime) ||
                const DeepCollectionEquality()
                    .equals(other.pingResponseTime, pingResponseTime)) &&
            (identical(other.icmpAvailable, icmpAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.icmpAvailable, icmpAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pingResponseTime) ^
      const DeepCollectionEquality().hash(icmpAvailable);

  @JsonKey(ignore: true)
  @override
  _$ServerStatusCopyWith<_ServerStatus> get copyWith =>
      __$ServerStatusCopyWithImpl<_ServerStatus>(this, _$identity);
}

abstract class _ServerStatus implements ServerStatus {
  const factory _ServerStatus(
      {required double pingResponseTime,
      required int icmpAvailable}) = _$_ServerStatus;

  @override
  double get pingResponseTime => throw _privateConstructorUsedError;
  @override
  int get icmpAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerStatusCopyWith<_ServerStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
