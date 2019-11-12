import 'dart:collection';

import 'package:equatable/equatable.dart';

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

  @override
  List<Object> get props => [
        this.ports,
        this.description,
        this.hostname,
        this.uptime,
        this.pingResponseTime,
        this.snmpAvailable,
      ];
}

class SwitchPortStatistics {
  int up = 0;
  int down = 0;
  int testing = 0;
  int unknown = 0;
  int dormant = 0;
  int notPresent = 0;
  int lowerLayerDown = 0;
  final SplayTreeMap<int, String> speedMap =
      SplayTreeMap<int, String>((int key1, int key2) => key1.compareTo(key2));

  @override
  String toString() {
    return 'Up: $up\n'
        ' | With : $speedMap\n'
        'Down: $down\n'
        'Testing: $testing\n'
        'Unknown: $unknown\n'
        'Dormant: $dormant\n'
        'NotPresent: $notPresent\n'
        'LowerLayerDown: $lowerLayerDown';
  }
}

class SwitchPortStatus {
  static const String speedOid = '1.3.6.1.2.1.2.2.1.5';

  /// Speed in bps
  int speed;

  static const String operStatusOid = '1.3.6.1.2.1.2.2.1.8';

  /// Enumeration (1-up, 2-down, 3-testing, 4-unknown, 5-dormant, 6-notPresent, 7-lowerLayerDown)
  int operStatus;
}
