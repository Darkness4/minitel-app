import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/servers/server_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_item.dart';

void main() {
  const tServerStatus = ServerStatus(
    icmpAvailable: 1,
    pingResponseTime: 1.0,
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
              name: 'ICMP response time',
              lastvalue: '1.0',
            ),
            ZabbixItem(
              name: 'ICMP ping',
              lastvalue: '1',
            ),
            ZabbixItem(
              name: 'Trash',
              lastvalue: 'Trash',
            ),
          ],
        );
        // act
        final result = ServerStatus.fromHost(tZabbixHost);
        // assert
        expect(result, tServerStatus);
      },
    );
  });
}
