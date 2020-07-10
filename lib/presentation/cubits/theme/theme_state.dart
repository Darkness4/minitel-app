part of 'theme_cubit.dart';

@freezed
abstract class ThemeState implements _$ThemeState {
  const factory ThemeState(
    ThemeData themeData,
    ThemeData darkThemeData,
    String value,
  ) = _ThemeState;

  const ThemeState._();

  factory ThemeState.dark() {
    return ThemeState(_themeDataDark, _themeDataDark, 'Dark');
  }

  factory ThemeState.light() {
    return ThemeState(_themeData, _themeData, 'Light');
  }

  factory ThemeState.adaptive() {
    return ThemeState(_themeData, _themeDataDark, 'Adaptive');
  }
}

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
