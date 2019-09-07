import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_item.dart';

class ServerStatus {
  /// Seconds
  final double pingResponseTime;

  ///
  final int icmpAvailable;

  const ServerStatus({
    this.pingResponseTime,
    this.icmpAvailable,
  });

  factory ServerStatus.fromHost(ZabbixHost host) {
    // Data to fill
    double pingResponseTime;
    int icmpAvailable;

    host.items.forEach((final ZabbixItem item) {
      if (item.name.contains('ICMP response time')) {
        pingResponseTime = double.parse(item.lastvalue);
      } else if (item.name.contains('ICMP ping')) {
        icmpAvailable = int.parse(item.lastvalue);
      } else {
        print('${item.name} unhandled.');
      }
    });
    return ServerStatus(
      pingResponseTime: pingResponseTime,
      icmpAvailable: icmpAvailable,
    );
  }
}
