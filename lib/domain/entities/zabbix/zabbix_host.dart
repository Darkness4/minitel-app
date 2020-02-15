import 'package:equatable/equatable.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_interface.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

/// A host in Zabbix is a networked entity that you wish to monitor.
///
/// The definition of what can be a “host” in Zabbix is quite flexible.
/// It can be a physical server, a network switch, a virtual machine or some
/// application.
class ZabbixHost extends Equatable {
  /// ID of the host.
  final String hostid;

  /// Technical name of the host.
  final String host;

  /// List of [ZabbixItem]
  final List<ZabbixItem> items;

  /// List of [ZabbixInterface]
  final List<ZabbixInterface> interfaces;

  const ZabbixHost({
    this.hostid,
    this.host,
    this.items,
    this.interfaces,
  });

  @override
  List<Object> get props => [
        this.hostid,
        this.host,
        this.items,
        this.interfaces,
      ];
}
