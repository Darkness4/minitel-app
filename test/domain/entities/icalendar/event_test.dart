import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'event_test.mocks.dart';

@GenerateMocks([FlutterLocalNotificationsPlugin, NotificationDetails])
void main() {
  tz.initializeTimeZones();

  group('addToNotification', () {
    test(
      'should schedule with a future event',
      () async {
        // arrange
        final tDateTime = tz.TZDateTime.now(tz.getLocation('America/Detroit'))
            .add(const Duration(days: 5));
        const tNotificationSettings = NotificationSettings(
          early: Duration(seconds: 1),
          enabled: true,
          range: Duration(days: 30),
        );
        final tEvent = Event(
          description: 'description',
          dtend: tDateTime,
          dtstamp: tDateTime,
          dtstart: tDateTime,
          location: 'location',
          summary: 'summary',
          uid: '123',
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
            verify(mockFlutterLocalNotificationsPlugin.zonedSchedule(
          any,
          tEvent.summary,
          any,
          captureThat(isA<tz.TZDateTime>()),
          any,
          payload: anyNamed('payload'),
          androidAllowWhileIdle: anyNamed('androidAllowWhileIdle'),
          uiLocalNotificationDateInterpretation:
              anyNamed('uiLocalNotificationDateInterpretation'),
        ));
        final catchedDateTime = verification.captured.first as tz.TZDateTime;
        expect(
            catchedDateTime.toString(),
            equals(tEvent.dtstart
                .subtract(const Duration(seconds: 1))
                .toString()));
      },
    );

    test(
      "shouldn't schedule with a out of range event",
      () async {
        // arrange
        final tDateTime = tz.TZDateTime.now(tz.getLocation('America/Detroit'))
            .add(const Duration(days: 999));
        const tNotificationSettings = NotificationSettings(
          early: Duration(seconds: 1),
          enabled: true,
          range: Duration(),
        );
        final tEvent = Event(
          description: 'description',
          dtend: tDateTime,
          dtstamp: tDateTime,
          dtstart: tDateTime,
          location: 'location',
          summary: 'summary',
          uid: '123',
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

  group('fromMap', () {
    final tEvent = Event(
      dtend: tz.TZDateTime.parse(
          tz.getLocation('America/Detroit'), '20200127T100000'),
      dtstamp: tz.TZDateTime.parse(
          tz.getLocation('America/Detroit'), '20200127T100000'),
      description: 'description',
      dtstart: tz.TZDateTime.parse(
          tz.getLocation('America/Detroit'), '20200127T100000'),
      location: 'Location',
      summary: 'Summary',
      uid: '5e41428d0e0d5',
    );
    test(
      'should return a valid model',
      () async {
        // arrange
        final jsonMap = <String, dynamic>{
          'DTEND': '20200127T100000',
          'UID': '5e41428d0e0d5',
          'DTSTAMP': '20200127T100000',
          'LOCATION': 'Location',
          'DESCRIPTION': 'description',
          'SUMMARY': 'Summary',
          'DTSTART': '20200127T100000',
        };
        // act
        final result =
            Event.fromMap(jsonMap, tz.getLocation('America/Detroit'));
        // assert
        expect(result, tEvent);
      },
    );
  });
}
