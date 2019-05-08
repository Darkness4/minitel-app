import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'components/page_animation.dart';
import 'pages/about.dart';
import 'pages/calendar.dart';
import 'pages/docs.dart';
import 'pages/maps.dart';
import 'pages/news.dart';
import 'pages/reporting.dart';
import 'pages/portal.dart';

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
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return FadeRoute(
              builder: (BuildContext context) =>
                  PortalPage(title: "Authentification"),
              settings: settings,
            );
          case '/reporting':
            return FadeRoute(
              builder: (BuildContext context) =>
                  ReportingPage(title: "Signaler Minitel"),
              settings: settings,
            );
          case '/docs':
            return FadeRoute(
              builder: (BuildContext context) =>
                  DocumentationPage(title: "Documentation"),
              settings: settings,
            );
          case '/news':
            return FadeRoute(
              builder: (BuildContext context) => NewsPage(title: "Nouveautés"),
              settings: settings,
            );
          case '/maps':
            return FadeRoute(
              builder: (BuildContext context) => MapsPage(title: "Maps"),
              settings: settings,
            );
          case '/calendar':
            return FadeRoute(
              builder: (BuildContext context) =>
                  CalendarPage(title: "Calendrier"),
              settings: settings,
            );
          case '/about':
            return MaterialPageRoute(
              builder: (BuildContext context) =>
                  AboutPage(title: "A propos de l'application"),
              settings: settings,
            );
        }
        assert(false);
      },
      supportedLocales: [const Locale('fr', 'FR')],
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'NotoSans',
          textTheme: TextTheme(
            body1: TextStyle(height: 1.2),
            body2: TextStyle(fontWeight: FontWeight.bold),
            headline: TextStyle(height: 1.5, fontWeight: FontWeight.bold),
            title: TextStyle(height: 1.5, fontWeight: FontWeight.bold),
            display1: TextStyle(height: 1.5),
            display2: TextStyle(height: 1.5),
            display3: TextStyle(height: 1.5),
            display4: TextStyle(height: 1.5),
            subhead: TextStyle(height: 1.5),
            subtitle: TextStyle(height: 1.5),
          )),
      initialRoute: '/',
    );
  }
}
