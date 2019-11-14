import 'package:equatable/equatable.dart';

/// This is used to store interface data from a host.
class ZabbixInterface extends Equatable {
  final String ip;

  const ZabbixInterface({
    this.ip,
  });

  @override
  List<Object> get props => [
        this.ip,
      ];
}
