import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/texts_constants.dart';

import 'views/about_view.dart';
import 'views/agenda_view.dart';
import 'views/docs_view.dart';
import 'views/news_view.dart';
import 'views/portal_view.dart';
import 'views/reporting_view.dart';
import 'widgets/page_animation.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Authentication:
        return FadeRoute<dynamic>(
          builder: (_) => const PortalView(title: Titles.Authentication),
          settings: settings,
        );
      case RoutePaths.Reporting:
        return FadeRoute<dynamic>(
          builder: (_) => const ReportingView(title: Titles.Reporting),
          settings: settings,
        );
      case RoutePaths.Docs:
        return SlideRightRoute<dynamic>(
          builder: (_) => const DocumentationView(title: Titles.Docs),
          settings: settings,
        );
      case RoutePaths.News:
        return FadeRoute<dynamic>(
          builder: (_) => const NewsView(title: Titles.News),
          settings: settings,
        );
      case RoutePaths.Agenda:
        return FadeRoute<dynamic>(
          builder: (_) => const AgendaView(title: Titles.Agenda),
          settings: settings,
        );
      case RoutePaths.About:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AboutView(title: Titles.About),
          settings: settings,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Text(
              'No route defined for ${settings.name}',
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }
}
