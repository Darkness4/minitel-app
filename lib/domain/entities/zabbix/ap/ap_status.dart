import 'package:equatable/equatable.dart';

class APStatus extends Equatable {
  /// Hostname
  final String hostname;

  /// Seconds
  final Duration uptime;

  final int utilization5G;

  final int utilization2G;

  final int users;

  /// Availability of Zabbix agent.
  ///
  /// Possible values are:
  /// 0 - (default) unknown;
  /// 1 - available;
  /// 2 - unavailable
  final int snmpAvailable;

  const APStatus({
    this.hostname,
    this.uptime,
    this.utilization5G,
    this.utilization2G,
    this.users,
    this.snmpAvailable,
  });

  @override
  List<Object> get props => [
        this.hostname,
        this.uptime,
        this.utilization5G,
        this.utilization2G,
        this.users,
        this.snmpAvailable,
      ];
}
