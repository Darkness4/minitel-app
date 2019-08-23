import 'package:provider/provider.dart';

import 'core/services/http_calendar_url.dart';
import 'core/services/http_facebook_api.dart';
import 'core/services/http_gateway.dart';
import 'core/services/http_portail.dart';
import 'core/services/http_version_checker.dart';
import 'core/services/http_webfeed.dart';
import 'core/services/http_webhook.dart';
import 'core/services/icalendar.dart';

List<SingleChildCloneableWidget> providers = <Provider<dynamic>>[
  Provider<GatewayAPI>.value(value: GatewayAPI()),
  Provider<PortailAPI>.value(value: PortailAPI()),
  Provider<VersionAPI>.value(value: VersionAPI()),
  Provider<WebhookAPI>.value(value: WebhookAPI()),
  Provider<WebFeedAPI>.value(value: WebFeedAPI()),
  Provider<CalendarUrlAPI>.value(value: CalendarUrlAPI()),
  Provider<FacebookAPI>.value(value: FacebookAPI()),
  Provider<ICalendar>.value(value: ICalendar())
];
