// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zabbix_host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ZabbixHost _$_$_ZabbixHostFromJson(Map<String, dynamic> json) {
  return _$_ZabbixHost(
    hostid: json['hostid'] as String,
    host: json['host'] as String,
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ZabbixItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    interfaces: (json['interfaces'] as List)
        ?.map((e) => e == null
            ? null
            : ZabbixInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ZabbixHostToJson(_$_ZabbixHost instance) =>
    <String, dynamic>{
      'hostid': instance.hostid,
      'host': instance.host,
      'items': instance.items,
      'interfaces': instance.interfaces,
    };
