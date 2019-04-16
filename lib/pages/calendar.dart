import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:auto_login_flutter/funcs/icalendar_parser.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';
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

    ical.events.sort((event1, event2) => DateTime.parse(event1["DTSTART"])
        .compareTo(DateTime.parse(event2["DTSTART"])));

    int day;
    int month;
    ical.events.forEach(
      (event) {
        DateTime dt = DateTime.parse(event["DTSTART"]);
        if (dt.isAfter(DateTime.now())) {
          if (month == null) {
            month = dt.month;
            monthlyWidgets.add(
              Center(
                child: Header(
                  "${DateFormat.MMMM().format(dt).toUpperCase()}",
                  color: Colors.white,
                ),
              ),
            );
          }
          if (day == null) day = dt.day;
          if (dt.month != month) {
            month = dt.month;
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
            monthlyWidgets = [];

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
            monthlyWidgets.add(StickyHeaderBuilder(
              builder: (BuildContext context, double stuckAmount) {
                stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                return Material(
                  elevation: stuckAmount * 2,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular((1 - stuckAmount) * 30)),
                  color: Color.lerp(
                      Colors.transparent, Colors.transparent, stuckAmount),
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
            dailyEvents = [];
          }

          // New Event
          dailyEvents.add(EventCard(event));
        }
      },
    );

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
                color: Colors.greenAccent[400],
                elevation: 4,
                onPressed: () => saveCalendarFromLogin(
                      username: _uidController.text,
                      password: _pswdController.text,
                    ).then((out) => setState(() {})),
                child: Text(
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
              "${_event["DESCRIPTION"]}",
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
