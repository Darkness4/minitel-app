import 'package:provider/provider.dart';

import 'core/services/calendar_url_api.dart';
import 'core/services/github_api.dart';
import 'core/services/icalendar_api.dart';
import 'core/services/stormshield_api.dart';
import 'core/services/webhook_api.dart';

List<SingleChildCloneableWidget> providers = <Provider<dynamic>>[
  // StormshieldAPI used in login and reporting_view
  Provider<StormshieldAPI>.value(value: StormshieldAPI()),
  // WebhookAPI used in feedback_view and reporting_view
  Provider<WebhookAPI>.value(value: WebhookAPI()),
  // GithubAPI used in github_ab and about_view
  Provider<GithubAPI>.value(value: GithubAPI()),
  // GithubAPI used in login, agenda_view and agenda_widgets
  Provider<CalendarUrlAPI>.value(value: CalendarUrlAPI()),
  // ICalendar used in login, agenda_view and agenda_widgets
  Provider<ICalendarAPI>.value(value: ICalendarAPI())
];
