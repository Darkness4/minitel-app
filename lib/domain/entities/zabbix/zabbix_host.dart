import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_interface.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

part 'zabbix_host.freezed.dart';
part 'zabbix_host.g.dart';

/// A host in Zabbix is a networked entity that you wish to monitor.
///
/// The definition of what can be a “host” in Zabbix is quite flexible.
/// It can be a physical server, a network switch, a virtual machine or some
/// application.
@freezed
abstract class ZabbixHost with _$ZabbixHost {
  const factory ZabbixHost({
    @required @nullable String hostid,
    @required @nullable String host,
    @required @nullable List<ZabbixItem> items,
    @required @nullable List<ZabbixInterface> interfaces,
  }) = _ZabbixHost;

  factory ZabbixHost.fromJson(Map<String, dynamic> json) =>
      _$ZabbixHostFromJson(json);
}
