import 'package:flutter/material.dart';

TextStyle styleLogImportant() {
  return TextStyle(fontWeight: FontWeight.bold);
}

TextStyle styleLog() {
  return TextStyle(color: Colors.white);
}

class LogWidget extends StatelessWidget {
  final String title;
  final String text;

  LogWidget(this.title, this.text);

  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[Text(title, style: styleLogImportant()),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(text, style: styleLog()),
                  decoration: BoxDecoration(color: Colors.black87),
                ),],)
    );
  }
}