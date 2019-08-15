import 'package:provider/provider.dart';

import 'core/services/http_calendar_url.dart';
import 'core/services/http_facebook_api.dart';
import 'core/services/http_gateway.dart';
import 'core/services/http_portail.dart';
import 'core/services/http_version_checker.dart';
import 'core/services/http_webfeed.dart';
import 'core/services/http_webhook.dart';
import 'core/services/icalendar.dart';

List<SingleChildCloneableWidget> providers = [
  Provider.value(value: GatewayAPI()),
  Provider.value(value: PortailAPI()),
  Provider.value(value: VersionAPI()),
  Provider.value(value: WebhookAPI()),
  Provider.value(value: WebFeedAPI()),
  Provider.value(value: CalendarUrlAPI()),
  Provider.value(value: FacebookAPI()),
  Provider.value(value: ICalendar())
];
