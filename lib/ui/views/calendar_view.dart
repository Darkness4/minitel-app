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

  Future<ICalendar> _loadCalendar(BuildContext context) async {
    CalendarUrlAPI _calendarURL = Provider.of<CalendarUrlAPI>(context);
    ICalendar ical = ICalendar(_calendarURL);

    var url = await _calendarURL.savedCalendarURL;
    if (url == "") throw Exception("The URL of the calendar was not found.");
    await ical.saveCalendar(url);

    // Read the actual calendar
    await ical.getCalendarFromFile();

    return ical;
  }

  Stream<Widget> _listEventCards(ICalendar ical) async* {
    List<Widget> monthlyWidgets;
    List<Widget> dailyEvents = [];
    DateTime oldDt;

    // Parse the calendar
    ical.parseCalendar();

    var filteredEvents = ical.events.where(
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

        _scheduleNotification(
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
        if (monthlyWidgets != null)
          yield MonthPage(oldDt.month, monthlyWidgets);
        oldDt = dt;

        monthlyWidgets = [
          MonthHeader("${_month[dt.month - 1]}"),
        ];
      }

      // New Day
      if (dt.day != oldDt?.day) {
        if (dailyEvents.isNotEmpty)
          monthlyWidgets.add(DayWidget(dt, dailyEvents));

        oldDt = dt;
        dailyEvents = []; // Clear Events
      }

      // Event Card
      dailyEvents.add(EventCard(event));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> monthPages = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: MinitelColors.PrimaryColor,
        child: Center(
          child: FutureBuilder(
            future: _loadCalendar(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return ErrorCalendarWidget(
                        snapshot.error.toString(), setState);
                  return Scrollbar(
                    child: StreamBuilder(
                      stream: _listEventCards(snapshot.data),
                      builder:
                          (BuildContext context, AsyncSnapshot snapshotStream) {
                        Widget child;
                        switch (snapshotStream.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            child = CircularProgressIndicator();
                            break;
                          case ConnectionState.active:
                            monthPages.add(snapshotStream.data);
                            break;
                          case ConnectionState.done:
                            child = PageView(
                              children: monthPages,
                            );
                            break;
                        }
                        return child;
                      },
                    ),
                  );
              }
              return ErrorCalendarWidget(snapshot.error.toString(), setState);
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

  Future<void> _onSelectNotification(
      String payload, BuildContext context) async {
    List<String> output = payload.split(';');
    showDialog(
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
      String payload: "Title;Description"}) async {
    _flutterLocalNotificationsPlugin.schedule(
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
