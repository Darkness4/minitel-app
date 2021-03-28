// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'zabbix_host.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZabbixHost _$ZabbixHostFromJson(Map<String, dynamic> json) {
  return _ZabbixHost.fromJson(json);
}

/// @nodoc
class _$ZabbixHostTearOff {
  const _$ZabbixHostTearOff();

  _ZabbixHost call(
      {required String hostid,
      required String host,
      required List<ZabbixItem> items,
      required List<ZabbixInterface> interfaces}) {
    return _ZabbixHost(
      hostid: hostid,
      host: host,
      items: items,
      interfaces: interfaces,
    );
  }

  ZabbixHost fromJson(Map<String, Object> json) {
    return ZabbixHost.fromJson(json);
  }
}

/// @nodoc
const $ZabbixHost = _$ZabbixHostTearOff();

/// @nodoc
mixin _$ZabbixHost {
  String get hostid => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  List<ZabbixItem> get items => throw _privateConstructorUsedError;
  List<ZabbixInterface> get interfaces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZabbixHostCopyWith<ZabbixHost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZabbixHostCopyWith<$Res> {
  factory $ZabbixHostCopyWith(
          ZabbixHost value, $Res Function(ZabbixHost) then) =
      _$ZabbixHostCopyWithImpl<$Res>;
  $Res call(
      {String hostid,
      String host,
      List<ZabbixItem> items,
      List<ZabbixInterface> interfaces});
}

/// @nodoc
class _$ZabbixHostCopyWithImpl<$Res> implements $ZabbixHostCopyWith<$Res> {
  _$ZabbixHostCopyWithImpl(this._value, this._then);

  final ZabbixHost _value;
  // ignore: unused_field
  final $Res Function(ZabbixHost) _then;

  @override
  $Res call({
    Object? hostid = freezed,
    Object? host = freezed,
    Object? items = freezed,
    Object? interfaces = freezed,
  }) {
    return _then(_value.copyWith(
      hostid: hostid == freezed
          ? _value.hostid
          : hostid // ignore: cast_nullable_to_non_nullable
              as String,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ZabbixItem>,
      interfaces: interfaces == freezed
          ? _value.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<ZabbixInterface>,
    ));
  }
}

/// @nodoc
abstract class _$ZabbixHostCopyWith<$Res> implements $ZabbixHostCopyWith<$Res> {
  factory _$ZabbixHostCopyWith(
          _ZabbixHost value, $Res Function(_ZabbixHost) then) =
      __$ZabbixHostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String hostid,
      String host,
      List<ZabbixItem> items,
      List<ZabbixInterface> interfaces});
}

/// @nodoc
class __$ZabbixHostCopyWithImpl<$Res> extends _$ZabbixHostCopyWithImpl<$Res>
    implements _$ZabbixHostCopyWith<$Res> {
  __$ZabbixHostCopyWithImpl(
      _ZabbixHost _value, $Res Function(_ZabbixHost) _then)
      : super(_value, (v) => _then(v as _ZabbixHost));

  @override
  _ZabbixHost get _value => super._value as _ZabbixHost;

  @override
  $Res call({
    Object? hostid = freezed,
    Object? host = freezed,
    Object? items = freezed,
    Object? interfaces = freezed,
  }) {
    return _then(_ZabbixHost(
      hostid: hostid == freezed
          ? _value.hostid
          : hostid // ignore: cast_nullable_to_non_nullable
              as String,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ZabbixItem>,
      interfaces: interfaces == freezed
          ? _value.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<ZabbixInterface>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ZabbixHost implements _ZabbixHost {
  const _$_ZabbixHost(
      {required this.hostid,
      required this.host,
      required this.items,
      required this.interfaces});

  factory _$_ZabbixHost.fromJson(Map<String, dynamic> json) =>
      _$_$_ZabbixHostFromJson(json);

  @override
  final String hostid;
  @override
  final String host;
  @override
  final List<ZabbixItem> items;
  @override
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

  @JsonKey(ignore: true)
  @override
  _$ZabbixHostCopyWith<_ZabbixHost> get copyWith =>
      __$ZabbixHostCopyWithImpl<_ZabbixHost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ZabbixHostToJson(this);
  }
}

abstract class _ZabbixHost implements ZabbixHost {
  const factory _ZabbixHost(
      {required String hostid,
      required String host,
      required List<ZabbixItem> items,
      required List<ZabbixInterface> interfaces}) = _$_ZabbixHost;

  factory _ZabbixHost.fromJson(Map<String, dynamic> json) =
      _$_ZabbixHost.fromJson;

  @override
  String get hostid => throw _privateConstructorUsedError;
  @override
  String get host => throw _privateConstructorUsedError;
  @override
  List<ZabbixItem> get items => throw _privateConstructorUsedError;
  @override
  List<ZabbixInterface> get interfaces => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ZabbixHostCopyWith<_ZabbixHost> get copyWith =>
      throw _privateConstructorUsedError;
}
