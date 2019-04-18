import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:auto_login_flutter/funcs/icalendar_parser.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  const CalendarPage({Key key, this.title}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  final _uidController = TextEditingController();
  final _pswdController = TextEditingController();
  final _uidFocusNode = FocusNode();
  final _pswdFocusNode = FocusNode();
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

  Future<List<Widget>> get _listEventCards async {
    String calendar = "";

    // Refresh the calendar if possible
    try {
      var url = await getSavedCalendarURL();
      await saveCalendarFromUrl(url);
    } catch (e) {
      print(e.toString());
    }

    // Read the actual calendar
    try {
      calendar = await readCalendar();
    } catch (e) {
      return _errorHandlerWidget(e);
    }

    ICalendar ical = await parseCalendar(calendar);

    const Map<int, Color> colorPalette = {
      DateTime.january: Colors.red,
      DateTime.february: Colors.pink,
      DateTime.march: Colors.purple,
      DateTime.april: Colors.indigo,
      DateTime.may: Colors.blue,
      DateTime.june: Colors.lightBlue,
      DateTime.july: Colors.green,
      DateTime.august: Colors.lime,
      DateTime.september: Colors.yellow,
      DateTime.october: Colors.orange,
      DateTime.november: Colors.deepOrange,
      DateTime.december: Colors.brown,
    };

    List<Widget> widgets = [];
    List<Widget> monthlyWidgets = [];
    List<Widget> dailyEvents = [];

    var filteredEvents = ical.events
        .where(
            (event) => DateTime.parse(event["DTSTART"]).isAfter(DateTime.now()))
        .toList();
    filteredEvents.sort((event1, event2) => DateTime.parse(event1["DTSTART"])
        .compareTo(DateTime.parse(event2["DTSTART"])));

    Future.forEach(
      filteredEvents,
      (event) async {
        _scheduleNotification(
          id: DateTime.parse(event["DTSTART"]).hashCode,
          title: event["SUMMARY"],
          description: "${event["LOCATION"]}\n"
              "${DateFormat.Hm().format(DateTime.parse(event["DTSTART"]))}"
              " - "
              "${DateFormat.Hm().format(DateTime.parse(event["DTEND"]))}",
          scheduledNotificationDateTime: DateTime.parse(event["DTSTART"])
              .subtract(const Duration(minutes: 10)),
          payload: "${event["DESCRIPTION"]};"
              "${event["LOCATION"]}\n"
              "${DateFormat.Hm().format(DateTime.parse(event["DTSTART"]))}"
              " - "
              "${DateFormat.Hm().format(DateTime.parse(event["DTEND"]))}",
        );
      },
    );

    int day;
    int month;

    Future.forEach(filteredEvents, (event) {
      DateTime dt = DateTime.parse(event["DTSTART"]);

      if (dt.month != month) {
        month = dt.month;
        monthlyWidgets = [];

        // Finish
        widgets.add(
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: colorPalette[month],
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: monthlyWidgets,
                ),
              ),
            ),
          ),
        );

        // New Month
        monthlyWidgets.add(
          Center(
            child: Header(
              "${DateFormat.MMMM().format(dt).toUpperCase()}",
              color: Colors.white,
            ),
          ),
        );
      }

      // New Day
      if (dt.day != day) {
        day = dt.day;
        dailyEvents = [];
        monthlyWidgets.add(StickyHeaderBuilder(
          builder: (BuildContext context, double stuckAmount) {
            stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
            return Material(
              elevation: stuckAmount * 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((1 - stuckAmount) * 100)),
              color: Color.lerp(
                  Colors.transparent, colorPalette[dt.month], stuckAmount),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Header(
                    "${DateFormat.MMMMEEEEd().format(dt)}",
                    color: Colors.white,
                    level: 3,
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
        ));
      }

      // New Event
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
        color: Colors.blueAccent,
        child: Center(
          child: FutureBuilder(
            future: _listEventCards,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.hasData
                    ? Scrollbar(child: PageView(children: snapshot.data))
                    : const Text("Loading..."),
          ),
        ),
      ),
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNotification(
              title: "Test",
              description:
                  "TestTestTestTestTestTestTestTest\nTestTestTestTestTestTestTestTest\nTestTestTestTestTestTestTestTest\n",
              payload:
                  "TestTestTestTestTestTestTestTest;TestTestTestTestTestTestTestTest\nTestTestTestTestTestTestTestTest\nTestTestTestTestTestTestTestTest\n",
            ),
      ),
    );
  }

  @override
  void dispose() {
    _uidController.dispose();
    _pswdController.dispose();
    _uidFocusNode.dispose();
    _pswdFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) =>
            onSelectNotification(payload, context));
  }

  Future<void> onSelectNotification(
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

  List<Widget> _errorHandlerWidget(dynamic e) {
    return <Widget>[
      ListView(
        children: <Widget>[
          Card(
            elevation: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      focusNode: _uidFocusNode,
                      controller: _uidController,
                      decoration: InputDecoration(
                        hintText: AppLoc.of(context).wordSurnameName,
                        labelText: AppLoc.of(context).wordUsername,
                      ),
                      onEditingComplete: () {
                        _uidFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(_pswdFocusNode);
                      },
                    ),
                    TextFormField(
                      controller: _pswdController,
                      obscureText: true,
                      focusNode: _pswdFocusNode,
                      decoration: InputDecoration(
                          hintText: AppLoc.of(context).wordPassword,
                          labelText: AppLoc.of(context).wordPassword),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: RaisedButton(
                shape: const ContinuousRectangleBorder(),
                color: Colors.red,
                elevation: 4,
                onPressed: () => saveCalendarFromLogin(
                      username: _uidController.text,
                      password: _pswdController.text,
                    ).then((out) => setState(() {})),
                child: const Text(
                  "LOGIN",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ];
  }

  Future<void> _showNotification(
      {String title: "Title",
      String description: "Description",
      String payload: "Title;Description"}) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      description,
      NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics),
      payload: payload,
    );
  }

  Future<void> _scheduleNotification(
      {@required String title,
      @required String description,
      @required int id,
      @required DateTime scheduledNotificationDateTime,
      String payload: "Title;Description"}) async {
    // print(
    //     "Event scheduled at ${DateFormat.yMMMMd().format(scheduledNotificationDateTime)} ${DateFormat.Hms().format(scheduledNotificationDateTime)}");
    // pendingNotificationRequests.forEach((out) => flutterLocalNotificationsPlugin.cancel(out.id));

    await flutterLocalNotificationsPlugin.cancelAll();
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

class EventCard extends StatelessWidget {
  final Map<String, String> _event;

  const EventCard(Map<String, String> event, {Key key})
      : _event = event,
        super(key: key);

  Color get _cardColor {
    var upper = _event["SUMMARY"].toLowerCase();
    if (upper.contains("examen"))
      return Colors.red[200];
    else if (upper.contains("tp"))
      return Colors.orange[200];
    else if (upper.contains("td"))
      return Colors.green[200];
    else if (upper.contains("tutorat"))
      return Colors.blue[200];
    else if (upper.contains("sport") ||
        upper.contains("vacance") ||
        upper.contains("férié"))
      return Colors.transparent;
    else
      return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _cardColor,
      elevation: (_event["SUMMARY"].toLowerCase().contains("sport") ||
              _event["SUMMARY"].toLowerCase().contains("vacance") ||
              _event["SUMMARY"].toLowerCase().contains("férié"))
          ? 0
          : 4,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            Text(
              _event["SUMMARY"],
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              _event["DESCRIPTION"],
              style: const TextStyle(height: 1.4),
              textAlign: TextAlign.center,
            ),
            Text(
              "${_event["LOCATION"] != "" ? '➡' : ''} ${_event["LOCATION"]} ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "${DateFormat.Hm().format(DateTime.parse(_event["DTSTART"]))}"
              " - "
              "${DateFormat.Hm().format(DateTime.parse(_event["DTEND"]))}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
