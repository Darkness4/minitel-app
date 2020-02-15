import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_interface_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_interface.dart';

void main() {
  const tZabbixInterfaceModel = ZabbixInterfaceModel(
    ip: '10.163.0.22',
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = <String, dynamic>{
          "ip": "10.163.0.22",
        };
        // act
        final result = ZabbixInterfaceModel.fromJson(jsonMap);
        // assert
        expect(result, tZabbixInterfaceModel);
      },
    );
  });

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tZabbixInterfaceModel, isA<ZabbixInterface>());
    },
  );
}
