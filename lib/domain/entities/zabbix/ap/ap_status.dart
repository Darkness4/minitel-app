import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

part 'ap_status.freezed.dart';

@freezed
class APStatus with _$APStatus {
  const factory APStatus({
    required String hostname,
    required Duration uptime,
    required int utilization5G,
    required int utilization2G,
    required int users,
    required int snmpAvailable,
  }) = _APStatus;

  factory APStatus.fromHost(ZabbixHost host) {
    // Data to fill
    String? hostname;
    Duration? uptime;
    var snmpAvailable = 0;
    var utilization5G = 0;
    var utilization2G = 0;
    var users = 0;

    for (final item in host.items) {
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
      }
    }
    return APStatus(
      snmpAvailable: snmpAvailable,
      hostname: hostname!,
      uptime: uptime!,
      utilization5G: utilization5G,
      utilization2G: utilization2G,
      users: users,
    );
  }
}
