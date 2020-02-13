import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/zabbix/switch/switch_status_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_status.dart';

void main() {
  const tSwitchStatusModel = SwitchStatusModel(
    description: 'description',
    hostname: 'hostname',
    pingResponseTime: 1.0,
    snmpAvailable: 1,
    uptime: Duration(seconds: 1),
    ports: <int, SwitchPortStatus>{
      0: SwitchPortStatus(operStatus: 1, speed: 1),
    },
  );

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tSwitchStatusModel, isA<SwitchStatus>());
    },
  );
}
