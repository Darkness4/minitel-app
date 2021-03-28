import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/ap/ap_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

void main() {
  final tAPStatus = APStatus(
    hostname: 'PointdaccsBat1et1',
    snmpAvailable: 1,
    uptime: Duration(seconds: double.parse('12565761.2600').floor()),
    users: 32,
    utilization2G: 17,
    utilization5G: 4,
  );

  group('fromHost', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        const tZabbixHost = ZabbixHost(
          host: 'PointdaccsBat1et1',
          hostid: '10264',
          interfaces: [],
          items: [
            ZabbixItem(
              type: '6',
              value_type: 4,
              name: 'AP Hostname',
              units: '',
              snmp_oid: '.1.3.6.1.2.1.1.5.0',
              lastvalue: 'PointdaccsBat1et1',
            ),
            ZabbixItem(
              type: '6',
              value_type: 0,
              name: 'Uptime',
              units: 'uptime',
              snmp_oid: '.1.3.6.1.2.1.1.3.0',
              lastvalue: '12565761.2600',
            ),
            ZabbixItem(
              type: '5',
              value_type: 3,
              name: 'SNMP availability',
              units: '',
              snmp_oid: '',
              lastvalue: '1',
            ),
            ZabbixItem(
              type: '6',
              value_type: 3,
              name: 'Channel utilization 2G (BGN)',
              units: '%',
              snmp_oid: '.1.3.6.1.4.1.41112.1.6.1.1.1.6.1',
              lastvalue: '17',
            ),
            ZabbixItem(
              type: '6',
              value_type: 3,
              name: 'Channel utilization 5G (AC)',
              units: '%',
              snmp_oid: '.1.3.6.1.4.1.41112.1.6.1.1.1.6.2',
              lastvalue: '4',
            ),
            ZabbixItem(
              type: '6',
              value_type: 3,
              name: 'Users \$2 on \$1',
              units: 'Users',
              snmp_oid: '.1.3.6.1.4.1.41112.1.6.1.2.1.8.4',
              lastvalue: '32',
            ),
            ZabbixItem(
              name: 'Trash',
              lastvalue: 'Trash',
              value_type: -1,
              units: 'Trash',
              snmp_oid: 'Trash',
              type: 'Trash',
            ),
          ],
        );
        // act
        final result = APStatus.fromHost(tZabbixHost);
        // assert
        expect(result, tAPStatus);
      },
    );
  });
}
