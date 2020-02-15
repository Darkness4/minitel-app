import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_host_model.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_interface_model.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_item_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

void main() {
  const tZabbixInterfaceModel = ZabbixInterfaceModel(
    ip: '10.163.0.22',
  );
  const tZabbixItemModel = ZabbixItemModel(
    type: 'Zabbix agent',
    lastvalue: '44',
    name: r'WIFI Channel $2 on $1',
    snmp_oid: '.1.3.6.1.4.1.41112.1.6.1.2.1.4.2',
    units: 'units',
    value_type: 3,
  );
  const tZabbixHostModel = ZabbixHostModel(
    host: "PointdaccsBat1et1",
    hostid: "10264",
    interfaces: [tZabbixInterfaceModel],
    items: [tZabbixItemModel],
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = <String, dynamic>{
          "hostid": "10264",
          "host": "PointdaccsBat1et1",
          "items": [
            {
              "type": "0",
              "value_type": "3",
              "name": r'WIFI Channel $2 on $1',
              "units": "units",
              "snmp_oid": ".1.3.6.1.4.1.41112.1.6.1.2.1.4.2",
              "lastvalue": "44"
            },
          ],
          "interfaces": [
            {"ip": "10.163.0.22"}
          ]
        };
        // act
        final result = ZabbixHostModel.fromJson(jsonMap);
        // assert
        expect(result, tZabbixHostModel);
      },
    );
  });

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tZabbixHostModel, isA<ZabbixHost>());
    },
  );
}
