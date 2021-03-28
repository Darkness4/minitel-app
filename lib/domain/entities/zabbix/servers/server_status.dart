import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

part 'server_status.freezed.dart';

@freezed
class ServerStatus with _$ServerStatus {
  const factory ServerStatus({
    required double pingResponseTime,
    required int icmpAvailable,
  }) = _ServerStatus;

  factory ServerStatus.fromHost(ZabbixHost host) {
    // Data to fill
    var pingResponseTime = 0.0;
    var icmpAvailable = 0;

    for (final item in host.items) {
      if (item.name.contains('ICMP response time')) {
        pingResponseTime = double.parse(item.lastvalue);
      } else if (item.name.contains('ICMP ping')) {
        icmpAvailable = int.parse(item.lastvalue);
      }
    }
    return ServerStatus(
      pingResponseTime: pingResponseTime,
      icmpAvailable: icmpAvailable,
    );
  }
}
