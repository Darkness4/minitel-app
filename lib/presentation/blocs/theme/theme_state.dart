part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  ThemeData get themeData;
  const ThemeState();
}

class ThemeDark extends ThemeState {
  const ThemeDark();
  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MinitelColors.primaryColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.green,
        ),
        textTheme: MinitelTextStyles.textTheme,
        bottomAppBarColor: Colors.green,
      );

  @override
  List<Object> get props => [themeData];
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
        textTheme: MinitelTextStyles.textTheme,
        bottomAppBarColor: Colors.green,
      );

  @override
  List<Object> get props => [themeData];
}
