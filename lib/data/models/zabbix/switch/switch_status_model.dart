import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_status.dart';

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
}
