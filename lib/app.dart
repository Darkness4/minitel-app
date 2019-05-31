import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'router.dart';

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
          primarySwatch: Colors.green,
          fontFamily: 'NotoSans',
          textTheme: TextTheme(
            body1: TextStyle(
              height: 1.2,
              color: Colors.black87,
            ),
            body2: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            headline: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            title: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            display1: TextStyle(height: 1.5),
            display2: TextStyle(
              height: 1.5,
            ),
            display3: TextStyle(height: 1.5),
            display4: TextStyle(height: 1.5),
            subhead: TextStyle(
              height: 1.5,
              color: Colors.black87,
            ),
            subtitle: TextStyle(
              height: 1.5,
              color: Colors.black87,
            ),
          )),
      initialRoute: '/',
    );
  }
}
