import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/icalendar_parser.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  CalendarPage({Key key, this.title}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
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
            future: _buildListEventCards(
                "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics"),
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

  Future<List<Widget>> _buildListEventCards(String url) async {
    String calendar = await getCalendar(url);
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
