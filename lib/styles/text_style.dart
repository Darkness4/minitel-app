import 'package:flutter/material.dart';

TextStyle styleLog() {
  return TextStyle(color: Colors.white);
}

TextStyle styleLogImportant() {
  return TextStyle(fontWeight: FontWeight.bold);
}

class LogWidget extends StatelessWidget {
  final String title;
  final String text;

  LogWidget(this.title, this.text);

  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(title, style: styleLogImportant()),
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(text, style: styleLog()),
            decoration: BoxDecoration(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
