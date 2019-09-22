import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/calendar_url_api.dart';
import 'core/services/diagnosis_api.dart';
import 'core/services/github_api.dart';
import 'core/services/icalendar_api.dart';
import 'core/services/imprimante_api.dart';
import 'core/services/portail_emse_api.dart';
import 'core/services/stormshield_api.dart';
import 'core/services/webhook_api.dart';
import 'core/services/zabbix_api.dart';

class ProviderSetup {
  static List<SingleChildCloneableWidget> dependentServices =
      <SingleChildCloneableWidget>[
    ProxyProvider<StormshieldAPI, DiagnosisAPI>(
      builder: (BuildContext context, StormshieldAPI stormshieldAPI,
              DiagnosisAPI diagnosisAPI) =>
          DiagnosisAPI(stormshieldAPI: stormshieldAPI),
    )
  ];

  static List<SingleChildCloneableWidget> independentServices =
      <SingleChildCloneableWidget>[
    // StormshieldAPI used in login and reporting_view
    Provider<StormshieldAPI>.value(value: StormshieldAPI()),

    // WebhookAPI used in reporting_view
    Provider<WebhookAPI>.value(value: WebhookAPI()),

    // GithubAPI used in github_ab and about_view
    Provider<GithubAPI>.value(value: GithubAPI()),

    // GithubAPI used in login, agenda_view and agenda_widgets
    Provider<CalendarUrlAPI>.value(value: CalendarUrlAPI()),

    // ICalendar used in login, agenda_view and agenda_widgets
    Provider<ICalendarAPI>.value(value: ICalendarAPI()),

    // PortailAPI used in portail webview and portail
    Provider<PortailAPI>.value(value: PortailAPI()),

    // ZabbixAPI used in ZabbixTab
    Provider<ZabbixAPI>.value(value: ZabbixAPI()),

    // ImprimanteAPI used in imprimante.dart and login
    Provider<ImprimanteAPI>.value(value: ImprimanteAPI()),
  ];

  static List<SingleChildCloneableWidget> providers =
      <SingleChildCloneableWidget>[
    ...independentServices,
    ...dependentServices,
  ];
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData get theme => _themeData;

  set theme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
