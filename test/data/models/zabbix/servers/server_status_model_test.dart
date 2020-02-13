import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/zabbix/servers/server_status_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/servers/server_status.dart';

void main() {
  const tServerStatusModel = ServerStatusModel(
    icmpAvailable: 1,
    pingResponseTime: 1.0,
  );

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tServerStatusModel, isA<ServerStatus>());
    },
  );
}
