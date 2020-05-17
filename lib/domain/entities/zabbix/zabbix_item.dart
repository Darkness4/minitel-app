import 'package:freezed_annotation/freezed_annotation.dart';

part 'zabbix_item.freezed.dart';
part 'zabbix_item.g.dart';

List<String> ZabbixItemType = <String>[
  'Zabbix agent',
  'SNMPv1 agent',
  'Zabbix trapper',
  'simple check',
  'SNMPv2 agent',
  'Zabbix internal',
  'SNMPv3 agent',
  'Zabbix agent (active)',
  'Zabbix aggregate',
  'web item',
  'external check',
  'database monitor',
  'IPMI agent',
  'SSH agent',
  'TELNET agent',
  'calculated',
  'JMX agent',
  'SNMP trap',
  'Dependent item',
];

/// This is used to store data from a host.
@freezed
abstract class ZabbixItem with _$ZabbixItem {
  const factory ZabbixItem({
    @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) String type,
    @JsonKey(fromJson: _valueTypeFromJson, toJson: _valueTypeToJson)
        int value_type,
    String name,
    String lastvalue,
    String units,
    String snmp_oid,
  }) = _ZabbixItem;

  factory ZabbixItem.fromJson(Map<String, dynamic> json) =>
      _$ZabbixItemFromJson(json);
}

String _typeFromJson(dynamic type) {
  return ZabbixItemType[int.parse(type.toString())];
}

int _typeToJson(String type) {
  return ZabbixItemType.indexOf(type);
}

int _valueTypeFromJson(dynamic value_type) {
  return int.parse(value_type.toString());
}

String _valueTypeToJson(int value_type) {
  return "'$value_type'";
}
