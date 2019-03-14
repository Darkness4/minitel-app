import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations.dart';
import 'pages/calendar.dart';
import 'pages/diagnose.dart';
import 'pages/docs.dart';
import 'pages/login.dart';
import 'pages/maps.dart';
import 'pages/news.dart';

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
        '/': (context) => LoginPage(title: AppLoc.of(context).titleLoginPage),
        '/login': (context) =>
            LoginPage(title: AppLoc.of(context).titleLoginPage),
        '/diagnose': (context) =>
            DiagnosePage(title: AppLoc.of(context).titleDiagnosePage),
        '/docs': (context) =>
            DocumentationPage(title: AppLoc.of(context).titleDocumentationPage),
        '/calendar': (context) =>
            CalendarPage(title: AppLoc.of(context).titleCalendarPage),
        '/news': (context) => NewsPage(title: AppLoc.of(context).titleNewsPage),
        '/maps': (context) => MapsPage(title: AppLoc.of(context).titleMapsPage),
      },
    );
  }
}
