import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences prefs;

  ThemeCubit({@required this.prefs}) : super(prefs.initialTheme);

  Future<void> toDark() async {
    await prefs.setString('initial_theme', 'Dark');
    emit(ThemeState.dark());
  }

  Future<void> toLight() async {
    await prefs.setString('initial_theme', 'Light');
    emit(ThemeState.light());
  }

  Future<void> toAdaptive() async {
    await prefs.setString('initial_theme', 'Adaptive');
    emit(ThemeState.adaptive());
  }
}

extension on SharedPreferences {
  ThemeState get initialTheme {
    final initialTheme = getString('initial_theme');
    switch (initialTheme) {
      case 'Dark':
        return ThemeState.dark();
      case 'Light':
        return ThemeState.light();
      case 'Adaptive':
        return ThemeState.adaptive();
      default:
        return ThemeState.adaptive();
    }
  }
}
