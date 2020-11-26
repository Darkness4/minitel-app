import 'dart:io';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart'
    as di show init;
import 'package:minitel_toolbox/injection_container/injection_container.dart'
    show sl;
import 'package:minitel_toolbox/presentation/cubits/theme/theme_cubit.dart';
import 'package:minitel_toolbox/presentation/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:webview_flutter/webview_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await di.init();
  await initializeFlutterLocalNotificationPlugin();
  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  runApp(MyApp());
}

Widget _buildMyApp(BuildContext context, ThemeState state) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      AppLoc.delegate,
    ],
    title: 'Minitel Toolbox',
    onGenerateRoute: Router.generateRoute,
    supportedLocales: const <Locale>[
      Locale('en', ''),
      Locale('it', ''),
      Locale('fr', 'FR'),
    ],
    theme: state.themeData,
    darkTheme: state.darkThemeData,
    initialRoute: RoutePaths.authentication,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(
        prefs: sl<SharedPreferences>(),
      ),
      child: const BlocBuilder<ThemeCubit, ThemeState>(
        builder: _buildMyApp,
      ),
    );
  }
}

Future<void> initializeFlutterLocalNotificationPlugin() async {
  const _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  const initializationSettings = InitializationSettings(
    android: _initializationSettingsAndroid,
  );
  await sl<FlutterLocalNotificationsPlugin>()
      .initialize(initializationSettings);
}
