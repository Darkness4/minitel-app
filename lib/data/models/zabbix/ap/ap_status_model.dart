import 'package:minitel_toolbox/domain/entities/zabbix/ap/ap_status.dart';

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
}
