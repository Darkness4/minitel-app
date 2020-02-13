import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/notifications_model.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';

void main() {
  const NotificationSettingsModel tNotificationSettingsModel =
      NotificationSettingsModel(
    early: Duration(minutes: 10),
    range: Duration(days: 30),
    enabled: true,
  );
  const NotificationSettings tNotificationSettings = NotificationSettings(
    early: Duration(minutes: 10),
    range: Duration(days: 30),
    enabled: true,
  );

  test(
    'should be a subclass of NotificationSettings entity',
    () async {
      // assert
      expect(tNotificationSettingsModel, isA<NotificationSettings>());
    },
  );

  group('fromEntity', () {
    test(
      'should return a valid model from Entity',
      () async {
        // act
        final result =
            NotificationSettingsModel.fromEntity(tNotificationSettings);
        // assert
        expect(result, equals(tNotificationSettingsModel));
      },
    );
  });
}
