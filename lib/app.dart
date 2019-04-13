import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations.dart';
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
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('fr', ''), // French
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PortalPage(title: AppLoc.of(context).titlePortalPage),
        '/reporting': (context) =>
            ReportingPage(title: AppLoc.of(context).titleReportingPage),
        '/docs': (context) =>
            DocumentationPage(title: AppLoc.of(context).titleDocumentationPage),
        '/calendar': (context) =>
            CalendarPage(title: AppLoc.of(context).titleCalendarPage),
        '/news': (context) => NewsPage(title: AppLoc.of(context).titleNewsPage),
        '/maps': (context) => MapsPage(title: AppLoc.of(context).titleMapsPage),
        // '/portal': (context) =>
        //     PortalPage(title: AppLoc.of(context).titlePortalPage),
      },
    );
  }
}
