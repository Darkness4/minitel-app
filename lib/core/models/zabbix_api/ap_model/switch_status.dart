import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_item.dart';

class APStatus {
  /// Hostname
  final String hostname;

  /// Seconds
  final Duration uptime;

  final int utilization5G;

  final int utilization2G;

  final int users;

  /// Availability of Zabbix agent.
  ///
  /// Possible values are:
  /// 0 - (default) unknown;
  /// 1 - available;
  /// 2 - unavailable
  final int available;

  const APStatus({
    this.hostname,
    this.uptime,
    this.utilization5G,
    this.utilization2G,
    this.users,
    this.available,
  });

  factory APStatus.fromHost(ZabbixHost host) {
    // Data to fill
    String hostname;
    Duration uptime;
    int available;
    int utilization5G;
    int utilization2G;
    int users = 0;

    host.items.forEach((final ZabbixItem item) {
      if (item.name.contains('AP Hostname')) {
        hostname = item.lastvalue;
      } else if (item.name.contains('Uptime')) {
        uptime = Duration(seconds: double.parse(item.lastvalue).floor());
      } else if (item.name.contains('SNMP availability')) {
        available = int.parse(item.lastvalue);
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
    return APStatus(
      available: available,
      hostname: hostname,
      uptime: uptime,
      utilization5G: utilization5G,
      utilization2G: utilization2G,
      users: users,
    );
  }
}
