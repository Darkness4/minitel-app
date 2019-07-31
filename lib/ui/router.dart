import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';
import 'package:provider/provider.dart';

import 'widgets/page_animation.dart';
import 'views/about_view.dart';
import 'views/calendar_view.dart';
import 'views/docs_view.dart';
import 'views/news_view.dart';
import 'views/portal_view.dart';
import 'views/reporting_view.dart';
import 'views/feedback_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Authentication:
        return FadeRoute(
          builder: (BuildContext context) => PortalView(
            title: "Authentification",
            version: Provider.of<VersionAPI>(context),
          ),
          settings: settings,
        );
      case RoutePaths.Reporting:
        return FadeRoute(
          builder: (BuildContext context) =>
              ReportingView(title: "Signaler Minitel"),
          settings: settings,
        );
      case RoutePaths.Docs:
        return FadeRoute(
          builder: (BuildContext context) =>
              DocumentationView(title: "Documentation"),
          settings: settings,
        );
      case RoutePaths.News:
        return FadeRoute(
          builder: (BuildContext context) => NewsView(title: "Nouveautés"),
          settings: settings,
        );
      case RoutePaths.Calendar:
        return FadeRoute(
          builder: (BuildContext context) => CalendarView(title: "Calendrier"),
          settings: settings,
        );
      case RoutePaths.About:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              AboutView(title: "A propos de l'application"),
          settings: settings,
        );
      case RoutePaths.Feedback:
        return FadeRoute(
          builder: (BuildContext context) =>
              FeedbackView(title: "Alpha Feedback"),
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
