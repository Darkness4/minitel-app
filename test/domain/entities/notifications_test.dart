import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';

void main() {
  const tNotificationSettings = NotificationSettings(
    early: Duration(minutes: 10),
    range: Duration(days: 30),
    enabled: true,
  );

  group('copyWith', () {
    test(
      'should return a valid Entity with early modified',
      () async {
        // act
        final result =
            tNotificationSettings.copyWith(early: const Duration(minutes: 9));
        // assert
        expect(
          result,
          equals(
            const NotificationSettings(
              early: Duration(minutes: 9),
              range: Duration(days: 30),
              enabled: true,
            ),
          ),
        );
      },
    );

    test(
      'should return a valid Entity with range modified',
      () async {
        // act
        final result =
            tNotificationSettings.copyWith(range: const Duration(minutes: 9));
        // assert
        expect(
          result,
          equals(
            const NotificationSettings(
              early: Duration(minutes: 10),
              range: Duration(minutes: 9),
              enabled: true,
            ),
          ),
        );
      },
    );
  });
}
