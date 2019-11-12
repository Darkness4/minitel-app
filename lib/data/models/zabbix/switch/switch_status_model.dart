import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

class SwitchStatusModel extends SwitchStatus {
  const SwitchStatusModel({
    Map<int, SwitchPortStatus> ports,
    String description,
    String hostname,
    Duration uptime,
    double pingResponseTime,
    int snmpAvailable,
  }) : super(
          ports: ports,
          description: description,
          hostname: hostname,
          uptime: uptime,
          pingResponseTime: pingResponseTime,
          snmpAvailable: snmpAvailable,
        );

  factory SwitchStatusModel.fromHost(ZabbixHost host) {
    // Data to fill
    final Map<int, SwitchPortStatus> ports = <int, SwitchPortStatus>{};
    String description;
    String hostname;
    Duration uptime;
    double pingResponseTime;
    int snmpAvailable;

    host.items.forEach((final ZabbixItem item) {
      if (item.snmp_oid.contains(SwitchPortStatus.speedOid)) {
        final int port = int.parse(
            item.snmp_oid.replaceAll('${SwitchPortStatus.speedOid}.', ''));
        ports[port] ??= SwitchPortStatus();
        ports[port].speed = int.parse(item.lastvalue);
      } else if (item.snmp_oid.contains(SwitchPortStatus.operStatusOid)) {
        final int port = int.parse(
            item.snmp_oid.replaceAll('${SwitchPortStatus.operStatusOid}.', ''));
        ports[port] ??= SwitchPortStatus();
        ports[port].operStatus = int.parse(item.lastvalue);
      } else if (item.name.contains('Device description')) {
        description = item.lastvalue;
      } else if (item.name.contains('Device name')) {
        hostname = item.lastvalue;
      } else if (item.name.contains('ICMP response time')) {
        pingResponseTime = double.parse(item.lastvalue);
      } else if (item.name.contains('Device uptime')) {
        uptime = Duration(seconds: int.parse(item.lastvalue));
      } else if (item.name.contains('SNMP availability')) {
        snmpAvailable = int.parse(item.lastvalue);
      } else {
        print('${item.name} unhandled.');
      }
    });
    return SwitchStatusModel(
      snmpAvailable: snmpAvailable,
      description: description,
      hostname: hostname,
      pingResponseTime: pingResponseTime,
      ports: ports,
      uptime: uptime,
    );
  }
}
