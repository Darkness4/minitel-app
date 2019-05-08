import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:auto_login_flutter/funcs/icalendar_parser.dart';
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
  final _formKey = GlobalKey<FormState>();
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
      return _errorHandlerWidget(e);
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

    for (var i = 0; i < filteredEvents.length; i++) {
      if (DateTime.parse(filteredEvents[i]["DTSTART"]).isBefore(DateTime.now()
          .add(const Duration(days: 15)))) // Notifications only work for x days
        _scheduleNotification(
          id: i,
          title: filteredEvents[i]["SUMMARY"],
          description: "${filteredEvents[i]["LOCATION"]}\n"
              "${DateFormat.Hm().format(DateTime.parse(filteredEvents[i]["DTSTART"]))}"
              " - "
              "${DateFormat.Hm().format(DateTime.parse(filteredEvents[i]["DTEND"]))}",
          scheduledNotificationDateTime:
              DateTime.parse(filteredEvents[i]["DTSTART"])
                  .subtract(const Duration(minutes: 10)),
          payload: "${filteredEvents[i]["SUMMARY"]};"
              "${filteredEvents[i]["DESCRIPTION"]}\n"
              "${filteredEvents[i]["LOCATION"]}\n"
              "${DateFormat.Hm().format(DateTime.parse(filteredEvents[i]["DTSTART"]))}"
              " - "
              "${DateFormat.Hm().format(DateTime.parse(filteredEvents[i]["DTEND"]))}",
        );
    }

    int day;
    int month;

    Future.forEach(filteredEvents, (event) async {
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${DateFormat.MMMM("fr_FR").format(dt).toUpperCase()}",
                style: Theme.of(context).textTheme.display2.apply(
                      color: Colors.white,
                      fontWeightDelta: 1,
                      fontFamily: "Roboto",
                    ),
              ),
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: stuckAmount * 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(stuckAmount * 100)),
                color: Color.lerp(
                    Colors.transparent, colorPalette[dt.month], stuckAmount),
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
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      focusNode: _uidFocusNode,
                      controller: _uidController,
                      decoration: InputDecoration(
                        hintText: "prénom.nom",
                        labelText: "Nom d'utilisateur",
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
                        hintText: "Mot de passe",
                        labelText: "Mot de passe",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              color: Colors.red,
              elevation: 10.0,
              onPressed: () => saveCalendarFromLogin(
                    username: _uidController.text,
                    password: _pswdController.text,
                  ).then((out) => setState(() {})),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: const Text(
                  "Se connecter",
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

  // Future<void> _showNotification(
  //     {String title: "Title",
  //     String description: "Description",
  //     String payload: "Title;Description"}) async {
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     title,
  //     description,
  //     NotificationDetails(
  //         androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics),
  //     payload: payload,
  //   );
  // }
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
