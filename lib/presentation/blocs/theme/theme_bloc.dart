import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences prefs;

  ThemeBloc({@required this.prefs}) : super(prefs.initialTheme);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) {
    return event.when(
      toDark: () async* {
        await prefs.setString('initial_theme', 'Dark');
        yield ThemeState.dark();
      },
      toLight: () async* {
        await prefs.setString('initial_theme', 'Light');
        yield ThemeState.light();
      },
      toAdaptive: () async* {
        await prefs.setString('initial_theme', 'Adaptive');
        yield ThemeState.adaptive();
      },
    );
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
