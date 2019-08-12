import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';

import 'views/about_view.dart';
import 'views/calendar_view.dart';
import 'views/docs_view.dart';
import 'views/feedback_view.dart';
import 'views/news_view.dart';
import 'views/portal_view.dart';
import 'views/reporting_view.dart';
import 'widgets/page_animation.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Authentication:
        return FadeRoute(
          builder: (BuildContext context) =>
              const PortalView(title: "Authentification"),
          settings: settings,
        );
      case RoutePaths.Reporting:
        return FadeRoute(
          builder: (BuildContext context) =>
              const ReportingView(title: "Signaler Minitel"),
          settings: settings,
        );
      case RoutePaths.Docs:
        return FadeRoute(
          builder: (BuildContext context) =>
              const DocumentationView(title: "Documentation"),
          settings: settings,
        );
      case RoutePaths.News:
        return FadeRoute(
          builder: (BuildContext context) =>
              const NewsView(title: "Nouveautés"),
          settings: settings,
        );
      case RoutePaths.Calendar:
        return FadeRoute(
          builder: (BuildContext context) =>
              const CalendarView(title: "Calendrier"),
          settings: settings,
        );
      case RoutePaths.About:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const AboutView(title: "A propos de l'application"),
          settings: settings,
        );
      case RoutePaths.Feedback:
        return FadeRoute(
          builder: (BuildContext context) =>
              const FeedbackView(title: "Alpha Feedback"),
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
