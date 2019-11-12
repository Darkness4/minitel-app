import 'package:minitel_toolbox/domain/entities/zabbix/servers/server_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

class ServerStatusModel extends ServerStatus {
  const ServerStatusModel({
    double pingResponseTime,
    int icmpAvailable,
  }) : super(
          pingResponseTime: pingResponseTime,
          icmpAvailable: icmpAvailable,
        );

  factory ServerStatusModel.fromHost(ZabbixHost host) {
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
    return ServerStatusModel(
      pingResponseTime: pingResponseTime,
      icmpAvailable: icmpAvailable,
    );
  }
}
