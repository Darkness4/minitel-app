import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/models/notifications.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/ui/widgets/agenda_widgets.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:provider/provider.dart';

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
  }) : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  Stream<Widget> listEventCards(ICalendar ical) async* {
    List<Widget> monthlyWidgets;
    List<Widget> dailyEvents = [];
    DateTime oldDt;

    // Parse the calendar
    ParsedCalendar parsedCalendar = await ical.parseCalendar();

    var filteredEvents = parsedCalendar.events.where(
        (event) => DateTime.parse(event["DTSTART"]).isAfter(DateTime.now()));

    // Throw away the old notifications
    await _flutterLocalNotificationsPlugin.cancelAll();

    if (filteredEvents == null || filteredEvents.isEmpty) {
      yield Center(
        child: Text(
          Texts.agendaVide[Random().nextInt(Texts.agendaVide.length)],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      for (var event in filteredEvents) {
        int id = 0;
        DateTime dt = DateTime.parse(event["DTSTART"]);

        // Notification System
        if (dt.isBefore(DateTime.now().add(notificationSettings.range))) {
          var dtstart = DateFormat.Hm().format(dt);
          var dtend = DateFormat.Hm().format(DateTime.parse(event["DTEND"]));

          id++;

          await _scheduleNotification(
            id: id,
            title: event["SUMMARY"],
            description: "${event["LOCATION"]}\n"
                "$dtstart"
                " - "
                "$dtend",
            scheduledNotificationDateTime:
                dt.subtract(notificationSettings.early),
            payload: "${event["SUMMARY"]};"
                "${event["DESCRIPTION"]}\n"
                "${event["LOCATION"]}\n"
                "$dtstart"
                " - "
                "$dtend",
          );
        }

        // New Month
        if (dt.month != oldDt?.month) {
          if (monthlyWidgets != null) {
            yield MonthPage(oldDt.month, monthlyWidgets);
          }
          oldDt = dt;

          monthlyWidgets = [
            MonthHeader("${_month[dt.month - 1]}"),
          ];
        }

        // New Day
        if (dt.day != oldDt?.day) {
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(dt, dailyEvents));
          }

          oldDt = dt;
          dailyEvents = []; // Clear Events
        }

        // Event Card
        dailyEvents.add(EventCard(event));
      }
    }
  }

  Future<ICalendar> loadCalendar(BuildContext context) async {
    CalendarUrlAPI _calendarUrlAPI = Provider.of<CalendarUrlAPI>(context);
    ICalendar ical = ICalendar(_calendarUrlAPI);

    // Try to update thr calendar
    var url = await _calendarUrlAPI.savedCalendarURL;

    // Try to update calendar
    if (url == "" || url == null) {
      print("Cannot update calendar. Taking from cache.");
    } else {
      await ical.saveCalendar(url);
    }

    // Read the actual calendar (throw if not existing)
    await ical.getCalendarFromFile();

    return ical;
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
