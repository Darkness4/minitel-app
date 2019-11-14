import 'package:minitel_toolbox/domain/entities/zabbix/servers/server_status.dart';

class ServerStatusModel extends ServerStatus {
  const ServerStatusModel({
    double pingResponseTime,
    int icmpAvailable,
  }) : super(
          pingResponseTime: pingResponseTime,
          icmpAvailable: icmpAvailable,
        );
}
