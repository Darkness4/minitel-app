/// This is used to store data from a host.
class ZabbixItem {
  /// Type of the item.
  ///
  /// Possible values:
  /// - 0 - Zabbix agent;
  /// - 1 - SNMPv1 agent;
  /// - 2 - Zabbix trapper;
  /// - 3 - simple check;
  /// - 4 - SNMPv2 agent;
  /// - 5 - Zabbix internal;
  /// - 6 - SNMPv3 agent;
  /// - 7 - Zabbix agent (active);
  /// - 8 - Zabbix aggregate;
  /// - 9 - web item;
  /// - 10 - external check;
  /// - 11 - database monitor;
  /// - 12 - IPMI agent;
  /// - 13 - SSH agent;
  /// - 14 - TELNET agent;
  /// - 15 - calculated;
  /// - 16 - JMX agent;
  /// - 17 - SNMP trap;
  /// - 18 - Dependent item
  final String type;

  /// Type of information of the item.
  ///
  /// Possible values:
  /// - 0 - numeric float;
  /// - 1 - character;
  /// - 2 - log;
  /// - 3 - numeric unsigned;
  /// - 4 - text.
  final int value_type;

  /// Name of the item.
  final String name;

  /// Last value of the item.
  final String lastvalue;

  /// Value units.
  final String units;

  /// Value units.
  final String snmp_oid;

  const ZabbixItem({
    this.type,
    this.value_type,
    this.name,
    this.lastvalue,
    this.units,
    this.snmp_oid,
  });

  factory ZabbixItem.fromJson(Map<String, dynamic> json) {
    return ZabbixItem(
      type: ZabbixItemType[int.parse(json['type'])],
      value_type: int.parse(json['value_type']),
      name: json['name'],
      lastvalue: json['lastvalue'],
      units: json['units'],
      snmp_oid: json['snmp_oid'],
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
