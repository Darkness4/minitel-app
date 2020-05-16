import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

part 'server_status.freezed.dart';

@freezed
abstract class ServerStatus with _$ServerStatus {
  const factory ServerStatus({
    @required @nullable double pingResponseTime,
    @required @nullable int icmpAvailable,
  }) = _ServerStatus;
}

extension ServerStatusX on ServerStatus {
  static ServerStatus fromHost(ZabbixHost host) {
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
