import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Main Text Styles of the app
class MinitelTextStyles {
  // Others Style
  static TextStyle error = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static TextTheme getTextTheme(Brightness brightness) =>
      GoogleFonts.overpassTextTheme(
        ThemeData(brightness: brightness).textTheme,
      );
}
