import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/provider_setup.dart' as providers_setup;
import 'package:minitel_toolbox/ui/router.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers_setup.providers,
      child: MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: "Minitel Toolbox",
        onGenerateRoute: Router.generateRoute,
        supportedLocales: const <Locale>[Locale('fr', 'FR')],
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: MinitelColors.PrimaryColor,
          fontFamily: 'Roboto',
          textTheme: MinitelTextStyles.textTheme,
        ),
        initialRoute: RoutePaths.Authentication,
      ),
    );
  }
}
