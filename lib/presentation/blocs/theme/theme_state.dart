part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  ThemeData get themeData;
  ThemeData get themeDataDark;
  const ThemeState();

  @override
  bool get stringify => true;
}

class ThemeDark extends ThemeState {
  const ThemeDark();
  @override
  ThemeData get themeDataDark => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MinitelColors.primaryColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.green,
        ),
        textTheme: MinitelTextStyles.getTextTheme(Brightness.dark),
        bottomAppBarColor: Colors.green,
      );

  @override
  ThemeData get themeData => themeDataDark;

  @override
  List<Object> get props => [themeData];

  @override
  String toString() {
    return "Dark";
  }
}

class ThemeLight extends ThemeState {
  const ThemeLight();
  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        primarySwatch: MinitelColors.primaryColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.green,
        ),
        textTheme: MinitelTextStyles.getTextTheme(Brightness.light),
        bottomAppBarColor: Colors.green,
      );

  @override
  ThemeData get themeDataDark => themeData;

  @override
  List<Object> get props => [themeData];

  @override
  String toString() {
    return "Light";
  }
}

class ThemeAdaptive extends ThemeState {
  const ThemeAdaptive();
  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        primarySwatch: MinitelColors.primaryColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.green,
        ),
        textTheme: MinitelTextStyles.getTextTheme(Brightness.light),
        bottomAppBarColor: Colors.green,
      );

  @override
  ThemeData get themeDataDark => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MinitelColors.primaryColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.green,
        ),
        textTheme: MinitelTextStyles.getTextTheme(Brightness.dark),
        bottomAppBarColor: Colors.green,
      );

  @override
  List<Object> get props => [themeData];

  @override
  String toString() {
    return "Adaptive";
  }
}
