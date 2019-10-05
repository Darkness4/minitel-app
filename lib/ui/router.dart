import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';

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
          builder: (BuildContext context) =>
              PortalView(title: AppLoc.of(context).portal.title),
          settings: settings,
        );
      case RoutePaths.Reporting:
        return FadeRoute<dynamic>(
          builder: (BuildContext context) =>
              ReportingView(title: AppLoc.of(context).reporting.title),
          settings: settings,
        );
      case RoutePaths.Docs:
        return SlideRightRoute<dynamic>(
          builder: (BuildContext context) =>
              DocumentationView(title: AppLoc.of(context).docs.title),
          settings: settings,
        );
      case RoutePaths.News:
        return FadeRoute<dynamic>(
          builder: (BuildContext context) =>
              NewsView(title: AppLoc.of(context).news.title),
          settings: settings,
        );
      case RoutePaths.Agenda:
        return FadeRoute<dynamic>(
          builder: (BuildContext context) =>
              AgendaView(title: AppLoc.of(context).agenda.title),
          settings: settings,
        );
      case RoutePaths.About:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              AboutView(title: AppLoc.of(context).about.title),
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
