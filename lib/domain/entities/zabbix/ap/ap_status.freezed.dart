// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ap_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$APStatusTearOff {
  const _$APStatusTearOff();

  _APStatus call(
      {@required @nullable String hostname,
      @required @nullable Duration uptime,
      @required @nullable int utilization5G,
      @required @nullable int utilization2G,
      @required @nullable int users,
      @required @nullable int snmpAvailable}) {
    return _APStatus(
      hostname: hostname,
      uptime: uptime,
      utilization5G: utilization5G,
      utilization2G: utilization2G,
      users: users,
      snmpAvailable: snmpAvailable,
    );
  }
}

// ignore: unused_element
const $APStatus = _$APStatusTearOff();

mixin _$APStatus {
  @nullable
  String get hostname;
  @nullable
  Duration get uptime;
  @nullable
  int get utilization5G;
  @nullable
  int get utilization2G;
  @nullable
  int get users;
  @nullable
  int get snmpAvailable;

  $APStatusCopyWith<APStatus> get copyWith;
}

abstract class $APStatusCopyWith<$Res> {
  factory $APStatusCopyWith(APStatus value, $Res Function(APStatus) then) =
      _$APStatusCopyWithImpl<$Res>;
  $Res call(
      {@nullable String hostname,
      @nullable Duration uptime,
      @nullable int utilization5G,
      @nullable int utilization2G,
      @nullable int users,
      @nullable int snmpAvailable});
}

class _$APStatusCopyWithImpl<$Res> implements $APStatusCopyWith<$Res> {
  _$APStatusCopyWithImpl(this._value, this._then);

  final APStatus _value;
  // ignore: unused_field
  final $Res Function(APStatus) _then;

  @override
  $Res call({
    Object hostname = freezed,
    Object uptime = freezed,
    Object utilization5G = freezed,
    Object utilization2G = freezed,
    Object users = freezed,
    Object snmpAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      hostname: hostname == freezed ? _value.hostname : hostname as String,
      uptime: uptime == freezed ? _value.uptime : uptime as Duration,
      utilization5G: utilization5G == freezed
          ? _value.utilization5G
          : utilization5G as int,
      utilization2G: utilization2G == freezed
          ? _value.utilization2G
          : utilization2G as int,
      users: users == freezed ? _value.users : users as int,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable as int,
    ));
  }
}

abstract class _$APStatusCopyWith<$Res> implements $APStatusCopyWith<$Res> {
  factory _$APStatusCopyWith(_APStatus value, $Res Function(_APStatus) then) =
      __$APStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String hostname,
      @nullable Duration uptime,
      @nullable int utilization5G,
      @nullable int utilization2G,
      @nullable int users,
      @nullable int snmpAvailable});
}

class __$APStatusCopyWithImpl<$Res> extends _$APStatusCopyWithImpl<$Res>
    implements _$APStatusCopyWith<$Res> {
  __$APStatusCopyWithImpl(_APStatus _value, $Res Function(_APStatus) _then)
      : super(_value, (v) => _then(v as _APStatus));

  @override
  _APStatus get _value => super._value as _APStatus;

  @override
  $Res call({
    Object hostname = freezed,
    Object uptime = freezed,
    Object utilization5G = freezed,
    Object utilization2G = freezed,
    Object users = freezed,
    Object snmpAvailable = freezed,
  }) {
    return _then(_APStatus(
      hostname: hostname == freezed ? _value.hostname : hostname as String,
      uptime: uptime == freezed ? _value.uptime : uptime as Duration,
      utilization5G: utilization5G == freezed
          ? _value.utilization5G
          : utilization5G as int,
      utilization2G: utilization2G == freezed
          ? _value.utilization2G
          : utilization2G as int,
      users: users == freezed ? _value.users : users as int,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable as int,
    ));
  }
}

class _$_APStatus implements _APStatus {
  const _$_APStatus(
      {@required @nullable this.hostname,
      @required @nullable this.uptime,
      @required @nullable this.utilization5G,
      @required @nullable this.utilization2G,
      @required @nullable this.users,
      @required @nullable this.snmpAvailable});

  @override
  @nullable
  final String hostname;
  @override
  @nullable
  final Duration uptime;
  @override
  @nullable
  final int utilization5G;
  @override
  @nullable
  final int utilization2G;
  @override
  @nullable
  final int users;
  @override
  @nullable
  final int snmpAvailable;

  @override
  String toString() {
    return 'APStatus(hostname: $hostname, uptime: $uptime, utilization5G: $utilization5G, utilization2G: $utilization2G, users: $users, snmpAvailable: $snmpAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _APStatus &&
            (identical(other.hostname, hostname) ||
                const DeepCollectionEquality()
                    .equals(other.hostname, hostname)) &&
            (identical(other.uptime, uptime) ||
                const DeepCollectionEquality().equals(other.uptime, uptime)) &&
            (identical(other.utilization5G, utilization5G) ||
                const DeepCollectionEquality()
                    .equals(other.utilization5G, utilization5G)) &&
            (identical(other.utilization2G, utilization2G) ||
                const DeepCollectionEquality()
                    .equals(other.utilization2G, utilization2G)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.snmpAvailable, snmpAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.snmpAvailable, snmpAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hostname) ^
      const DeepCollectionEquality().hash(uptime) ^
      const DeepCollectionEquality().hash(utilization5G) ^
      const DeepCollectionEquality().hash(utilization2G) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(snmpAvailable);

  @override
  _$APStatusCopyWith<_APStatus> get copyWith =>
      __$APStatusCopyWithImpl<_APStatus>(this, _$identity);
}

abstract class _APStatus implements APStatus {
  const factory _APStatus(
      {@required @nullable String hostname,
      @required @nullable Duration uptime,
      @required @nullable int utilization5G,
      @required @nullable int utilization2G,
      @required @nullable int users,
      @required @nullable int snmpAvailable}) = _$_APStatus;

  @override
  @nullable
  String get hostname;
  @override
  @nullable
  Duration get uptime;
  @override
  @nullable
  int get utilization5G;
  @override
  @nullable
  int get utilization2G;
  @override
  @nullable
  int get users;
  @override
  @nullable
  int get snmpAvailable;
  @override
  _$APStatusCopyWith<_APStatus> get copyWith;
}
