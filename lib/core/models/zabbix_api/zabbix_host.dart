import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_interface.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_item.dart';

/// A host in Zabbix is a networked entity that you wish to monitor.
///
/// The definition of what can be a “host” in Zabbix is quite flexible.
/// It can be a physical server, a network switch, a virtual machine or some
/// application.
class ZabbixHost {
  /// ID of the host.
  final String id;

  /// Technical name of the host.
  final String host;

  /// List of [ZabbixItem]
  final List<ZabbixItem> items;

  /// List of [ZabbixInterface]
  final List<ZabbixInterface> interfaces;

  final String ip;

  const ZabbixHost({
    this.id,
    this.host,
    this.items,
    this.interfaces,
    this.ip,
  });

  factory ZabbixHost.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(json['items']);
    final List<Map<String, dynamic>> interfaces =
        List<Map<String, dynamic>>.from(json['interfaces']);
    return ZabbixHost(
      host: json['host'],
      id: json['id'],
      interfaces: interfaces
          .map((Map<String, dynamic> item) => ZabbixInterface.fromJson(item))
          .toList(),
      items: items
          .map((Map<String, dynamic> item) => ZabbixItem.fromJson(item))
          .toList(),
    );
  }
}
