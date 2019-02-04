import 'package:flutter/material.dart';

import 'pages/diagnose.dart';
import 'pages/docs.dart';
import 'pages/login.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(title: 'fw-cgcp.emse.fr Login'),
        '/login': (context) => LoginPage(title: 'fw-cgcp.emse.fr Login'),
        '/diagnose': (context) => DiagnosePage(title: 'Diagnose'),
        '/docs': (context) => DocumentationPage(title: 'Documentation'),
      },
    );
  }
}
