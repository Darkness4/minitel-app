import 'package:auto_login_flutter/components/drawer.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  CalendarPage({Key key, this.title}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
