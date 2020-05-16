// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'zabbix_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ZabbixItemTearOff {
  const _$ZabbixItemTearOff();

  _ZabbixItem call(
      {@required @nullable String type,
      @required @nullable int value_type,
      @required @nullable String name,
      @required @nullable String lastvalue,
      @required @nullable String units,
      @required @nullable String snmp_oid}) {
    return _ZabbixItem(
      type: type,
      value_type: value_type,
      name: name,
      lastvalue: lastvalue,
      units: units,
      snmp_oid: snmp_oid,
    );
  }
}

// ignore: unused_element
const $ZabbixItem = _$ZabbixItemTearOff();

mixin _$ZabbixItem {
  @nullable
  String get type;
  @nullable
  int get value_type;
  @nullable
  String get name;
  @nullable
  String get lastvalue;
  @nullable
  String get units;
  @nullable
  String get snmp_oid;

  $ZabbixItemCopyWith<ZabbixItem> get copyWith;
}

abstract class $ZabbixItemCopyWith<$Res> {
  factory $ZabbixItemCopyWith(
          ZabbixItem value, $Res Function(ZabbixItem) then) =
      _$ZabbixItemCopyWithImpl<$Res>;
  $Res call(
      {@nullable String type,
      @nullable int value_type,
      @nullable String name,
      @nullable String lastvalue,
      @nullable String units,
      @nullable String snmp_oid});
}

class _$ZabbixItemCopyWithImpl<$Res> implements $ZabbixItemCopyWith<$Res> {
  _$ZabbixItemCopyWithImpl(this._value, this._then);

  final ZabbixItem _value;
  // ignore: unused_field
  final $Res Function(ZabbixItem) _then;

  @override
  $Res call({
    Object type = freezed,
    Object value_type = freezed,
    Object name = freezed,
    Object lastvalue = freezed,
    Object units = freezed,
    Object snmp_oid = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as String,
      value_type: value_type == freezed ? _value.value_type : value_type as int,
      name: name == freezed ? _value.name : name as String,
      lastvalue: lastvalue == freezed ? _value.lastvalue : lastvalue as String,
      units: units == freezed ? _value.units : units as String,
      snmp_oid: snmp_oid == freezed ? _value.snmp_oid : snmp_oid as String,
    ));
  }
}

abstract class _$ZabbixItemCopyWith<$Res> implements $ZabbixItemCopyWith<$Res> {
  factory _$ZabbixItemCopyWith(
          _ZabbixItem value, $Res Function(_ZabbixItem) then) =
      __$ZabbixItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String type,
      @nullable int value_type,
      @nullable String name,
      @nullable String lastvalue,
      @nullable String units,
      @nullable String snmp_oid});
}

class __$ZabbixItemCopyWithImpl<$Res> extends _$ZabbixItemCopyWithImpl<$Res>
    implements _$ZabbixItemCopyWith<$Res> {
  __$ZabbixItemCopyWithImpl(
      _ZabbixItem _value, $Res Function(_ZabbixItem) _then)
      : super(_value, (v) => _then(v as _ZabbixItem));

  @override
  _ZabbixItem get _value => super._value as _ZabbixItem;

  @override
  $Res call({
    Object type = freezed,
    Object value_type = freezed,
    Object name = freezed,
    Object lastvalue = freezed,
    Object units = freezed,
    Object snmp_oid = freezed,
  }) {
    return _then(_ZabbixItem(
      type: type == freezed ? _value.type : type as String,
      value_type: value_type == freezed ? _value.value_type : value_type as int,
      name: name == freezed ? _value.name : name as String,
      lastvalue: lastvalue == freezed ? _value.lastvalue : lastvalue as String,
      units: units == freezed ? _value.units : units as String,
      snmp_oid: snmp_oid == freezed ? _value.snmp_oid : snmp_oid as String,
    ));
  }
}

class _$_ZabbixItem implements _ZabbixItem {
  const _$_ZabbixItem(
      {@required @nullable this.type,
      @required @nullable this.value_type,
      @required @nullable this.name,
      @required @nullable this.lastvalue,
      @required @nullable this.units,
      @required @nullable this.snmp_oid});

  @override
  @nullable
  final String type;
  @override
  @nullable
  final int value_type;
  @override
  @nullable
  final String name;
  @override
  @nullable
  final String lastvalue;
  @override
  @nullable
  final String units;
  @override
  @nullable
  final String snmp_oid;

  @override
  String toString() {
    return 'ZabbixItem(type: $type, value_type: $value_type, name: $name, lastvalue: $lastvalue, units: $units, snmp_oid: $snmp_oid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ZabbixItem &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.value_type, value_type) ||
                const DeepCollectionEquality()
                    .equals(other.value_type, value_type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastvalue, lastvalue) ||
                const DeepCollectionEquality()
                    .equals(other.lastvalue, lastvalue)) &&
            (identical(other.units, units) ||
                const DeepCollectionEquality().equals(other.units, units)) &&
            (identical(other.snmp_oid, snmp_oid) ||
                const DeepCollectionEquality()
                    .equals(other.snmp_oid, snmp_oid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(value_type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastvalue) ^
      const DeepCollectionEquality().hash(units) ^
      const DeepCollectionEquality().hash(snmp_oid);

  @override
  _$ZabbixItemCopyWith<_ZabbixItem> get copyWith =>
      __$ZabbixItemCopyWithImpl<_ZabbixItem>(this, _$identity);
}

abstract class _ZabbixItem implements ZabbixItem {
  const factory _ZabbixItem(
      {@required @nullable String type,
      @required @nullable int value_type,
      @required @nullable String name,
      @required @nullable String lastvalue,
      @required @nullable String units,
      @required @nullable String snmp_oid}) = _$_ZabbixItem;

  @override
  @nullable
  String get type;
  @override
  @nullable
  int get value_type;
  @override
  @nullable
  String get name;
  @override
  @nullable
  String get lastvalue;
  @override
  @nullable
  String get units;
  @override
  @nullable
  String get snmp_oid;
  @override
  _$ZabbixItemCopyWith<_ZabbixItem> get copyWith;
}
