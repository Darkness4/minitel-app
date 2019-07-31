import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  const CalendarPage({Key key, this.title}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  final initializationSettingsIOS = IOSInitializationSettings();
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'minitel_channel',
    'Minitel Channel',
    'Notification channel for the Minitel App',
    importance: Importance.Max,
    priority: Priority.High,
  );
  final iOSPlatformChannelSpecifics = IOSNotificationDetails();

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

  Future<List<Widget>> _listEventCards(ICalendar ical) async {
    // TODO: StreamBuilder, yield DTSTART(event) or NEW_DAY or NEW_MONTH, ListView.builder(day, header, event), PageView.builder(month)
    List<Widget> widgets = [];
    List<Widget> monthlyWidgets = [];
    List<Widget> dailyEvents = [];
    int i = 0;
    int day;
    int month;

    // Refresh the calendar if possible

    // Parse the calendar
    ical.parseCalendar();

    // Filter the calendar  // TODO: Maybe optimize by filtering at the capture
    var filteredEvents = ical.events
        .where(
            (event) => DateTime.parse(event["DTSTART"]).isAfter(DateTime.now()))
        .toList();
    filteredEvents.sort((event1, event2) => DateTime.parse(event1["DTSTART"])
        .compareTo(DateTime.parse(event2["DTSTART"])));

    // Throw away the old notifications
    await flutterLocalNotificationsPlugin.cancelAll();

    Future.forEach(filteredEvents, (event) async {
      DateTime dt = DateTime.parse(event["DTSTART"]);

      if (dt.isBefore(DateTime.now().add(const Duration(days: 14)))) {
        var dtstart = DateFormat.Hm().format(dt);
        var dtend = DateFormat.Hm().format(DateTime.parse(event["DTEND"]));

        i++;

        _scheduleNotification(
          id: i,
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

      if (dt.month != month) {
        month = dt.month;
        monthlyWidgets = [];

        // Page
        widgets.add(
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: MinitelColors.MonthColorPalette[month],
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: monthlyWidgets,
                ),
              ),
            ),
          ),
        );

        // Month Card
        monthlyWidgets.add(
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${DateFormat.MMMM("fr_FR").format(dt).toUpperCase()}",
                style: MinitelTextStyles.display2.apply(
                  color: Colors.white,
                  fontWeightDelta: 1,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          ),
        );
      }

      if (dt.day != day) {
        day = dt.day; // New Day
        dailyEvents = []; // Clear Events

        // Header Bullet + Event Cards
        monthlyWidgets.add(
          StickyHeaderBuilder(
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Material(
                  elevation: stuckAmount * 10,
                  color: Color.lerp(
                      Colors.transparent,
                      MinitelColors.MonthColorPalette[dt.month]
                          .withOpacity(0.9),
                      stuckAmount),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "${DateFormat.MMMMEEEEd("fr_FR").format(dt)}",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: dailyEvents,
            ),
          ),
        );
      }

      // Event Card
      dailyEvents.add(EventCard(event));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
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
                      child:
                          PageView(children: _listEventCards(snapshot.data)));
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
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
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
    flutterLocalNotificationsPlugin.schedule(
      id,
      title,
      description,
      scheduledNotificationDateTime,
      NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics),
      payload: payload,
    );
  }
}
