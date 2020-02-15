import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_status.dart';

void main() {
  const tSwitchPortStatus = SwitchPortStatus(
    operStatus: 1,
    speed: 10,
  );

  group('copyWith', () {
    test(
      'should return a valid Instance with speed modified',
      () async {
        // act
        final result = tSwitchPortStatus.copyWith(speed: 2);
        // assert
        expect(
          result,
          const SwitchPortStatus(
            operStatus: 1,
            speed: 2,
          ),
        );
      },
    );

    test(
      'should return a valid Instance with operStatus modified',
      () async {
        // act
        final result = tSwitchPortStatus.copyWith(operStatus: 2);
        // assert
        expect(
          result,
          const SwitchPortStatus(
            operStatus: 2,
            speed: 10,
          ),
        );
      },
    );
  });
}
