import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';

part 'event.freezed.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    @required @nullable DateTime dtend,
    @required @nullable String uid,
    @required @nullable DateTime dtstamp,
    @required @nullable String location,
    @required @nullable String description,
    @required @nullable String summary,
    @required @nullable DateTime dtstart,
  }) = _Event;

  static Event fromMap(Map<String, dynamic> json) {
    return Event(
      dtend: DateTime.parse(json["DTEND"] as String),
      uid: json["UID"] as String,
      dtstamp: DateTime.parse(json["DTSTAMP"] as String),
      location: json["LOCATION"] as String,
      description: json["DESCRIPTION"] as String,
      summary: json["SUMMARY"] as String,
      dtstart: DateTime.parse(json["DTSTART"] as String),
    );
  }
}

extension EventUtils on Event {
  Future<void> addToNotification({
    @required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    @required NotificationSettings notificationSettings,
    @required NotificationDetails notificationDetails,
  }) {
    final DateTime dt = this.dtstart;
    final DateTime now = DateTime.now();

    // Notification System
    if (dt.isBefore(now.add(notificationSettings.range))) {
      final String dtstart = DateFormat.Hm().format(dt);
      final String dtend = DateFormat.Hm().format(this.dtend);

      final id = int.parse(this.uid, radix: 16) % 2147483647;
      final body = "${this.location}\n"
          "$dtstart"
          " - "
          "$dtend";
      final DateTime scheduleDate = dt.subtract(notificationSettings.early);

      return flutterLocalNotificationsPlugin.schedule(
        id,
        this.summary,
        body,
        scheduleDate,
        notificationDetails,
        payload: "${this.summary};"
            "${this.description}\n"
            "${this.location}\n"
            "$dtstart"
            " - "
            "$dtend",
      );
    }
    return Future.value(null);
  }
}
