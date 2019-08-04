import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:provider/provider.dart';

import 'core/services/http_gateway.dart';
import 'core/services/http_portail.dart';
import 'core/services/http_version_checker.dart';
import 'core/services/http_webfeed.dart';
import 'core/services/http_webhook.dart';

List<SingleChildCloneableWidget> dependentServices = [];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: GatewayAPI()),
  Provider.value(value: PortailAPI()),
  Provider.value(value: VersionAPI()),
  Provider.value(value: WebhookAPI()),
  Provider.value(value: WebFeedAPI()),
  Provider.value(value: CalendarUrlAPI()),
];

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
