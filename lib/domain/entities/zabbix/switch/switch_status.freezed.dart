// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'switch_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SwitchStatusTearOff {
  const _$SwitchStatusTearOff();

// ignore: unused_element
  _SwitchStatus call(
      {@required @nullable Map<int, SwitchPortStatus> ports,
      @required @nullable String description,
      @required @nullable String hostname,
      @required @nullable Duration uptime,
      @required @nullable double pingResponseTime,
      @required @nullable int snmpAvailable}) {
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

// ignore: unused_element
const $SwitchStatus = _$SwitchStatusTearOff();

mixin _$SwitchStatus {
  @nullable
  Map<int, SwitchPortStatus> get ports;
  @nullable
  String get description;
  @nullable
  String get hostname;
  @nullable
  Duration get uptime;
  @nullable
  double get pingResponseTime;
  @nullable
  int get snmpAvailable;

  $SwitchStatusCopyWith<SwitchStatus> get copyWith;
}

abstract class $SwitchStatusCopyWith<$Res> {
  factory $SwitchStatusCopyWith(
          SwitchStatus value, $Res Function(SwitchStatus) then) =
      _$SwitchStatusCopyWithImpl<$Res>;
  $Res call(
      {@nullable Map<int, SwitchPortStatus> ports,
      @nullable String description,
      @nullable String hostname,
      @nullable Duration uptime,
      @nullable double pingResponseTime,
      @nullable int snmpAvailable});
}

class _$SwitchStatusCopyWithImpl<$Res> implements $SwitchStatusCopyWith<$Res> {
  _$SwitchStatusCopyWithImpl(this._value, this._then);

  final SwitchStatus _value;
  // ignore: unused_field
  final $Res Function(SwitchStatus) _then;

  @override
  $Res call({
    Object ports = freezed,
    Object description = freezed,
    Object hostname = freezed,
    Object uptime = freezed,
    Object pingResponseTime = freezed,
    Object snmpAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      ports:
          ports == freezed ? _value.ports : ports as Map<int, SwitchPortStatus>,
      description:
          description == freezed ? _value.description : description as String,
      hostname: hostname == freezed ? _value.hostname : hostname as String,
      uptime: uptime == freezed ? _value.uptime : uptime as Duration,
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime as double,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable as int,
    ));
  }
}

abstract class _$SwitchStatusCopyWith<$Res>
    implements $SwitchStatusCopyWith<$Res> {
  factory _$SwitchStatusCopyWith(
          _SwitchStatus value, $Res Function(_SwitchStatus) then) =
      __$SwitchStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable Map<int, SwitchPortStatus> ports,
      @nullable String description,
      @nullable String hostname,
      @nullable Duration uptime,
      @nullable double pingResponseTime,
      @nullable int snmpAvailable});
}

class __$SwitchStatusCopyWithImpl<$Res> extends _$SwitchStatusCopyWithImpl<$Res>
    implements _$SwitchStatusCopyWith<$Res> {
  __$SwitchStatusCopyWithImpl(
      _SwitchStatus _value, $Res Function(_SwitchStatus) _then)
      : super(_value, (v) => _then(v as _SwitchStatus));

  @override
  _SwitchStatus get _value => super._value as _SwitchStatus;

  @override
  $Res call({
    Object ports = freezed,
    Object description = freezed,
    Object hostname = freezed,
    Object uptime = freezed,
    Object pingResponseTime = freezed,
    Object snmpAvailable = freezed,
  }) {
    return _then(_SwitchStatus(
      ports:
          ports == freezed ? _value.ports : ports as Map<int, SwitchPortStatus>,
      description:
          description == freezed ? _value.description : description as String,
      hostname: hostname == freezed ? _value.hostname : hostname as String,
      uptime: uptime == freezed ? _value.uptime : uptime as Duration,
      pingResponseTime: pingResponseTime == freezed
          ? _value.pingResponseTime
          : pingResponseTime as double,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable as int,
    ));
  }
}

class _$_SwitchStatus implements _SwitchStatus {
  const _$_SwitchStatus(
      {@required @nullable this.ports,
      @required @nullable this.description,
      @required @nullable this.hostname,
      @required @nullable this.uptime,
      @required @nullable this.pingResponseTime,
      @required @nullable this.snmpAvailable});

  @override
  @nullable
  final Map<int, SwitchPortStatus> ports;
  @override
  @nullable
  final String description;
  @override
  @nullable
  final String hostname;
  @override
  @nullable
  final Duration uptime;
  @override
  @nullable
  final double pingResponseTime;
  @override
  @nullable
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

  @override
  _$SwitchStatusCopyWith<_SwitchStatus> get copyWith =>
      __$SwitchStatusCopyWithImpl<_SwitchStatus>(this, _$identity);
}

abstract class _SwitchStatus implements SwitchStatus {
  const factory _SwitchStatus(
      {@required @nullable Map<int, SwitchPortStatus> ports,
      @required @nullable String description,
      @required @nullable String hostname,
      @required @nullable Duration uptime,
      @required @nullable double pingResponseTime,
      @required @nullable int snmpAvailable}) = _$_SwitchStatus;

  @override
  @nullable
  Map<int, SwitchPortStatus> get ports;
  @override
  @nullable
  String get description;
  @override
  @nullable
  String get hostname;
  @override
  @nullable
  Duration get uptime;
  @override
  @nullable
  double get pingResponseTime;
  @override
  @nullable
  int get snmpAvailable;
  @override
  _$SwitchStatusCopyWith<_SwitchStatus> get copyWith;
}
