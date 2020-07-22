// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'server_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ServerStatusTearOff {
  const _$ServerStatusTearOff();

// ignore: unused_element
  _ServerStatus call(
      {@required @nullable double pingResponseTime,
      @required @nullable int icmpAvailable}) {
    return _ServerStatus(
      pingResponseTime: pingResponseTime,
      icmpAvailable: icmpAvailable,
    );
  }
}

// ignore: unused_element
const $ServerStatus = _$ServerStatusTearOff();

mixin _$ServerStatus {
  @nullable
  double get pingResponseTime;
  @nullable
  int get icmpAvailable;

  $ServerStatusCopyWith<ServerStatus> get copyWith;
}

abstract class $ServerStatusCopyWith<$Res> {
  factory $ServerStatusCopyWith(
          ServerStatus value, $Res Function(ServerStatus) then) =
      _$ServerStatusCopyWithImpl<$Res>;
  $Res call({@nullable double pingResponseTime, @nullable int icmpAvailable});
}

class _$ServerStatusCopyWithImpl<$Res> implements $ServerStatusCopyWith<$Res> {
  _$ServerStatusCopyWithImpl(this._value, this._then);

  final ServerStatus _value;
  // ignore: unused_field
  final $Res Function(ServerStatus) _then;

  @override
  $Res call({
    Object pingResponseTime = freezed,
    Object icmpAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime as double,
      icmpAvailable: icmpAvailable == freezed
          ? _value.icmpAvailable
          : icmpAvailable as int,
    ));
  }
}

abstract class _$ServerStatusCopyWith<$Res>
    implements $ServerStatusCopyWith<$Res> {
  factory _$ServerStatusCopyWith(
          _ServerStatus value, $Res Function(_ServerStatus) then) =
      __$ServerStatusCopyWithImpl<$Res>;
  @override
  $Res call({@nullable double pingResponseTime, @nullable int icmpAvailable});
}

class __$ServerStatusCopyWithImpl<$Res> extends _$ServerStatusCopyWithImpl<$Res>
    implements _$ServerStatusCopyWith<$Res> {
  __$ServerStatusCopyWithImpl(
      _ServerStatus _value, $Res Function(_ServerStatus) _then)
      : super(_value, (v) => _then(v as _ServerStatus));

  @override
  _ServerStatus get _value => super._value as _ServerStatus;

  @override
  $Res call({
    Object pingResponseTime = freezed,
    Object icmpAvailable = freezed,
  }) {
    return _then(_ServerStatus(
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime as double,
      icmpAvailable: icmpAvailable == freezed
          ? _value.icmpAvailable
          : icmpAvailable as int,
    ));
  }
}

class _$_ServerStatus implements _ServerStatus {
  const _$_ServerStatus(
      {@required @nullable this.pingResponseTime,
      @required @nullable this.icmpAvailable});

  @override
  @nullable
  final double pingResponseTime;
  @override
  @nullable
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

  @override
  _$ServerStatusCopyWith<_ServerStatus> get copyWith =>
      __$ServerStatusCopyWithImpl<_ServerStatus>(this, _$identity);
}

abstract class _ServerStatus implements ServerStatus {
  const factory _ServerStatus(
      {@required @nullable double pingResponseTime,
      @required @nullable int icmpAvailable}) = _$_ServerStatus;

  @override
  @nullable
  double get pingResponseTime;
  @override
  @nullable
  int get icmpAvailable;
  @override
  _$ServerStatusCopyWith<_ServerStatus> get copyWith;
}
