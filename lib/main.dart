import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await initializeFlutterLocalNotificationPlugin();
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
    return CubitProvider<ThemeCubit>(
      create: (_) => ThemeCubit(
        prefs: sl<SharedPreferences>(),
      ),
      child: const CubitBuilder<ThemeCubit, ThemeState>(
        builder: _buildMyApp,
      ),
    );
  }
}

Future<void> initializeFlutterLocalNotificationPlugin() async {
  const _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  const _initializationSettingsIOS = IOSInitializationSettings();
  const initializationSettings = InitializationSettings(
    _initializationSettingsAndroid,
    _initializationSettingsIOS,
  );
  await sl<FlutterLocalNotificationsPlugin>()
      .initialize(initializationSettings);
}
