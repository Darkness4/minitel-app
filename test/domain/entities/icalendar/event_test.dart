import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('addToNotification', () {
    test(
      'should schedule with a future event',
      () async {
        // arrange
        final DateTime tDateTime = DateTime.now().add(const Duration(days: 5));
        const tNotificationSettings = NotificationSettings(
          early: Duration(seconds: 1),
          enabled: true,
          range: Duration(days: 30),
        );
        final tEvent = Event(
          description: "description",
          dtend: tDateTime,
          dtstamp: tDateTime,
          dtstart: tDateTime,
          location: "location",
          summary: "summary",
          uid: "123",
        );
        final mockFlutterLocalNotificationsPlugin =
            MockFlutterLocalNotificationsPlugin();
        final mockMockNotificationDetails = MockNotificationDetails();
        // act
        await tEvent.addToNotification(
          flutterLocalNotificationsPlugin: mockFlutterLocalNotificationsPlugin,
          notificationSettings: tNotificationSettings,
          notificationDetails: mockMockNotificationDetails,
        );
        // assert
        final verification =
            verify(mockFlutterLocalNotificationsPlugin.schedule(
          any,
          "summary",
          any,
          captureThat(isA<DateTime>()),
          any,
          payload: anyNamed('payload'),
        ));
        final catchedDateTime = verification.captured.first as DateTime;
        expect(catchedDateTime.toString(),
            equals(tDateTime.subtract(const Duration(seconds: 1)).toString()));
      },
    );

    test(
      'shouldn\'t schedule with a out of range event',
      () async {
        // arrange
        final DateTime tDateTime =
            DateTime.now().add(const Duration(days: 999));
        const tNotificationSettings = NotificationSettings(
          early: Duration(seconds: 1),
          enabled: true,
          range: Duration(days: 0),
        );
        final tEvent = Event(
          description: "description",
          dtend: tDateTime,
          dtstamp: tDateTime,
          dtstart: tDateTime,
          location: "location",
          summary: "summary",
          uid: "123",
        );
        final mockFlutterLocalNotificationsPlugin =
            MockFlutterLocalNotificationsPlugin();
        final mockMockNotificationDetails = MockNotificationDetails();
        // act
        await tEvent.addToNotification(
          flutterLocalNotificationsPlugin: mockFlutterLocalNotificationsPlugin,
          notificationSettings: tNotificationSettings,
          notificationDetails: mockMockNotificationDetails,
        );
        // assert
        verifyZeroInteractions(mockFlutterLocalNotificationsPlugin);
      },
    );
  });
}

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

class MockNotificationDetails extends Mock implements NotificationDetails {}
