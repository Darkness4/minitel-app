import 'package:equatable/equatable.dart';

class ServerStatus extends Equatable {
  /// Seconds
  final double pingResponseTime;

  final int icmpAvailable;

  const ServerStatus({
    this.pingResponseTime,
    this.icmpAvailable,
  });

  @override
  List<Object> get props => [
        this.pingResponseTime,
        this.icmpAvailable,
      ];
}
