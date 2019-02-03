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
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 1,
            ),
          ]),
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
            decoration: BoxDecoration(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
