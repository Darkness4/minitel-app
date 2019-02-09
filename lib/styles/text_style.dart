import 'package:flutter/material.dart';

TextStyle styleLog = TextStyle(color: Colors.white,
    fontFamily: 'RobotoMono',
    fontSize: 9,
    fontWeight: FontWeight.w500);

TextStyle styleLogImportant =
TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

TextStyle header1 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 32,
);
TextStyle header2 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 24,
);
TextStyle header3 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20,
);
TextStyle header4 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 16,
);
TextStyle header5 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
);
TextStyle header6 = TextStyle(
  color: const Color(0xff6a737d),
  fontWeight: FontWeight.w600,
  fontSize: 12,
);

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

  Header(this.text, {this.level: 1});

  @override
  Widget build(context) {
    switch (level) {
      case 1:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header1,
            ));
        break;
      case 2:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header2,
            ));
        break;
      case 3:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header3,
            ));
      case 4:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header4,
            ));
        break;
      case 5:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header5,
            ));
        break;
      case 6:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header6,
            ));
        break;
      default:
        return Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              text,
              style: header1,
            ));
        break;
    }
  }
}


