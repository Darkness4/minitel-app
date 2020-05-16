import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_port_status.freezed.dart';

@freezed
abstract class SwitchPortStatus with _$SwitchPortStatus {
  static const String speedOid = '1.3.6.1.2.1.2.2.1.5';
  static const String operStatusOid = '1.3.6.1.2.1.2.2.1.8';

  const factory SwitchPortStatus({
    @required @nullable int speed,
    @required @nullable int operStatus,
  }) = _SwitchPortStatus;
}
