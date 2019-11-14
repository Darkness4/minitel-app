import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';

class Event extends Equatable {
  final DateTime dtend;
  final String uid;
  final DateTime dtstamp;
  final String location;
  final String description;
  final String summary;
  final DateTime dtstart;

  const Event({
    this.dtend,
    this.uid,
    this.dtstamp,
    this.location,
    this.description,
    this.summary,
    this.dtstart,
  });

  @override
  List<Object> get props => [
        this.dtend,
        this.uid,
        this.dtstamp,
        this.location,
        this.description,
        this.summary,
        this.dtstart,
      ];
}

extension EventUtils on Event {
  Future<void> addToNotification({
    @required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    @required NotificationSettings notificationSettings,
    @required NotificationDetails notificationDetails,
  }) async {
    final DateTime dt = this.dtstart;
    final DateTime now = DateTime.now();

    // Notification System
    if (notificationSettings.enabled &&
        dt.isBefore(now.add(notificationSettings.range))) {
      final String dtstart = DateFormat.Hm().format(dt);
      final String dtend = DateFormat.Hm().format(this.dtend);

      final id = int.parse(this.uid, radix: 16) % 2147483647;
      final body = "${this.location}\n"
          "$dtstart"
          " - "
          "$dtend";
      final DateTime scheduleDate = dt.subtract(notificationSettings.early);

      await flutterLocalNotificationsPlugin.schedule(
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
  }
}
