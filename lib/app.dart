import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';

import 'ui/router.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        textTheme: TextTheme(
          body1: MinitelTextStyles.body1,
          body2: MinitelTextStyles.body2,
          headline: MinitelTextStyles.headline,
          title: MinitelTextStyles.mdH2,
          display1: MinitelTextStyles.display1,
          display2: MinitelTextStyles.display2,
          display3: MinitelTextStyles.display3,
          display4: MinitelTextStyles.display4,
          subtitle: MinitelTextStyles.subtitle,
          subhead: MinitelTextStyles.subhead,
        ),
      ),
      initialRoute: '/',
    );
  }
}
