part of 'theme_bloc.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @required ThemeData themeData,
    @required ThemeData themeDataDark,
  }) = _ThemeState;
}

ThemeState ThemeDark = ThemeState(
  themeData: _themeDataDark,
  themeDataDark: _themeDataDark,
);

ThemeState ThemeLight = ThemeState(
  themeData: _themeData,
  themeDataDark: _themeData,
);

ThemeState ThemeAdaptive = ThemeState(
  themeData: _themeData,
  themeDataDark: _themeDataDark,
);

ThemeData get _themeDataDark => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: MinitelColors.primaryColor,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.green,
      ),
      textTheme: MinitelTextStyles.getTextTheme(Brightness.dark),
      bottomAppBarColor: Colors.green,
    );

ThemeData get _themeData => ThemeData(
      brightness: Brightness.light,
      primarySwatch: MinitelColors.primaryColor,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.green,
      ),
      textTheme: MinitelTextStyles.getTextTheme(Brightness.light),
      bottomAppBarColor: Colors.green,
    );
