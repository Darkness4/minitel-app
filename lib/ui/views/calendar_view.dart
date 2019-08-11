import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/calendar_widgets.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';

class CalendarView extends StatefulWidget {
  final String title;

  const CalendarView({Key key, this.title}) : super(key: key);

  @override
  CalendarViewState createState() => CalendarViewState();
}

class CalendarViewState extends State<CalendarView> {
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
  final _formKey = GlobalKey<FormState>();
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  final _initializationSettingsIOS = IOSInitializationSettings();
  final _androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'minitel_channel',
    'Minitel Channel',
    'Notification channel for the Minitel App',
    importance: Importance.Max,
    priority: Priority.High,
  );
  final _iOSPlatformChannelSpecifics = IOSNotificationDetails();

  @override
  Widget build(BuildContext context) {
    List<Widget> monthPages = [];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: MinitelColors.PrimaryColor,
        child: Center(
          child: FutureBuilder<ICalendar>(
            future: _loadCalendar(context),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return ErrorCalendarWidget(
                    snapshot.error.toString(), setState, _formKey);
              }
              if (snapshot.hasData) {
                return Scrollbar(
                  child: StreamBuilder<Widget>(
                    stream: _listEventCards(snapshot.data),
                    builder: (BuildContext context, snapshotStream) {
                      switch (snapshotStream.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        case ConnectionState.active:
                          monthPages.add(snapshotStream.data);
                          return PageView(children: monthPages);
                        case ConnectionState.done:
                          return PageView(children: monthPages);
                      }
                      return null;
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }

  @override
  void initState() {
    super.initState();
    var initializationSettings = InitializationSettings(
        _initializationSettingsAndroid, _initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) =>
            _onSelectNotification(payload, context));
  }

  Stream<Widget> _listEventCards(ICalendar ical) async* {
    List<Widget> monthlyWidgets;
    List<Widget> dailyEvents = [];
    DateTime oldDt;

    // Parse the calendar
    ParsedCalendar parsedCalendar = await ical.parseCalendar();

    var filteredEvents = parsedCalendar.events.where(
        (event) => DateTime.parse(event["DTSTART"]).isAfter(DateTime.now()));

    // Throw away the old notifications
    await _flutterLocalNotificationsPlugin.cancelAll();

    for (var event in filteredEvents) {
      int id = 0;
      DateTime dt = DateTime.parse(event["DTSTART"]);

      // Notification System
      if (dt.isBefore(DateTime.now().add(const Duration(days: 14)))) {
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
              dt.subtract(const Duration(minutes: 10)),
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

  Future<ICalendar> _loadCalendar(BuildContext context) async {
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

  Future<void> _onSelectNotification(
      String payload, BuildContext context) async {
    List<String> output = payload.split(';');
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("${output[0]}"),
        content: Text("${output.length < 2 ? "null" : output[1]}"),
      ),
    );
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
