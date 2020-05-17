import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/text_styles.dart';

part 'theme_bloc.freezed.dart';
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
    yield* event.when(
      toDark: () async* {
        yield ThemeState(
          themeData: themeDataDark,
          themeDataDark: themeDataDark,
        );
      },
      toLight: () async* {
        yield ThemeState(
          themeData: themeData,
          themeDataDark: themeData,
        );
      },
      toAdaptive: () async* {
        yield ThemeState(
          themeData: themeDataDark,
          themeDataDark: themeDataDark,
        );
      },
    );
  }

  static ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MinitelColors.primaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.green,
    ),
    textTheme: MinitelTextStyles.getTextTheme(Brightness.dark),
    bottomAppBarColor: Colors.green,
  );

  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch: MinitelColors.primaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.green,
    ),
    textTheme: MinitelTextStyles.getTextTheme(Brightness.light),
    bottomAppBarColor: Colors.green,
  );
}
