import 'package:minitel_toolbox/domain/entities/zabbix/ap/ap_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

class APStatusModel extends APStatus {
  const APStatusModel({
    String hostname,
    Duration uptime,
    int utilization5G,
    int utilization2G,
    int users,
    int snmpAvailable,
  }) : super(
          hostname: hostname,
          uptime: uptime,
          utilization2G: utilization2G,
          utilization5G: utilization5G,
          users: users,
          snmpAvailable: snmpAvailable,
        );

  factory APStatusModel.fromHost(ZabbixHost host) {
    String hostname;
    Duration uptime;
    int snmpAvailable;
    int utilization5G;
    int utilization2G;
    int users = 0;

    host.items.forEach((final ZabbixItem item) {
      if (item.name.contains('AP Hostname')) {
        hostname = item.lastvalue;
      } else if (item.name.contains('Uptime')) {
        uptime = Duration(seconds: double.parse(item.lastvalue).floor());
      } else if (item.name.contains('SNMP availability')) {
        snmpAvailable = int.parse(item.lastvalue);
      } else if (item.name.contains('Channel utilization 2G')) {
        utilization2G = int.parse(item.lastvalue);
      } else if (item.name.contains('Channel utilization 5G')) {
        utilization5G = int.parse(item.lastvalue);
      } else if (item.name.contains('Users')) {
        users += int.parse(item.lastvalue);
      } else {
        print('${item.name} unhandled.');
      }
    });
    return APStatusModel(
      snmpAvailable: snmpAvailable,
      hostname: hostname,
      uptime: uptime,
      utilization5G: utilization5G,
      utilization2G: utilization2G,
      users: users,
    );
  }
}
