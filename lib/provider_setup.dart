import 'package:provider/provider.dart';

import 'core/services/http_gateway.dart';
import 'core/services/http_portail.dart';
import 'core/services/http_version_checker.dart';
import 'core/services/http_webfeed.dart';
import 'core/services/http_webhook.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: GatewayAPI()),
  Provider.value(value: PortailAPI()),
  Provider.value(value: VersionAPI()),
  Provider.value(value: WebhookAPI()),
  Provider.value(value: WebFeedAPI()),
];

List<SingleChildCloneableWidget> dependentServices = [];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
