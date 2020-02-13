import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/zabbix/ap/ap_status_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/ap/ap_status.dart';

void main() {
  final tAPStatusModel = APStatusModel(
    hostname: 'PointdaccsBat1et1',
    snmpAvailable: 1,
    uptime: Duration(seconds: double.parse('11871193.6500').floor()),
    users: 32,
    utilization2G: 17,
    utilization5G: 4,
  );

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tAPStatusModel, isA<APStatus>());
    },
  );
}
