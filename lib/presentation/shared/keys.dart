class Keys {
  // News page
  static const String newsTabs = 'news_page/tabs';
  static const String newsLoading = 'news_page/loading';
  static const String twitterTab = 'news_page/twitter_tab';
  static const String githubTab = 'news_page/github_tab';
  static const String twitterList = 'twitter_tab/list';
  static const String githubList = 'github_tab/list';
  static String githubItem(int index) => 'github_tab/gh_item_$index';
  static String twitterItem(int index) => 'twitter_tab/fb_item_$index';

  // Navigation
  static const String authenticationRoute = 'drawer/authentication';
  static const String newsRoute = 'drawer/news';
  static const String agendaRoute = 'drawer/agenda';
  static const String reportingRoute = 'drawer/reporting';
  static const String docsRoute = 'drawer/docs';
  static const String aboutRoute = 'drawer/about';

  // Authentication
  static const String portalTabs = 'portal_page/tabs';
  static const String appsTab = 'portal_page/apps_tab';
  static const String loginTab = 'portal_page/login_tab';

  static const String loginList = 'login/list';
  static const String appsList = 'apps_list/list';
  static const String timeDropdown = 'login/time';
  static const String nameServerDropdown = 'login/name_server';
  static const String uidLoginTextField = 'login/uid';
  static const String pswdLoginTextField = 'login/pswd';
  static const String rememberMeButton = 'login/remember_me';
  static const String autoLoginButton = 'login/auto_login';
  static const String loginButton = 'login/connect';
  static const String gatewayText = 'login/gateway_text';
  static const String agendaSuccess = 'login/agenda_success';
  static const String portailSuccess = 'login/portail_success';
  static const String imprimanteSuccess = 'login/imprimante_success';

  static const String sogo = 'app_lists/sogo';
  static const String portail = 'app_lists/portail';
  static const String imprimante = 'app_lists/imprimante';
  static const String wikiMinitel = 'app_lists/wiki_minitel';

  // Agenda Error Widget
  static const String agendaUid = 'agenda_page/uid';
  static const String agendaPswd = 'agenda_page/pswd';
  static const String agendaConnect = 'agenda_page/connect';

  // Reporting
  static const String reportingTabs = 'reporting_page/tabs';
  static const String diagnosisTab = 'reporting_page/diagnosis_tab';
  static const String reportingTab = 'reporting_page/reporting_tab';
  static const String zabbixTab = 'reporting_page/zabbix_tab';
  static const String reportingFAB = 'reporting_page/diagnose';
  static const String reportingFABDone = 'reporting_page/diagnose_done';
  static const String sendToSlack = 'reporting_page/slack';
  static const String reportTitle = 'report_tab/title';
  static const String reportDescription = 'report_tab/description';
  static const String reportName = 'report_tab/name';
  static const String reportRoom = 'report_tab/room';
  static const String diagnosisList = 'diagnose_tab/list';
  static String diagnosisEntry(String key) => 'diagnose_tab/$key';

  // Docs
  static const String toDocsHome = 'doc_drawer/minitel';
  static const String toDocsAuthentification = 'doc_drawer/authentification';
  static const String toDocsDiagnostique = 'doc_drawer/diagnostique';
  static const String toDocsImprimante = 'doc_drawer/imprimante';
  static const String toDocsSogo = 'doc_drawer/sogo';
  static const String toDocsDualBoot = 'doc_drawer/dualboot';
  static const String toDocsVM = 'doc_drawer/vm';
  static const String toolboxPages = 'toolbox_docs/pages';
  static const String wikiPages = 'wiki_docs/pages';
  static const String loginPage = 'toolbox_docs/login';
  static const String diagnosePage = 'toolbox_docs/diagnose';
  static const String mailPage = 'wiki_docs/mail';
  static const String dualbootPage = 'wiki_docs/dualboot';
  static const String imprimantePage = 'wiki_docs/imprimante';
  static const String vmPage = 'wiki_docs/vm';
}
