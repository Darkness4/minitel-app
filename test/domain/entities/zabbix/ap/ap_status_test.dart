import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/ap/ap_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

void main() {
  final tAPStatus = APStatus(
    hostname: 'PointdaccsBat1et1',
    snmpAvailable: 1,
    uptime: Duration(seconds: double.parse('11871193.6500').floor()),
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
          host: 'host',
          hostid: 'hostid',
          interfaces: [],
          items: [
            ZabbixItem(
              name: 'AP Hostname',
              lastvalue: 'PointdaccsBat1et1',
            ),
            ZabbixItem(
              name: 'Uptime',
              lastvalue: '11871193.6500',
            ),
            ZabbixItem(
              name: 'SNMP availability',
              lastvalue: '1',
            ),
            ZabbixItem(
              name: 'Channel utilization 2G',
              lastvalue: '17',
            ),
            ZabbixItem(
              name: 'Channel utilization 5G',
              lastvalue: '4',
            ),
            ZabbixItem(
              name: 'Users \$2 on \$1',
              lastvalue: '32',
            ),
            ZabbixItem(
              name: 'Trash',
              lastvalue: 'Trash',
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
