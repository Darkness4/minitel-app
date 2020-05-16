// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'zabbix_host.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ZabbixHostTearOff {
  const _$ZabbixHostTearOff();

  _ZabbixHost call(
      {@required @nullable String hostid,
      @required @nullable String host,
      @required @nullable List<ZabbixItem> items,
      @required @nullable List<ZabbixInterface> interfaces}) {
    return _ZabbixHost(
      hostid: hostid,
      host: host,
      items: items,
      interfaces: interfaces,
    );
  }
}

// ignore: unused_element
const $ZabbixHost = _$ZabbixHostTearOff();

mixin _$ZabbixHost {
  @nullable
  String get hostid;
  @nullable
  String get host;
  @nullable
  List<ZabbixItem> get items;
  @nullable
  List<ZabbixInterface> get interfaces;

  $ZabbixHostCopyWith<ZabbixHost> get copyWith;
}

abstract class $ZabbixHostCopyWith<$Res> {
  factory $ZabbixHostCopyWith(
          ZabbixHost value, $Res Function(ZabbixHost) then) =
      _$ZabbixHostCopyWithImpl<$Res>;
  $Res call(
      {@nullable String hostid,
      @nullable String host,
      @nullable List<ZabbixItem> items,
      @nullable List<ZabbixInterface> interfaces});
}

class _$ZabbixHostCopyWithImpl<$Res> implements $ZabbixHostCopyWith<$Res> {
  _$ZabbixHostCopyWithImpl(this._value, this._then);

  final ZabbixHost _value;
  // ignore: unused_field
  final $Res Function(ZabbixHost) _then;

  @override
  $Res call({
    Object hostid = freezed,
    Object host = freezed,
    Object items = freezed,
    Object interfaces = freezed,
  }) {
    return _then(_value.copyWith(
      hostid: hostid == freezed ? _value.hostid : hostid as String,
      host: host == freezed ? _value.host : host as String,
      items: items == freezed ? _value.items : items as List<ZabbixItem>,
      interfaces: interfaces == freezed
          ? _value.interfaces
          : interfaces as List<ZabbixInterface>,
    ));
  }
}

abstract class _$ZabbixHostCopyWith<$Res> implements $ZabbixHostCopyWith<$Res> {
  factory _$ZabbixHostCopyWith(
          _ZabbixHost value, $Res Function(_ZabbixHost) then) =
      __$ZabbixHostCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String hostid,
      @nullable String host,
      @nullable List<ZabbixItem> items,
      @nullable List<ZabbixInterface> interfaces});
}

class __$ZabbixHostCopyWithImpl<$Res> extends _$ZabbixHostCopyWithImpl<$Res>
    implements _$ZabbixHostCopyWith<$Res> {
  __$ZabbixHostCopyWithImpl(
      _ZabbixHost _value, $Res Function(_ZabbixHost) _then)
      : super(_value, (v) => _then(v as _ZabbixHost));

  @override
  _ZabbixHost get _value => super._value as _ZabbixHost;

  @override
  $Res call({
    Object hostid = freezed,
    Object host = freezed,
    Object items = freezed,
    Object interfaces = freezed,
  }) {
    return _then(_ZabbixHost(
      hostid: hostid == freezed ? _value.hostid : hostid as String,
      host: host == freezed ? _value.host : host as String,
      items: items == freezed ? _value.items : items as List<ZabbixItem>,
      interfaces: interfaces == freezed
          ? _value.interfaces
          : interfaces as List<ZabbixInterface>,
    ));
  }
}

class _$_ZabbixHost implements _ZabbixHost {
  const _$_ZabbixHost(
      {@required @nullable this.hostid,
      @required @nullable this.host,
      @required @nullable this.items,
      @required @nullable this.interfaces});

  @override
  @nullable
  final String hostid;
  @override
  @nullable
  final String host;
  @override
  @nullable
  final List<ZabbixItem> items;
  @override
  @nullable
  final List<ZabbixInterface> interfaces;

  @override
  String toString() {
    return 'ZabbixHost(hostid: $hostid, host: $host, items: $items, interfaces: $interfaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ZabbixHost &&
            (identical(other.hostid, hostid) ||
                const DeepCollectionEquality().equals(other.hostid, hostid)) &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.interfaces, interfaces) ||
                const DeepCollectionEquality()
                    .equals(other.interfaces, interfaces)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hostid) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(interfaces);

  @override
  _$ZabbixHostCopyWith<_ZabbixHost> get copyWith =>
      __$ZabbixHostCopyWithImpl<_ZabbixHost>(this, _$identity);
}

abstract class _ZabbixHost implements ZabbixHost {
  const factory _ZabbixHost(
      {@required @nullable String hostid,
      @required @nullable String host,
      @required @nullable List<ZabbixItem> items,
      @required @nullable List<ZabbixInterface> interfaces}) = _$_ZabbixHost;

  @override
  @nullable
  String get hostid;
  @override
  @nullable
  String get host;
  @override
  @nullable
  List<ZabbixItem> get items;
  @override
  @nullable
  List<ZabbixInterface> get interfaces;
  @override
  _$ZabbixHostCopyWith<_ZabbixHost> get copyWith;
}
