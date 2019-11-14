class SwitchPortStatus {
  static const String speedOid = '1.3.6.1.2.1.2.2.1.5';

  /// Speed in bps
  int speed;

  static const String operStatusOid = '1.3.6.1.2.1.2.2.1.8';

  /// Enumeration (1-up, 2-down, 3-testing, 4-unknown, 5-dormant, 6-notPresent, 7-lowerLayerDown)
  int operStatus;
}
