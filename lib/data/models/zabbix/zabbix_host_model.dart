import 'package:minitel_toolbox/data/models/zabbix/zabbix_interface_model.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_item_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_interface.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

/// A host in Zabbix is a networked entity that you wish to monitor.
///
/// The definition of what can be a “host” in Zabbix is quite flexible.
/// It can be a physical server, a network switch, a virtual machine or some
/// application.
class ZabbixHostModel extends ZabbixHost {
  const ZabbixHostModel({
    String id,
    String host,
    List<ZabbixItem> items,
    List<ZabbixInterface> interfaces,
    String ip,
  }) : super(
          id: id,
          host: host,
          items: items,
          interfaces: interfaces,
          ip: ip,
        );

  factory ZabbixHostModel.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(json['items'] as List<dynamic>);
    final List<Map<String, dynamic>> interfaces =
        List<Map<String, dynamic>>.from(json['interfaces'] as List<dynamic>);
    return ZabbixHostModel(
      host: json['host'] as String,
      id: json['id'] as String,
      interfaces: interfaces
          .map((Map<String, dynamic> item) =>
              ZabbixInterfaceModel.fromJson(item))
          .toList(),
      items: items
          .map((Map<String, dynamic> item) => ZabbixItemModel.fromJson(item))
          .toList(),
    );
  }
}
