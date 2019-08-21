import 'package:flutter_driver/flutter_driver.dart';

class MinitelFinders {
  // Navigation
  final SerializableFinder drawer =
      find.byTooltip('Ouvrir le menu de navigation');
  final SerializableFinder authenticationRoute =
      find.byValueKey('drawer/authentication');
  final SerializableFinder newsRoute = find.byValueKey('drawer/news');
  final SerializableFinder agendaRoute = find.byValueKey('drawer/agenda');
  final SerializableFinder reportingRoute = find.byValueKey('drawer/reporting');
  final SerializableFinder docsRoute = find.byValueKey('drawer/docs');
  final SerializableFinder aboutRoute = find.byValueKey('drawer/about');

  final SerializableFinder goBack = find.byTooltip('Retour');

  // Authentication
  final SerializableFinder closeUpdateButton =
      find.byValueKey('portal_view/close_update');
  final SerializableFinder portalTabs = find.byValueKey('portal_view/tabs');
  final SerializableFinder appsTab = find.byValueKey('portal_view/apps_tab');
  final SerializableFinder loginTab = find.byValueKey('portal_view/login_tab');

  final SerializableFinder timeDropdown = find.byValueKey('login/time');
  final SerializableFinder nameServerDropdown =
      find.byValueKey('login/name_server');
  final SerializableFinder uidLoginTextField = find.byValueKey('login/uid');
  final SerializableFinder pswdLoginTextField = find.byValueKey('login/pswd');
  final SerializableFinder rememberMeButton =
      find.byValueKey('login/remember_me');
  final SerializableFinder autoLoginButton =
      find.byValueKey('login/auto_login');
  final SerializableFinder loginButton = find.byValueKey('login/connect');
  final SerializableFinder gatewayText = find.byValueKey('login/gateway_text');
  final SerializableFinder agendaSuccess =
      find.byValueKey('login/agenda_success');
  final SerializableFinder portailSuccess =
      find.byValueKey('login/portail_success');

  final SerializableFinder sogo = find.byValueKey('app_lists/sogo');
  final SerializableFinder portail = find.byValueKey('app_lists/portail');
  final SerializableFinder imprimante = find.byValueKey('app_lists/imprimante');
  final SerializableFinder wikiMinitel =
      find.byValueKey('app_lists/wiki_minitel');

  // News
  final SerializableFinder newsTabs = find.byValueKey('news_view/tabs');
  final SerializableFinder newsLoading =
      find.byValueKey('facebook_tab/loading');
  final SerializableFinder facebookTab =
      find.byValueKey('news_view/facebook_tab');
  final SerializableFinder githubTab = find.byValueKey('news_view/github_tab');
  final SerializableFinder facebookList = find.byValueKey('facebook_tab/list');
  final SerializableFinder githubList = find.byValueKey('github_tab/list');

  // Agenda Error Widget
  final SerializableFinder agendaUid = find.byValueKey('agenda_view/uid');
  final SerializableFinder agendaPswd = find.byValueKey('agenda_view/pswd');
  final SerializableFinder agendaConnect =
      find.byValueKey('agenda_view/connect');

  // Reporting
  final SerializableFinder reportingTabs =
      find.byValueKey('reporting_view/tabs');
  final SerializableFinder diagnosisTab =
      find.byValueKey('reporting_view/diagnosis_tab');
  final SerializableFinder reportingTab =
      find.byValueKey('reporting_view/reporting_tab');
  final SerializableFinder reportingFAB =
      find.byValueKey('reporting_view/diagnose');
  final SerializableFinder reportingFABDone =
      find.byValueKey('reporting_view/diagnose_done');
  final SerializableFinder sendToSlack =
      find.byValueKey('reporting_view/slack');
  final SerializableFinder reportTitle = find.byValueKey('report_tab/title');
  final SerializableFinder reportDescription =
      find.byValueKey('report_tab/description');
  final SerializableFinder diagnosisList = find.byValueKey('diagnose_tab/list');

  // Docs
  final SerializableFinder toDocsHome = find.byValueKey('drawer/minitel');
  final SerializableFinder toDocsAuthentification =
      find.byValueKey('drawer/authentification');
  final SerializableFinder toDocsDiagnostique =
      find.byValueKey('drawer/diagnostique');
  final SerializableFinder toDocsImprimante =
      find.byValueKey('drawer/imprimante');
  final SerializableFinder toDocsSogo = find.byValueKey('drawer/sogo');
  final SerializableFinder toDocsDualBoot = find.byValueKey('drawer/dualboot');
  final SerializableFinder toDocsVM = find.byValueKey('drawer/vm');
  final SerializableFinder toolboxPages = find.byValueKey('toolbox_docs/pages');
  final SerializableFinder wikiPages = find.byValueKey('wiki_docs/pages');
  final SerializableFinder loginPage = find.byValueKey('toolbox_docs/login');
  final SerializableFinder diagnosePage =
      find.byValueKey('toolbox_docs/diagnose');
  final SerializableFinder mailPage = find.byValueKey('wiki_docs/mail');
  final SerializableFinder dualbootPage = find.byValueKey('wiki_docs/dualboot');
  final SerializableFinder imprimantePage =
      find.byValueKey('wiki_docs/imprimante');
  final SerializableFinder vmPage = find.byValueKey('wiki_docs/vm');
}
