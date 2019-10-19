import 'package:flutter/material.dart';

/// Color palette of the app
class MinitelColors {
  static const MaterialColor PrimaryColor = Colors.green;
  static const MaterialAccentColor AccentColor = Colors.greenAccent;
  static const Color FontColor = Colors.black87;

  static const Color TerminalHeaderColor = Colors.lightBlue;
  static const Color TerminalBgColor = Colors.black87;
  static const Color TerminalFgColor = Colors.white;

  static const Color ReportPrimaryColor = Colors.red;

  static Color DrawerSelectedColor = Colors.green.withOpacity(0.2);
  static Color DrawerSelectedColorGrey = Colors.grey.withOpacity(0.5);

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
