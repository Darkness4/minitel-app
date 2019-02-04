import 'package:flutter/material.dart';

TextStyle styleLog() {
  return TextStyle(color: Colors.white);
}

TextStyle styleLogImportant() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
}

class LogWidget extends StatelessWidget {
  final String title;
  final String text;

  LogWidget(this.title, this.text);

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        elevation: 5.0,
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(title, style: styleLogImportant()),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(text, style: styleLog()),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
