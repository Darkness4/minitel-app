import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_statistics.dart';

void main() {
  final tSwitchPortStatistics = SwitchPortStatistics();

  group('toString', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        tSwitchPortStatistics.speedMap[0] = "100Mbps";
        tSwitchPortStatistics.speedMap[1] = "10Mbps";
        // act
        final result = tSwitchPortStatistics.toString();
        // assert
        expect(
            result,
            'Up: 0\n'
            ' | With : {0: 100Mbps, 1: 10Mbps}\n'
            'Down: 0\n'
            'Testing: 0\n'
            'Unknown: 0\n'
            'Dormant: 0\n'
            'NotPresent: 0\n'
            'LowerLayerDown: 0');
      },
    );
  });
}
