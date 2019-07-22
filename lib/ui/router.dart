import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';

import 'widgets/page_animation.dart';
import 'views/about.dart';
import 'views/calendar.dart';
import 'views/docs.dart';
import 'views/news.dart';
import 'views/portal.dart';
import 'views/reporting.dart';
import 'views/feedback.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Authentication:
        return FadeRoute(
          builder: (BuildContext context) =>
              PortalPage(title: "Authentification"),
          settings: settings,
        );
      case RoutePaths.Reporting:
        return FadeRoute(
          builder: (BuildContext context) =>
              ReportingPage(title: "Signaler Minitel"),
          settings: settings,
        );
      case RoutePaths.Docs:
        return FadeRoute(
          builder: (BuildContext context) =>
              DocumentationPage(title: "Documentation"),
          settings: settings,
        );
      case RoutePaths.News:
        return FadeRoute(
          builder: (BuildContext context) => NewsPage(title: "Nouveautés"),
          settings: settings,
        );
      case RoutePaths.Calendar:
        return FadeRoute(
          builder: (BuildContext context) => CalendarPage(title: "Calendrier"),
          settings: settings,
        );
      case RoutePaths.About:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              AboutPage(title: "A propos de l'application"),
          settings: settings,
        );
      case RoutePaths.Feedback:
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
