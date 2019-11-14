import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart'
    as di show init;
import 'package:minitel_toolbox/injection_container/injection_container.dart'
    show sl;
import 'package:minitel_toolbox/presentation/blocs/theme/theme_bloc.dart';
import 'package:minitel_toolbox/presentation/router.dart';

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
    title: "Minitel Toolbox",
    onGenerateRoute: Router.generateRoute,
    supportedLocales: const <Locale>[
      Locale('en', ''),
      Locale('it', ''),
      Locale('fr', 'FR'),
    ],
    theme: state.themeData,
    darkTheme: state.themeData,
    initialRoute: RoutePaths.Authentication,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => sl<ThemeBloc>(),
      child: const BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildMyApp,
      ),
    );
  }
}

Future<void> initializeFlutterLocalNotificationPlugin() async {
  const AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  const IOSInitializationSettings _initializationSettingsIOS =
      IOSInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
    _initializationSettingsAndroid,
    _initializationSettingsIOS,
  );
  await sl<FlutterLocalNotificationsPlugin>()
      .initialize(initializationSettings);
}
