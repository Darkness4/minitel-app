import 'package:flutter_driver/flutter_driver.dart';

class MinitelFinders {
  // Navigation
  // final drawer = find.byTooltip('Ouvrir le menu de navigation');
  final drawer = find.descendant(
    of: find.byType('NavigationToolbar'),
    matching: find.byType('IconButton'),
  );
  final endDrawer = find.descendant(
    of: find.byType('NavigationToolbar'),
    matching: find.byType('IconButton'),
  );
  final authenticationRoute = find.byValueKey('drawer/authentication');
  final newsRoute = find.byValueKey('drawer/news');
  final agendaRoute = find.byValueKey('drawer/agenda');
  final reportingRoute = find.byValueKey('drawer/reporting');
  final docsRoute = find.byValueKey('drawer/docs');
  final aboutRoute = find.byValueKey('drawer/about');

  final goBack = find.byTooltip('Retour');

  // Authentication
  final closeUpdateButton = find.byValueKey('portal_view/close_update');
  final portalTabs = find.byValueKey('portal_view/tabs');
  final appsTab = find.byValueKey('portal_view/apps_tab');
  final loginTab = find.byValueKey('portal_view/login_tab');

  final timeDropdown = find.byValueKey('login/time');
  final nameServerDropdown = find.byValueKey('login/name_server');
  final uidLoginTextField = find.byValueKey('login/uid');
  final pswdLoginTextField = find.byValueKey('login/pswd');
  final rememberMeButton = find.byValueKey('login/remember_me');
  final autoLoginButton = find.byValueKey('login/auto_login');
  final loginButton = find.byValueKey('login/connect');
  final gatewayText = find.byValueKey('login/gateway_text');
  final agendaSuccess = find.byValueKey('login/agenda_success');
  final portailSuccess = find.byValueKey('login/portail_success');

  final sogo = find.byValueKey('app_lists/sogo');
  final portail = find.byValueKey('app_lists/portail');
  final imprimante = find.byValueKey('app_lists/imprimante');
  final wikiMinitel = find.byValueKey('app_lists/wiki_minitel');

  // News
  final newsTabs = find.byValueKey('news_view/tabs');
  final newsLoading = find.byValueKey('facebook_tab/loading');
  final facebookTab = find.byValueKey('news_view/facebook_tab');
  final githubTab = find.byValueKey('news_view/github_tab');
  final facebookList = find.byValueKey('facebook_tab/list');
  final githubList = find.byValueKey('github_tab/list');

  // Agenda Error Widget
  final agendaUid = find.byValueKey('agenda_view/uid');
  final agendaPswd = find.byValueKey('agenda_view/pswd');
  final agendaConnect = find.byValueKey('agenda_view/connect');

  // Reporting
  final reportingTabs = find.byValueKey('reporting_view/tabs');
  final diagnosisTab = find.byValueKey('reporting_view/diagnosis_tab');
  final reportingTab = find.byValueKey('reporting_view/reporting_tab');
  final reportingFAB = find.byValueKey('reporting_view/diagnose');
  final reportingFABDone = find.byValueKey('reporting_view/diagnose_done');
  final sendToSlack = find.byValueKey('reporting_view/slack');
  final reportTitle = find.byValueKey('report_tab/title');
  final reportDescription = find.byValueKey('report_tab/description');
  final diagnosisList = find.byValueKey('diagnose_tab/list');
}
