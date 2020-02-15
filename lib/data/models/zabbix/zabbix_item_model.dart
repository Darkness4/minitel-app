import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

/// This is used to store data from a host.
class ZabbixItemModel extends ZabbixItem {
  const ZabbixItemModel({
    String type,
    int value_type,
    String name,
    String lastvalue,
    String units,
    String snmp_oid,
  }) : super(
            type: type,
            value_type: value_type,
            name: name,
            lastvalue: lastvalue,
            units: units,
            snmp_oid: snmp_oid);

  factory ZabbixItemModel.fromJson(Map<String, dynamic> json) {
    return ZabbixItemModel(
      type: ZabbixItemType[int.parse(json['type'].toString())],
      value_type: int.parse(json['value_type'].toString()),
      name: json['name'] as String,
      lastvalue: json['lastvalue'] as String,
      units: json['units'] as String,
      snmp_oid: json['snmp_oid'] as String,
    );
  }
}

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
