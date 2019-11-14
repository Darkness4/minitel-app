import 'package:equatable/equatable.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_statistics.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

class SwitchStatus extends Equatable {
  /// Status of <port, status>
  final Map<int, SwitchPortStatus> ports;

  /// Most useful SNMP description
  final String description;

  /// Hostname
  final String hostname;

  /// Seconds
  final Duration uptime;

  /// Seconds
  final double pingResponseTime;

  /// Availability of Zabbix agent.
  ///
  /// Possible values are:
  /// 0 - (default) unknown;
  /// 1 - available;
  /// 2 - unavailable
  final int snmpAvailable;

  const SwitchStatus({
    this.ports,
    this.description,
    this.hostname,
    this.uptime,
    this.pingResponseTime,
    this.snmpAvailable,
  });

  @override
  List<Object> get props => [
        this.ports,
        this.description,
        this.hostname,
        this.uptime,
        this.pingResponseTime,
        this.snmpAvailable,
      ];

  static SwitchStatus fromHost(ZabbixHost host) {
    // Data to fill
    final Map<int, SwitchPortStatus> ports = <int, SwitchPortStatus>{};
    String description;
    String hostname;
    Duration uptime;
    double pingResponseTime;
    int snmpAvailable;

    host.items.forEach((final ZabbixItem item) {
      if (item.snmp_oid.contains(SwitchPortStatus.speedOid)) {
        final int port = int.parse(
            item.snmp_oid.replaceAll('${SwitchPortStatus.speedOid}.', ''));
        ports[port] ??= SwitchPortStatus();
        ports[port].speed = int.parse(item.lastvalue);
      } else if (item.snmp_oid.contains(SwitchPortStatus.operStatusOid)) {
        final int port = int.parse(
            item.snmp_oid.replaceAll('${SwitchPortStatus.operStatusOid}.', ''));
        ports[port] ??= SwitchPortStatus();
        ports[port].operStatus = int.parse(item.lastvalue);
      } else if (item.name.contains('Device description')) {
        description = item.lastvalue;
      } else if (item.name.contains('Device name')) {
        hostname = item.lastvalue;
      } else if (item.name.contains('ICMP response time')) {
        pingResponseTime = double.parse(item.lastvalue);
      } else if (item.name.contains('Device uptime')) {
        uptime = Duration(seconds: int.parse(item.lastvalue));
      } else if (item.name.contains('SNMP availability')) {
        snmpAvailable = int.parse(item.lastvalue);
      } else {
        print('${item.name} unhandled.');
      }
    });
    return SwitchStatus(
      snmpAvailable: snmpAvailable,
      description: description,
      hostname: hostname,
      pingResponseTime: pingResponseTime,
      ports: ports,
      uptime: uptime,
    );
  }
}

extension SwitchStatusUtils on SwitchStatus {
  /// Return switch stats
  ///
  /// A list of 2 value is returned.
  /// The first value is a List of int, containing in the number of a status in
  /// this order :
  ///
  /// - up
  /// - down
  /// - testing
  /// - unknown
  /// - dormant
  /// - notPresent
  /// - lowerLayerDown
  ///
  /// The second value is a Map. The key is an up port and the value is the
  /// corresponding speed in String, converted in XXX (G/M/k)bps.
  SwitchPortStatistics count() {
    final SwitchPortStatistics statistics = SwitchPortStatistics();
    ports.forEach((final int port, final SwitchPortStatus portStatus) {
      switch (portStatus.operStatus) {
        case 1:
          statistics.speedMap[port] = _formatUnit(portStatus.speed) + 'bps';
          statistics.up++;
          break;
        case 2:
          statistics.down++;
          break;
        case 3:
          statistics.testing++;
          break;
        case 4:
          statistics.unknown++;
          break;
        case 5:
          statistics.dormant++;
          break;
        case 6:
          statistics.notPresent++;
          break;
        case 7:
          statistics.lowerLayerDown++;
          break;
        default:
          statistics.down++;
          break;
      }
    });

    return statistics;
  }

  String _formatUnit(int number) {
    final int length = number.toString().length;
    if (length <= 3) {
      return '$number ';
    } else if (length <= 6) {
      return '${number / 1e3} k';
    } else if (length <= 9) {
      return '${number / 1e6} M';
    } else {
      return '${number / 1e9} G';
    }
  }
}
