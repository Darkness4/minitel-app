import 'package:flutter/material.dart';

/// Color palette of the app
class MinitelColors {
  static const MaterialColor primaryColor = Colors.green;
  static const MaterialAccentColor accentColor = Colors.greenAccent;

  static const Color terminalHeaderColor = Colors.lightBlue;
  static const Color terminalBgColor = Colors.black87;
  static const Color terminalFgColor = Colors.white;

  static const Color reportPrimaryColor = Colors.red;

  static Color drawerSelectedColor = Colors.green.withOpacity(0.2);
  static Color drawerSelectedColorGrey = Colors.grey.withOpacity(0.5);

  /// Attribuated color to each month
  static Map<int, Color> MonthColorPalette = <int, Color>{
    DateTime.january: Colors.red,
    DateTime.february: Colors.pink,
    DateTime.march: Colors.purple,
    DateTime.april: Colors.indigo,
    DateTime.may: Colors.blue,
    DateTime.june: Colors.lightBlue[900],
    DateTime.july: Colors.green,
    DateTime.august: Colors.lime[900],
    DateTime.september: Colors.lightGreen,
    DateTime.october: Colors.orange[900],
    DateTime.november: Colors.deepOrange[900],
    DateTime.december: Colors.brown,
  };
}
