part of 'theme_bloc.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toDark() = ThemeToDark;
  const factory ThemeEvent.toLight() = ThemeToLight;
  const factory ThemeEvent.toAdaptive() = ThemeToAdaptive;
}
