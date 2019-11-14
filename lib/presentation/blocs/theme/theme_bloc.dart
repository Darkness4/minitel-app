import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/text_styles.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  final ThemeState initialState;

  ThemeBloc({@required this.initialState});

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeToDark) {
      yield const ThemeDark();
    } else if (event is ThemeToLight) {
      yield const ThemeLight();
    }
  }
}
