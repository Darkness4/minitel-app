// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zabbix_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ZabbixItem _$_$_ZabbixItemFromJson(Map<String, dynamic> json) {
  return _$_ZabbixItem(
    type: _typeFromJson(json['type']),
    value_type: _valueTypeFromJson(json['value_type']),
    name: json['name'] as String,
    lastvalue: json['lastvalue'] as String,
    units: json['units'] as String,
    snmp_oid: json['snmp_oid'] as String,
  );
}

Map<String, dynamic> _$_$_ZabbixItemToJson(_$_ZabbixItem instance) =>
    <String, dynamic>{
      'type': _typeToJson(instance.type),
      'value_type': _valueTypeToJson(instance.value_type),
      'name': instance.name,
      'lastvalue': instance.lastvalue,
      'units': instance.units,
      'snmp_oid': instance.snmp_oid,
    };
