import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/zabbix/switch/switch_status_model.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/switch/switch_status.dart';

void main() {
  const tSwitchStatusModel = SwitchStatusModel();

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tSwitchStatusModel, isA<SwitchStatus>());
    },
  );
}
