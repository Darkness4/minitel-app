import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_statistics.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_port_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

void main() {
  group('fromHost', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        const tSwitchPortStatus = SwitchPortStatus(
          operStatus: 1,
          speed: 10,
        );
        const tSwitchStatus = SwitchStatus(
          description: 'description',
          hostname: 'hostname',
          ports: {0: tSwitchPortStatus},
          pingResponseTime: 1.0,
          snmpAvailable: 1,
          uptime: Duration(seconds: 1),
        );
        const tZabbixHost = ZabbixHost(
          host: 'host',
          hostid: 'hostid',
          interfaces: [],
          items: [
            ZabbixItem(
              type: '6',
              value_type: 3,
              name: 'Interface Slot: 0 Port: 0 Gigabit - Level: Speed',
              units: 'bps',
              lastvalue: '10',
              snmp_oid: '${SwitchPortStatus.speedOid}.0',
            ),
            ZabbixItem(
              type: '6',
              value_type: 3,
              name:
                  'Interface Slot: 0 Port: 0 Gigabit - Level: Operational status',
              units: 'bps',
              lastvalue: '1',
              snmp_oid: '${SwitchPortStatus.operStatusOid}.0',
            ),
            ZabbixItem(
              type: '6',
              value_type: 1,
              units: '',
              name: 'Device description',
              lastvalue: 'description',
              snmp_oid: '',
            ),
            ZabbixItem(
              type: '6',
              value_type: 1,
              units: '',
              name: 'Device name',
              lastvalue: 'hostname',
              snmp_oid: '1.3.6.1.2.1.1.5.0',
            ),
            ZabbixItem(
              type: '3',
              value_type: 0,
              units: 's',
              name: 'ICMP response time',
              lastvalue: '1.0',
              snmp_oid: '',
            ),
            ZabbixItem(
              type: '6',
              value_type: 3,
              units: '',
              name: 'Device uptime',
              lastvalue: '1',
              snmp_oid: '1.3.6.1.2.1.1.3.0',
            ),
            ZabbixItem(
              type: '5',
              value_type: 1,
              units: '',
              name: 'SNMP availability',
              lastvalue: '1',
              snmp_oid: '',
            ),
            ZabbixItem(
              type: 'Trash',
              value_type: -1,
              units: 'Trash',
              name: 'Trash',
              lastvalue: 'Trash',
              snmp_oid: 'Trash',
            ),
          ],
        );
        // act
        final result = SwitchStatus.fromHost(tZabbixHost);
        // assert
        expect(result, tSwitchStatus);
      },
    );
  });

  group('count', () {
    test(
      'should return a valid SwitchPortStatistics',
      () async {
        // arrange
        const tSwitchStatus = SwitchStatus(
          description: 'description',
          hostname: 'hostname',
          ports: {
            0: SwitchPortStatus(
              operStatus: 1,
              speed: 10,
            ),
            8: SwitchPortStatus(
              operStatus: 1,
              speed: 1000,
            ),
            9: SwitchPortStatus(
              operStatus: 1,
              speed: 1000000,
            ),
            10: SwitchPortStatus(
              operStatus: 1,
              speed: 1000000000,
            ),
            1: SwitchPortStatus(
              operStatus: 2,
              speed: 0,
            ),
            2: SwitchPortStatus(
              operStatus: 3,
              speed: 0,
            ),
            3: SwitchPortStatus(
              operStatus: 4,
              speed: 0,
            ),
            4: SwitchPortStatus(
              operStatus: 5,
              speed: 0,
            ),
            5: SwitchPortStatus(
              operStatus: 6,
              speed: 0,
            ),
            6: SwitchPortStatus(
              operStatus: 7,
              speed: 0,
            ),
            7: SwitchPortStatus(
              operStatus: 0,
              speed: 0,
            ),
          },
          pingResponseTime: 1.0,
          snmpAvailable: 1,
          uptime: Duration(seconds: 1),
        );
        // act
        final result = tSwitchStatus.count();
        // assert
        final expectedSwitchPortStatistics = SwitchPortStatistics()
          ..speedMap[0] = '10 bps'
          ..speedMap[8] = '1.0 kbps'
          ..speedMap[9] = '1.0 Mbps'
          ..speedMap[10] = '1.0 Gbps'
          ..up = 4
          ..down = 2
          ..dormant = 1
          ..testing = 1
          ..unknown = 1
          ..notPresent = 1
          ..lowerLayerDown = 1;
        expect(result.toString(), expectedSwitchPortStatistics.toString());
      },
    );
  });
}
