import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:auto_login_flutter/funcs/icalendar_parser.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  CalendarPage({Key key, this.title}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  var _uidController = TextEditingController();
  var _pswdController = TextEditingController();
  var _uidFocusNode = FocusNode();
  var _pswdFocusNode = FocusNode();

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

    Map<int, Color> colorPalette = {
      DateTime.january: Colors.red,
      DateTime.february: Colors.pink,
      DateTime.march: Colors.purple,
      DateTime.april: Colors.indigo,
      DateTime.may: Colors.blue,
      DateTime.june: Colors.cyan,
      DateTime.july: Colors.green,
      DateTime.august: Colors.lime,
      DateTime.september: Colors.yellow,
      DateTime.october: Colors.orange,
      DateTime.november: Colors.deepOrange,
      DateTime.december: Colors.brown,
    };

    List<Widget> widgets = [];
    List<Widget> monthlyWidgets = [];

    ical.events.sort((event1, event2) => DateTime.parse(event1["DTSTART"])
        .compareTo(DateTime.parse(event2["DTSTART"])));

    int day = DateTime.parse(ical.events.first["DTSTART"]).day;
    int month = DateTime.parse(ical.events.first["DTSTART"]).month;
    monthlyWidgets.add(Center(
      child: Header(
        "${DateFormat.MMMM().format(DateTime.parse(ical.events.first["DTSTART"])).toUpperCase()}",
        color: Colors.white,
      ),
    ));
    ical.events.forEach((event) {
      DateTime dt = DateTime.parse(event["DTSTART"]);
      if (dt.isAfter(DateTime.now())) {
        if (dt.month != month) {
          month = dt.month;
          // Finish
          widgets.add(SingleChildScrollView(
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
          ));
          monthlyWidgets = [];

          // New Month
          monthlyWidgets.add(Center(
            child: Header(
              "${DateFormat.MMMM().format(dt).toUpperCase()}",
              color: Colors.white,
            ),
          ));
        }
        if (dt.day != day) {
          day = dt.day;
          monthlyWidgets.add(Container(
              child: DayCard(
            "${dt.day}",
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          )));
        }
        monthlyWidgets.add(EventCard(event));
      }
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
                    : Text("Loading..."),
          ),
        ),
      ),
      drawer: MainDrawer(),
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
      Column(
        children: <Widget>[
          Card(
            elevation: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.toString(),
                  style: TextStyle(
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
              padding: EdgeInsets.all(8.0),
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
            padding: EdgeInsets.all(30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: RaisedButton(
                shape: ContinuousRectangleBorder(),
                color: Colors.greenAccent[400],
                elevation: 4,
                onPressed: () => saveCalendarFromLogin(
                      username: _uidController.text,
                      password: _pswdController.text,
                    ).then((out) => setState(() {})),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
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

class DayCard extends StatelessWidget {
  final String _day;
  final Color backgroundColor;
  final Color foregroundColor;

  DayCard(
    String day, {
    this.backgroundColor: Colors.blue,
    this.foregroundColor: Colors.white,
  }) : _day = day;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      color: backgroundColor,
      child: Center(
        child: Header(
          _day,
          color: foregroundColor,
          level: 3,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, String> _event;

  EventCard(Map<String, String> event) : _event = event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Header(
              _event["SUMMARY"],
              level: 4,
            ),
            Text("${_event["DESCRIPTION"]}"),
            Header(
              "➡️ ${_event["LOCATION"]}",
              level: 1,
              color: Colors.red,
            ),
            Header(
              "${DateFormat.Hm().format(DateTime.parse(_event["DTSTART"]))}"
              " - "
              "${DateFormat.Hm().format(DateTime.parse(_event["DTEND"]))}",
              level: 2,
            ),
          ],
        ),
      ),
    );
  }
}
