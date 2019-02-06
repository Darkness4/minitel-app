import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';

class SuperCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final double extPadding;
  final double intPadding;

  SuperCard({@required this.children,
    this.elevation: 3.0,
    this.extPadding: 10.0,
    this.intPadding: 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(extPadding),
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(4),
        type: MaterialType.card,
        child: Container(
          padding: EdgeInsets.all(intPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ),
      ),
    );
  }
}

class LogCard extends StatelessWidget {
  final String title;
  final String text;

  LogCard(this.text, {this.title});

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        elevation: 3.0,
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(title, style: styleLogImportant),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(text, style: styleLog),
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
