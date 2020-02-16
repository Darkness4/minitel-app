part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ThemeToDark extends ThemeEvent {
  const ThemeToDark();
}

class ThemeToLight extends ThemeEvent {
  const ThemeToLight();
}

class ThemeToAdaptive extends ThemeEvent {
  const ThemeToAdaptive();
}
