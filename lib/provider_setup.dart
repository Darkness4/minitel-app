import 'package:provider/provider.dart';

import 'core/services/calendar_url_api.dart';
import 'core/services/facebook_api.dart';
import 'core/services/github_api.dart';
import 'core/services/icalendar_api.dart';
import 'core/services/portail_emse_api.dart';
import 'core/services/stormshield_api.dart';
import 'core/services/webhook_api.dart';

List<SingleChildCloneableWidget> providers = <Provider<dynamic>>[
  Provider<GatewayAPI>.value(value: GatewayAPI()),
  Provider<PortailAPI>.value(value: PortailAPI()),
  Provider<WebhookAPI>.value(value: WebhookAPI()),
  Provider<GithubAPI>.value(value: GithubAPI()),
  Provider<CalendarUrlAPI>.value(value: CalendarUrlAPI()),
  Provider<FacebookAPI>.value(value: FacebookAPI()),
  Provider<ICalendar>.value(value: ICalendar())
];
