import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/models/icalendar/event.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/models/notifications.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:minitel_toolbox/ui/widgets/agenda_widgets/agenda_widgets.dart';

class AgendaViewModel extends ChangeNotifier {
  static const List<String> _month = <String>[
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
  final ICalendarAPI iCalendar;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // Notification related
  final NotificationSettings _notificationSettings = NotificationSettings();

  AgendaViewModel({
    @required this.flutterLocalNotificationsPlugin,
    @required this.iCalendar,
    @required this.calendarUrlAPI,
  });

  NotificationSettings get notificationSettings => _notificationSettings;

  /// Generate a stream of Page. Each page (= month) with events.
  ///
  /// The [parsedCalendar.events] are sorted first. Then each new event fill
  /// a day ([dailyEvents]). If the new event is a new day, the old
  /// [dailyEvents] is added to the [monthlyWidgets]. If the new event is a new
  /// month, the old [monthlyWidgets] is added to the [monthPages], and this
  /// new page is immediatly streamed to assure a reactive behavior.
  ///
  /// At the very end, the last widgets are returned.
  Stream<List<Widget>> listEventCards(
      BuildContext context, ParsedCalendar parsedCalendar) async* {
    List<Widget> monthlyWidgets = <Widget>[];
    List<Widget> dailyEvents = <Widget>[];
    final List<Widget> monthPages = <Widget>[];
    DateTime oldDt;

    parsedCalendar.events.sort((Event event1, Event event2) =>
        event1.dtstart.compareTo(event2.dtstart));

    final Iterable<Event> filteredEvents = parsedCalendar.events
        .where((Event event) => event.dtstart.isAfter(DateTime.now()));

    // Throw away the old notifications
    await flutterLocalNotificationsPlugin.cancelAll();

    if (filteredEvents == null || filteredEvents.isEmpty) {
      yield <Widget>[
        Center(
          child: Text(
            AppLoc.of(context).agenda.cases[
                Random().nextInt(AppLoc.of(context).agenda.cases.length)],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ];
    } else {
      DateTime dt;
      int id = 0;
      for (final Event event in filteredEvents) {
        dt = event.dtstart;

        // Notification System
        if (notificationSettings.enabled &&
            dt.isBefore(DateTime.now().add(_notificationSettings.range))) {
          final String dtstart = DateFormat.Hm().format(dt);
          final String dtend = DateFormat.Hm().format(event.dtend);

          id++;

          await _scheduleNotification(
            id: id,
            title: event.summary,
            description: "${event.location}\n"
                "$dtstart"
                " - "
                "$dtend",
            scheduledNotificationDateTime:
                dt.subtract(_notificationSettings.early),
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
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(oldDt, dailyEvents));
          }
          // Return the last month
          if (monthlyWidgets.isNotEmpty) {
            monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
            yield monthPages;
          }
          oldDt = dt;

          monthlyWidgets = <Widget>[];
          monthlyWidgets.add(MonthHeader("${_month[dt.month - 1]}"));
          dailyEvents = <Widget>[];
        }

        // New Day
        if (dt.day != oldDt?.day) {
          // Return the last day
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(oldDt, dailyEvents));
          }

          oldDt = dt;
          dailyEvents = <Widget>[]; // Clear Events
        }

        // Event Card
        dailyEvents.add(EventCard(event));
      }

      // Return the last day
      if (dailyEvents.isNotEmpty && monthlyWidgets.isNotEmpty) {
        monthlyWidgets.add(DayWidget(oldDt, dailyEvents));
        monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
        yield monthPages;
      }

      print("Scheduled $id notifications");
    }
  }

  /// Save/update a calendar and parse it.
  Future<ParsedCalendar> loadCalendar(BuildContext context) async {
    // Try to update thr calendar
    final String url = await calendarUrlAPI.savedCalendarURL;

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

  /// Initialize the notification system
  Future<void> onModelReady(BuildContext context) async {
    const AndroidInitializationSettings _initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    const IOSInitializationSettings _initializationSettingsIOS =
        IOSInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            _initializationSettingsAndroid, _initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) =>
            _onSelectNotification(payload, context));
  }

  void refresh() {
    notifyListeners();
  }

  /// Action when a notification is triggered and selected
  Future<void> _onSelectNotification(
      String payload, BuildContext context) async {
    final List<String> output = payload.split(';');
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("${output[0]}"),
        content: Text("${output.length < 2 ? "null" : output[1]}"),
      ),
    );
  }

  /// Schedule a notification
  Future<void> _scheduleNotification(
      {@required String title,
      @required String description,
      @required int id,
      @required DateTime scheduledNotificationDateTime,
      String payload = "Title;Description"}) async {
    final AndroidNotificationDetails _androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'minitel_channel',
      'Minitel Channel',
      'Notification channel for the Minitel App',
      importance: Importance.Max,
      priority: Priority.High,
      enableVibration: true,
    );
    final IOSNotificationDetails _iOSPlatformChannelSpecifics =
        IOSNotificationDetails();
    await flutterLocalNotificationsPlugin.schedule(
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
