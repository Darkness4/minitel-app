import 'package:provider/provider.dart';

import 'core/services/github_api.dart';
import 'core/services/http_calendar_url.dart';
import 'core/services/http_facebook_api.dart';
import 'core/services/http_gateway.dart';
import 'core/services/http_portail.dart';
import 'core/services/http_webhook.dart';
import 'core/services/icalendar.dart';

List<SingleChildCloneableWidget> providers = <Provider<dynamic>>[
  Provider<GatewayAPI>.value(value: GatewayAPI()),
  Provider<PortailAPI>.value(value: PortailAPI()),
  Provider<WebhookAPI>.value(value: WebhookAPI()),
  Provider<GithubAPI>.value(value: GithubAPI()),
  Provider<CalendarUrlAPI>.value(value: CalendarUrlAPI()),
  Provider<FacebookAPI>.value(value: FacebookAPI()),
  Provider<ICalendar>.value(value: ICalendar())
];
