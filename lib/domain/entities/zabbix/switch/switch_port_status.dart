import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_port_status.freezed.dart';

@freezed
class SwitchPortStatus with _$SwitchPortStatus {
  static const String speedOid = '1.3.6.1.2.1.2.2.1.5';
  static const String operStatusOid = '1.3.6.1.2.1.2.2.1.8';

  const factory SwitchPortStatus({
    required int speed,
    required int operStatus,
  }) = _SwitchPortStatus;
}

class SwitchPortStatusBuilder {
  int? speed;
  int? operStatus;

  SwitchPortStatus build() {
    return SwitchPortStatus(
      speed: speed!,
      operStatus: operStatus!,
    );
  }
}
