import 'package:flutter/material.dart';

/// Color palette of the app
class MinitelColors {
  static const Color PrimaryColor = Colors.green;
  static const Color FontColor = Colors.black87;

  static const Color TerminalHeaderColor = Colors.lightBlue;
  static const Color TerminalBgColor = Colors.black87;
  static const Color TerminalFgColor = Colors.white;

  static const Color ReportPrimaryColor = Colors.red;

  static Color DrawerSelectedColor = Colors.green[100];

  /// Attribuated color to each month
  static const Map<int, Color> MonthColorPalette = {
    DateTime.january: Colors.red,
    DateTime.february: Colors.pink,
    DateTime.march: Colors.purple,
    DateTime.april: Colors.indigo,
    DateTime.may: Colors.blue,
    DateTime.june: Colors.lightBlue,
    DateTime.july: Colors.green,
    DateTime.august: Colors.lime,
    DateTime.september: Colors.yellow,
    DateTime.october: Colors.orange,
    DateTime.november: Colors.deepOrange,
    DateTime.december: Colors.brown,
  };
}
