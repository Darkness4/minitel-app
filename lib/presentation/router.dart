import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/presentation/pages/about_page.dart';
import 'package:minitel_toolbox/presentation/pages/agenda_page.dart';
import 'package:minitel_toolbox/presentation/pages/docs_page.dart';
import 'package:minitel_toolbox/presentation/pages/news_page.dart';
import 'package:minitel_toolbox/presentation/pages/portal_page.dart';
import 'package:minitel_toolbox/presentation/pages/reporting_page.dart';
import 'package:minitel_toolbox/presentation/widgets/animations/page_animation.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Authentication:
        return FadeRoute<void>(
          builder: (BuildContext context) =>
              PortalPage(title: AppLoc.of(context).portal.title),
          settings: settings,
        );
      case RoutePaths.Reporting:
        return FadeRoute<void>(
          builder: (BuildContext context) =>
              ReportingPage(title: AppLoc.of(context).reporting.title),
          settings: settings,
        );
      case RoutePaths.Docs:
        return SlideRightRoute<void>(
          builder: (BuildContext context) =>
              DocumentationPage(title: AppLoc.of(context).docs.title),
          settings: settings,
        );
      case RoutePaths.News:
        return FadeRoute<void>(
          builder: (BuildContext context) =>
              NewsPage(title: AppLoc.of(context).news.title),
          settings: settings,
        );
      case RoutePaths.Agenda:
        return FadeRoute<void>(
          builder: (BuildContext context) =>
              AgendaPage(title: AppLoc.of(context).agenda.title),
          settings: settings,
        );
      case RoutePaths.About:
        return MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              AboutPage(title: AppLoc.of(context).about.title),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
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
