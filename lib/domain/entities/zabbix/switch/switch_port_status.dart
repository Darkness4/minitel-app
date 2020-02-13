class SwitchPortStatus {
  static const String speedOid = '1.3.6.1.2.1.2.2.1.5';

  /// Speed in bps
  final int speed;

  static const String operStatusOid = '1.3.6.1.2.1.2.2.1.8';

  /// Enumeration (1-up, 2-down, 3-testing, 4-unknown, 5-dormant, 6-notPresent, 7-lowerLayerDown)
  final int operStatus;

  const SwitchPortStatus({this.speed, this.operStatus});

  SwitchPortStatus copyWith({int speed, int operStatus}) {
    return SwitchPortStatus(
      speed: speed ?? this.speed,
      operStatus: operStatus ?? this.operStatus,
    );
  }
}
