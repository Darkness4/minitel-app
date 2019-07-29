import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/provider_setup.dart' as providers_setup;
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';

import 'package:minitel_toolbox/ui/router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers_setup.providers,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: "Minitel Toolbox",
        onGenerateRoute: Router.generateRoute,
        supportedLocales: [const Locale('fr', 'FR')],
        theme: ThemeData(
          primarySwatch: MinitelColors.PrimaryColor,
          fontFamily: 'NotoSans',
          textTheme: MinitelTextStyles.textTheme,
        ),
        initialRoute: RoutePaths.Authentication,
      ),
    );
  }
}
