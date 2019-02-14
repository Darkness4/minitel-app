import 'package:flutter/material.dart';

TextStyle styleLog = TextStyle(
    color: Colors.white,
    fontFamily: 'RobotoMono',
    fontSize: 9,
    fontWeight: FontWeight.w500);

TextStyle styleLogImportant =
TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

class Paragraph extends StatelessWidget {
  final Key key;
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;

  Paragraph(this.text,
      {this.key,
        this.style,
        this.textAlign: TextAlign.justify,
        this.textDirection: TextDirection.ltr,
        this.locale,
        this.softWrap: true,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel});

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: style,
        key: key,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String text;
  final int level;
  final Color color;

  Header(this.text, {this.level: 1, this.color: Colors.black});

  @override
  Widget build(context) {
    switch (level) {
      defaultCase:
      case 1:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ));
        break;
      case 2:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ));
        break;
      case 3:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ));
      case 4:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ));
        break;
      case 5:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ));
        break;
      case 6:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ));
        break;
      default:
        continue defaultCase;
    }
  }
}
