import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

part 'server_status.freezed.dart';

@freezed
abstract class ServerStatus with _$ServerStatus {
  const factory ServerStatus({
    @required @nullable double pingResponseTime,
    @required @nullable int icmpAvailable,
  }) = _ServerStatus;

  factory ServerStatus.fromHost(ZabbixHost host) {
    // Data to fill
    double pingResponseTime;
    int icmpAvailable;

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
