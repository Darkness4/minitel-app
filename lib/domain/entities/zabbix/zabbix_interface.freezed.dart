// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'zabbix_interface.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ZabbixInterfaceTearOff {
  const _$ZabbixInterfaceTearOff();

  _ZabbixInterface call({@required @nullable String ip}) {
    return _ZabbixInterface(
      ip: ip,
    );
  }
}

// ignore: unused_element
const $ZabbixInterface = _$ZabbixInterfaceTearOff();

mixin _$ZabbixInterface {
  @nullable
  String get ip;

  $ZabbixInterfaceCopyWith<ZabbixInterface> get copyWith;
}

abstract class $ZabbixInterfaceCopyWith<$Res> {
  factory $ZabbixInterfaceCopyWith(
          ZabbixInterface value, $Res Function(ZabbixInterface) then) =
      _$ZabbixInterfaceCopyWithImpl<$Res>;
  $Res call({@nullable String ip});
}

class _$ZabbixInterfaceCopyWithImpl<$Res>
    implements $ZabbixInterfaceCopyWith<$Res> {
  _$ZabbixInterfaceCopyWithImpl(this._value, this._then);

  final ZabbixInterface _value;
  // ignore: unused_field
  final $Res Function(ZabbixInterface) _then;

  @override
  $Res call({
    Object ip = freezed,
  }) {
    return _then(_value.copyWith(
      ip: ip == freezed ? _value.ip : ip as String,
    ));
  }
}

abstract class _$ZabbixInterfaceCopyWith<$Res>
    implements $ZabbixInterfaceCopyWith<$Res> {
  factory _$ZabbixInterfaceCopyWith(
          _ZabbixInterface value, $Res Function(_ZabbixInterface) then) =
      __$ZabbixInterfaceCopyWithImpl<$Res>;
  @override
  $Res call({@nullable String ip});
}

class __$ZabbixInterfaceCopyWithImpl<$Res>
    extends _$ZabbixInterfaceCopyWithImpl<$Res>
    implements _$ZabbixInterfaceCopyWith<$Res> {
  __$ZabbixInterfaceCopyWithImpl(
      _ZabbixInterface _value, $Res Function(_ZabbixInterface) _then)
      : super(_value, (v) => _then(v as _ZabbixInterface));

  @override
  _ZabbixInterface get _value => super._value as _ZabbixInterface;

  @override
  $Res call({
    Object ip = freezed,
  }) {
    return _then(_ZabbixInterface(
      ip: ip == freezed ? _value.ip : ip as String,
    ));
  }
}

class _$_ZabbixInterface implements _ZabbixInterface {
  const _$_ZabbixInterface({@required @nullable this.ip});

  @override
  @nullable
  final String ip;

  @override
  String toString() {
    return 'ZabbixInterface(ip: $ip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ZabbixInterface &&
            (identical(other.ip, ip) ||
                const DeepCollectionEquality().equals(other.ip, ip)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ip);

  @override
  _$ZabbixInterfaceCopyWith<_ZabbixInterface> get copyWith =>
      __$ZabbixInterfaceCopyWithImpl<_ZabbixInterface>(this, _$identity);
}

abstract class _ZabbixInterface implements ZabbixInterface {
  const factory _ZabbixInterface({@required @nullable String ip}) =
      _$_ZabbixInterface;

  @override
  @nullable
  String get ip;
  @override
  _$ZabbixInterfaceCopyWith<_ZabbixInterface> get copyWith;
}
