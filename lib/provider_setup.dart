import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/diagnosis_api.dart';
import 'package:minitel_toolbox/core/services/zabbix_api.dart';
import 'package:provider/provider.dart';

import 'core/services/calendar_url_api.dart';
import 'core/services/github_api.dart';
import 'core/services/icalendar_api.dart';
import 'core/services/portail_emse_api.dart';
import 'core/services/stormshield_api.dart';
import 'core/services/webhook_api.dart';

List<SingleChildCloneableWidget> providers = <SingleChildCloneableWidget>[
  ...independentServices,
  ...dependentServices,
];

List<SingleChildCloneableWidget> independentServices =
    <SingleChildCloneableWidget>[
  // StormshieldAPI used in login and reporting_view
  Provider<StormshieldAPI>.value(value: StormshieldAPI()),

  // WebhookAPI used in feedback_view and reporting_view
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
];

List<SingleChildCloneableWidget> dependentServices =
    <SingleChildCloneableWidget>[
  ProxyProvider<StormshieldAPI, DiagnosisAPI>(
    builder: (BuildContext context, StormshieldAPI stormshieldAPI,
            DiagnosisAPI diagnosisAPI) =>
        DiagnosisAPI(stormshieldAPI: stormshieldAPI),
  )
];
