// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'switch_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SwitchStatusTearOff {
  const _$SwitchStatusTearOff();

  _SwitchStatus call(
      {required Map<int, SwitchPortStatus> ports,
      required String description,
      required String hostname,
      required Duration uptime,
      required double pingResponseTime,
      required int snmpAvailable}) {
    return _SwitchStatus(
      ports: ports,
      description: description,
      hostname: hostname,
      uptime: uptime,
      pingResponseTime: pingResponseTime,
      snmpAvailable: snmpAvailable,
    );
  }
}

/// @nodoc
const $SwitchStatus = _$SwitchStatusTearOff();

/// @nodoc
mixin _$SwitchStatus {
  Map<int, SwitchPortStatus> get ports => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get hostname => throw _privateConstructorUsedError;
  Duration get uptime => throw _privateConstructorUsedError;
  double get pingResponseTime => throw _privateConstructorUsedError;
  int get snmpAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwitchStatusCopyWith<SwitchStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchStatusCopyWith<$Res> {
  factory $SwitchStatusCopyWith(
          SwitchStatus value, $Res Function(SwitchStatus) then) =
      _$SwitchStatusCopyWithImpl<$Res>;
  $Res call(
      {Map<int, SwitchPortStatus> ports,
      String description,
      String hostname,
      Duration uptime,
      double pingResponseTime,
      int snmpAvailable});
}

/// @nodoc
class _$SwitchStatusCopyWithImpl<$Res> implements $SwitchStatusCopyWith<$Res> {
  _$SwitchStatusCopyWithImpl(this._value, this._then);

  final SwitchStatus _value;
  // ignore: unused_field
  final $Res Function(SwitchStatus) _then;

  @override
  $Res call({
    Object? ports = freezed,
    Object? description = freezed,
    Object? hostname = freezed,
    Object? uptime = freezed,
    Object? pingResponseTime = freezed,
    Object? snmpAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      ports: ports == freezed
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as Map<int, SwitchPortStatus>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      uptime: uptime == freezed
          ? _value.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as Duration,
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SwitchStatusCopyWith<$Res>
    implements $SwitchStatusCopyWith<$Res> {
  factory _$SwitchStatusCopyWith(
          _SwitchStatus value, $Res Function(_SwitchStatus) then) =
      __$SwitchStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<int, SwitchPortStatus> ports,
      String description,
      String hostname,
      Duration uptime,
      double pingResponseTime,
      int snmpAvailable});
}

/// @nodoc
class __$SwitchStatusCopyWithImpl<$Res> extends _$SwitchStatusCopyWithImpl<$Res>
    implements _$SwitchStatusCopyWith<$Res> {
  __$SwitchStatusCopyWithImpl(
      _SwitchStatus _value, $Res Function(_SwitchStatus) _then)
      : super(_value, (v) => _then(v as _SwitchStatus));

  @override
  _SwitchStatus get _value => super._value as _SwitchStatus;

  @override
  $Res call({
    Object? ports = freezed,
    Object? description = freezed,
    Object? hostname = freezed,
    Object? uptime = freezed,
    Object? pingResponseTime = freezed,
    Object? snmpAvailable = freezed,
  }) {
    return _then(_SwitchStatus(
      ports: ports == freezed
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as Map<int, SwitchPortStatus>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      uptime: uptime == freezed
          ? _value.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as Duration,
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_SwitchStatus implements _SwitchStatus {
  const _$_SwitchStatus(
      {required this.ports,
      required this.description,
      required this.hostname,
      required this.uptime,
      required this.pingResponseTime,
      required this.snmpAvailable});

  @override
  final Map<int, SwitchPortStatus> ports;
  @override
  final String description;
  @override
  final String hostname;
  @override
  final Duration uptime;
  @override
  final double pingResponseTime;
  @override
  final int snmpAvailable;

  @override
  String toString() {
    return 'SwitchStatus(ports: $ports, description: $description, hostname: $hostname, uptime: $uptime, pingResponseTime: $pingResponseTime, snmpAvailable: $snmpAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SwitchStatus &&
            (identical(other.ports, ports) ||
                const DeepCollectionEquality().equals(other.ports, ports)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.hostname, hostname) ||
                const DeepCollectionEquality()
                    .equals(other.hostname, hostname)) &&
            (identical(other.uptime, uptime) ||
                const DeepCollectionEquality().equals(other.uptime, uptime)) &&
            (identical(other.pingResponseTime, pingResponseTime) ||
                const DeepCollectionEquality()
                    .equals(other.pingResponseTime, pingResponseTime)) &&
            (identical(other.snmpAvailable, snmpAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.snmpAvailable, snmpAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ports) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(hostname) ^
      const DeepCollectionEquality().hash(uptime) ^
      const DeepCollectionEquality().hash(pingResponseTime) ^
      const DeepCollectionEquality().hash(snmpAvailable);

  @JsonKey(ignore: true)
  @override
  _$SwitchStatusCopyWith<_SwitchStatus> get copyWith =>
      __$SwitchStatusCopyWithImpl<_SwitchStatus>(this, _$identity);
}

abstract class _SwitchStatus implements SwitchStatus {
  const factory _SwitchStatus(
      {required Map<int, SwitchPortStatus> ports,
      required String description,
      required String hostname,
      required Duration uptime,
      required double pingResponseTime,
      required int snmpAvailable}) = _$_SwitchStatus;

  @override
  Map<int, SwitchPortStatus> get ports => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get hostname => throw _privateConstructorUsedError;
  @override
  Duration get uptime => throw _privateConstructorUsedError;
  @override
  double get pingResponseTime => throw _privateConstructorUsedError;
  @override
  int get snmpAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SwitchStatusCopyWith<_SwitchStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
