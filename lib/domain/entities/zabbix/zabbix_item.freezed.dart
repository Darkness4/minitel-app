// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'zabbix_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZabbixItem _$ZabbixItemFromJson(Map<String, dynamic> json) {
  return _ZabbixItem.fromJson(json);
}

/// @nodoc
class _$ZabbixItemTearOff {
  const _$ZabbixItemTearOff();

  _ZabbixItem call(
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          required String type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          required int value_type,
      required String name,
      required String lastvalue,
      required String units,
      required String snmp_oid}) {
    return _ZabbixItem(
      type: type,
      value_type: value_type,
      name: name,
      lastvalue: lastvalue,
      units: units,
      snmp_oid: snmp_oid,
    );
  }

  ZabbixItem fromJson(Map<String, Object> json) {
    return ZabbixItem.fromJson(json);
  }
}

/// @nodoc
const $ZabbixItem = _$ZabbixItemTearOff();

/// @nodoc
mixin _$ZabbixItem {
  @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
  int get value_type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get lastvalue => throw _privateConstructorUsedError;
  String get units => throw _privateConstructorUsedError;
  String get snmp_oid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZabbixItemCopyWith<ZabbixItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
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

/// @nodoc
class _$ZabbixItemCopyWithImpl<$Res> implements $ZabbixItemCopyWith<$Res> {
  _$ZabbixItemCopyWithImpl(this._value, this._then);

  final ZabbixItem _value;
  // ignore: unused_field
  final $Res Function(ZabbixItem) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? value_type = freezed,
    Object? name = freezed,
    Object? lastvalue = freezed,
    Object? units = freezed,
    Object? snmp_oid = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value_type: value_type == freezed
          ? _value.value_type
          : value_type // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastvalue: lastvalue == freezed
          ? _value.lastvalue
          : lastvalue // ignore: cast_nullable_to_non_nullable
              as String,
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      snmp_oid: snmp_oid == freezed
          ? _value.snmp_oid
          : snmp_oid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
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

/// @nodoc
class __$ZabbixItemCopyWithImpl<$Res> extends _$ZabbixItemCopyWithImpl<$Res>
    implements _$ZabbixItemCopyWith<$Res> {
  __$ZabbixItemCopyWithImpl(
      _ZabbixItem _value, $Res Function(_ZabbixItem) _then)
      : super(_value, (v) => _then(v as _ZabbixItem));

  @override
  _ZabbixItem get _value => super._value as _ZabbixItem;

  @override
  $Res call({
    Object? type = freezed,
    Object? value_type = freezed,
    Object? name = freezed,
    Object? lastvalue = freezed,
    Object? units = freezed,
    Object? snmp_oid = freezed,
  }) {
    return _then(_ZabbixItem(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value_type: value_type == freezed
          ? _value.value_type
          : value_type // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastvalue: lastvalue == freezed
          ? _value.lastvalue
          : lastvalue // ignore: cast_nullable_to_non_nullable
              as String,
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      snmp_oid: snmp_oid == freezed
          ? _value.snmp_oid
          : snmp_oid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ZabbixItem implements _ZabbixItem {
  const _$_ZabbixItem(
      {@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
          required this.type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          required this.value_type,
      required this.name,
      required this.lastvalue,
      required this.units,
      required this.snmp_oid});

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

  @JsonKey(ignore: true)
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
          required String type,
      @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
          required int value_type,
      required String name,
      required String lastvalue,
      required String units,
      required String snmp_oid}) = _$_ZabbixItem;

  factory _ZabbixItem.fromJson(Map<String, dynamic> json) =
      _$_ZabbixItem.fromJson;

  @override
  @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
  int get value_type => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get lastvalue => throw _privateConstructorUsedError;
  @override
  String get units => throw _privateConstructorUsedError;
  @override
  String get snmp_oid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ZabbixItemCopyWith<_ZabbixItem> get copyWith =>
      throw _privateConstructorUsedError;
}
