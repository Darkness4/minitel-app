// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'zabbix_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ZabbixItem _$ZabbixItemFromJson(Map<String, dynamic> json) {
  return _ZabbixItem.fromJson(json);
}

class _$ZabbixItemTearOff {
  const _$ZabbixItemTearOff();

  _ZabbixItem call(
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          String type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          int value_type,
      String name,
      String lastvalue,
      String units,
      String snmp_oid}) {
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
  @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
  String get type;
  @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
  int get value_type;
  String get name;
  String get lastvalue;
  String get units;
  String get snmp_oid;

  Map<String, dynamic> toJson();
  $ZabbixItemCopyWith<ZabbixItem> get copyWith;
}

abstract class $ZabbixItemCopyWith<$Res> {
  factory $ZabbixItemCopyWith(
          ZabbixItem value, $Res Function(ZabbixItem) then) =
      _$ZabbixItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          String type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          int value_type,
      String name,
      String lastvalue,
      String units,
      String snmp_oid});
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
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          String type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          int value_type,
      String name,
      String lastvalue,
      String units,
      String snmp_oid});
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

@JsonSerializable()
class _$_ZabbixItem implements _ZabbixItem {
  const _$_ZabbixItem(
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          this.type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          this.value_type,
      this.name,
      this.lastvalue,
      this.units,
      this.snmp_oid});

  factory _$_ZabbixItem.fromJson(Map<String, dynamic> json) =>
      _$_$_ZabbixItemFromJson(json);

  @override
  @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
  final String type;
  @override
  @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
  final int value_type;
  @override
  final String name;
  @override
  final String lastvalue;
  @override
  final String units;
  @override
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

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ZabbixItemToJson(this);
  }
}

abstract class _ZabbixItem implements ZabbixItem {
  const factory _ZabbixItem(
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          String type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          int value_type,
      String name,
      String lastvalue,
      String units,
      String snmp_oid}) = _$_ZabbixItem;

  factory _ZabbixItem.fromJson(Map<String, dynamic> json) =
      _$_ZabbixItem.fromJson;

  @override
  @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
  String get type;
  @override
  @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
  int get value_type;
  @override
  String get name;
  @override
  String get lastvalue;
  @override
  String get units;
  @override
  String get snmp_oid;
  @override
  _$ZabbixItemCopyWith<_ZabbixItem> get copyWith;
}
