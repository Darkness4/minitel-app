import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_interface.dart';

/// This is used to store interface data from a host.
class ZabbixInterfaceModel extends ZabbixInterface {
  const ZabbixInterfaceModel({
    String ip,
  }) : super(
          ip: ip,
        );

  factory ZabbixInterfaceModel.fromJson(Map<String, dynamic> json) {
    return ZabbixInterfaceModel(
      ip: json['ip'] as String,
    );
  }
}
