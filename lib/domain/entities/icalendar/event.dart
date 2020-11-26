import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:timezone/timezone.dart';

part 'event.freezed.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    @required @nullable TZDateTime dtend,
    @required @nullable String uid,
    @required @nullable TZDateTime dtstamp,
    @required @nullable String location,
    @required @nullable String description,
    @required @nullable String summary,
    @required @nullable TZDateTime dtstart,
  }) = _Event;

  factory Event.fromMap(Map<String, dynamic> json, Location location) {
    return Event(
      dtend: TZDateTime.parse(location, json['DTEND'] as String),
      uid: json['UID'] as String,
      dtstamp: TZDateTime.parse(location, json['DTSTAMP'] as String),
      location: json['LOCATION'] as String,
      description: json['DESCRIPTION'] as String,
      summary: json['SUMMARY'] as String,
      dtstart: TZDateTime.parse(location, json['DTSTART'] as String),
    );
  }
}

extension EventUtils on Event {
  Future<void> addToNotification({
    @required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    @required NotificationSettings notificationSettings,
    @required NotificationDetails notificationDetails,
  }) async {
    final dt = dtstart;
    final now = DateTime.now();

    // Notification System
    if (dt.isBefore(now.add(notificationSettings.range))) {
      final dtstart = DateFormat.Hm().format(dt);
      final dtend = DateFormat.Hm().format(this.dtend);

      final id = int.parse(uid, radix: 16) % 2147483647;
      final body = '$location\n'
          '$dtstart'
          ' - '
          '$dtend';
      final scheduleDate = dt.subtract(notificationSettings.early);

      await flutterLocalNotificationsPlugin.zonedSchedule(
          id, summary, body, scheduleDate, notificationDetails,
          payload: '$summary;'
              '$description\n'
              '$location\n'
              '$dtstart'
              ' - '
              '$dtend',
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    }
  }
}
