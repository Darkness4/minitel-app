import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/texts_constants.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/models/notifications.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/icalendar.dart';
import 'package:minitel_toolbox/ui/widgets/agenda_widgets.dart';

class AgendaViewModel extends ChangeNotifier {
  static const _month = <String>[
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Août",
    "Septembre",
    "Octobre",
    "Novembre",
    "Décembre",
  ];
  final CalendarUrlAPI calendarUrlAPI;
  final ICalendar iCalendar;
  final _androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'minitel_channel',
    'Minitel Channel',
    'Notification channel for the Minitel App',
    importance: Importance.Max,
    priority: Priority.High,
    enableVibration: true,
  );
  final _iOSPlatformChannelSpecifics = IOSNotificationDetails();
  final notificationSettings = NotificationSettings();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  List<Widget> monthPages = [];

  AgendaViewModel({
    @required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    @required this.iCalendar,
    @required this.calendarUrlAPI,
  }) : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  Stream<List<Widget>> listEventCards(ParsedCalendar parsedCalendar) async* {
    List<Widget> monthlyWidgets;
    List<Widget> dailyEvents = [];
    monthPages = [];
    DateTime oldDt;

    parsedCalendar.events
        .sort((event1, event2) => (event1.dtstart.compareTo(event2.dtstart)));

    var filteredEvents = parsedCalendar.events
        .where((event) => event.dtstart.isAfter(DateTime.now()));

    // Throw away the old notifications
    await _flutterLocalNotificationsPlugin.cancelAll();

    if (filteredEvents == null || filteredEvents.isEmpty) {
      yield <Widget>[
        Center(
          child: Text(
            Texts.agendaVide[Random().nextInt(Texts.agendaVide.length)],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ];
    } else {
      DateTime dt;
      for (var event in filteredEvents) {
        int id = 0;
        dt = event.dtstart;

        // Notification System
        if (dt.isBefore(DateTime.now().add(notificationSettings.range))) {
          var dtstart = DateFormat.Hm().format(dt);
          var dtend = DateFormat.Hm().format(event.dtend);

          id++;

          await _scheduleNotification(
            id: id,
            title: event.summary,
            description: "${event.location}\n"
                "$dtstart"
                " - "
                "$dtend",
            scheduledNotificationDateTime:
                dt.subtract(notificationSettings.early),
            payload: "${event.summary};"
                "${event.description}\n"
                "${event.location}\n"
                "$dtstart"
                " - "
                "$dtend",
          );
        }

        // New Month
        if (dt.month != oldDt?.month) {
          // Return the last month
          if (dailyEvents.isNotEmpty && monthlyWidgets != null) {
            monthlyWidgets.add(DayWidget(dt, dailyEvents));
            monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
            yield monthPages;
          }
          oldDt = dt;

          monthlyWidgets = [
            MonthHeader("${_month[dt.month - 1]}"),
          ];
          dailyEvents = [];
        }

        // New Day
        if (dt.day != oldDt?.day) {
          // Return the last day
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(dt, dailyEvents));
          }

          oldDt = dt;
          dailyEvents = []; // Clear Events
        }

        // Event Card
        dailyEvents.add(EventCard(event));
      }

      // Return the last day
      if (dailyEvents.isNotEmpty && monthlyWidgets != null) {
        monthlyWidgets.add(DayWidget(dt, dailyEvents));
        monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
        yield monthPages;
      }
    }
  }

  Future<ParsedCalendar> loadCalendar(BuildContext context) async {
    // Try to update thr calendar
    var url = await calendarUrlAPI.savedCalendarURL;

    // Try to update calendar
    if (url == "" || url == null) {
      print("Cannot update calendar. Taking from cache.");
    } else {
      print("Updating calendar.");
      await iCalendar.saveCalendar(url, calendarUrlAPI);
    }

    // Read the actual calendar (throw if not existing)
    return iCalendar.getParsedCalendarFromFile();
  }

  Future<void> _scheduleNotification(
      {@required String title,
      @required String description,
      @required int id,
      @required DateTime scheduledNotificationDateTime,
      String payload = "Title;Description"}) async {
    await _flutterLocalNotificationsPlugin.schedule(
      id,
      title,
      description,
      scheduledNotificationDateTime,
      NotificationDetails(
          _androidPlatformChannelSpecifics, _iOSPlatformChannelSpecifics),
      payload: payload,
    );
  }
}
