import 'dart:convert';

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
        final tZabbixHost = ZabbixHost(
          host: 'host',
          hostid: 'hostid',
          interfaces: [],
          items: [
            ZabbixItem.fromJson(jsonDecode('''{
              "type": "3",
              "value_type": "3",
              "name": "ICMP ping",
              "units": "",
              "snmp_oid": "",
              "lastvalue": "1"
            }''') as Map<String, dynamic>),
            ZabbixItem.fromJson(jsonDecode('''{
              "type": "3",
              "value_type": "0",
              "name": "ICMP loss",
              "units": "%",
              "snmp_oid": "",
              "lastvalue": "0.0000"
            }''') as Map<String, dynamic>),
            ZabbixItem.fromJson(jsonDecode('''{
              "type": "3",
              "value_type": "0",
              "name": "ICMP response time",
              "units": "s",
              "snmp_oid": "",
              "lastvalue": "1.0"
            }''') as Map<String, dynamic>),
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
