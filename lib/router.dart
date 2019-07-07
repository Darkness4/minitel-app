import 'package:flutter/material.dart';

import 'components/page_animation.dart';
import 'pages/about.dart';
import 'pages/calendar.dart';
import 'pages/docs.dart';
import 'pages/news.dart';
import 'pages/portal.dart';
import 'pages/reporting.dart';
import 'pages/feedback.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
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
      // case '/maps':
      //   return FadeRoute(
      //     builder: (BuildContext context) => MapsPage(title: "Maps"),
      //     settings: settings,
      //   );
      case '/calendar':
        return FadeRoute(
          builder: (BuildContext context) => CalendarPage(title: "Calendrier"),
          settings: settings,
        );
      case '/about':
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              AboutPage(title: "A propos de l'application"),
          settings: settings,
        );
      case '/feedback':
        return FadeRoute(
          builder: (BuildContext context) =>
              FeedbackPage(title: "Alpha Feedback"),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
