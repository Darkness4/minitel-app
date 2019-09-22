import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class MinitelThemeData {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: MinitelColors.PrimaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.green,
    ),
    textTheme: MinitelTextStyles.textTheme,
    bottomAppBarColor: Colors.green,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MinitelColors.PrimaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.green,
    ),
    textTheme: MinitelTextStyles.textTheme,
    bottomAppBarColor: Colors.green,
  );
}
