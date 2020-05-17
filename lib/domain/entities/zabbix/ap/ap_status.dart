import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

part 'ap_status.freezed.dart';

@freezed
abstract class APStatus with _$APStatus {
  const factory APStatus({
    @required @nullable String hostname,
    @required @nullable Duration uptime,
    @required @nullable int utilization5G,
    @required @nullable int utilization2G,
    @required @nullable int users,
    @required @nullable int snmpAvailable,
  }) = _APStatus;

  static APStatus fromHost(ZabbixHost host) {
    // Data to fill
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
    return APStatus(
      snmpAvailable: snmpAvailable,
      hostname: hostname,
      uptime: uptime,
      utilization5G: utilization5G,
      utilization2G: utilization2G,
      users: users,
    );
  }
}
