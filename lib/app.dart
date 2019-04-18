import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'localizations.dart';
import 'components/page_animation.dart';
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
        const AppLocDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateTitle: (BuildContext context) => AppLoc.of(context).title,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return FadeRoute(
              builder: (BuildContext context) =>
                  PortalPage(title: AppLoc.of(context).titlePortalPage),
              settings: settings,
            );
          case '/reporting':
            return FadeRoute(
              builder: (BuildContext context) =>
                  ReportingPage(title: AppLoc.of(context).titleReportingPage),
              settings: settings,
            );
          case '/docs':
            return FadeRoute(
              builder: (BuildContext context) => DocumentationPage(
                  title: AppLoc.of(context).titleDocumentationPage),
              settings: settings,
            );
          case '/news':
            return FadeRoute(
              builder: (BuildContext context) =>
                  NewsPage(title: AppLoc.of(context).titleNewsPage),
              settings: settings,
            );
          case '/maps':
            return FadeRoute(
              builder: (BuildContext context) =>
                  MapsPage(title: AppLoc.of(context).titleMapsPage),
              settings: settings,
            );
          case '/calendar':
            return FadeRoute(
              builder: (BuildContext context) =>
                  CalendarPage(title: AppLoc.of(context).titleCalendarPage),
              settings: settings,
            );
        }
        assert(false);
      },
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('fr', ''), // French
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // routes: {
      //   '/': (context) => PortalPage(title: AppLoc.of(context).titlePortalPage),
      //   '/reporting': (context) =>
      //       ReportingPage(title: AppLoc.of(context).titleReportingPage),
      //   '/docs': (context) =>
      //       DocumentationPage(title: AppLoc.of(context).titleDocumentationPage),
      //   '/calendar': (context) =>
      //       CalendarPage(title: AppLoc.of(context).titleCalendarPage),
      //   '/news': (context) => NewsPage(title: AppLoc.of(context).titleNewsPage),
      //   '/maps': (context) => MapsPage(title: AppLoc.of(context).titleMapsPage),
      //   // '/portal': (context) =>
      //   //     PortalPage(title: AppLoc.of(context).titlePortalPage),
      // },
    );
  }
}
