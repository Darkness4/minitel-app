part of 'injection_container.dart';

void injectBloc() {
  sl.registerFactory<AgendaBloc>(
    () => AgendaBloc(
      flutterLocalNotificationsPlugin: sl<FlutterLocalNotificationsPlugin>(),
      iCalendarRepository: sl<ICalendarRepository>(),
      notificationDetails: sl<NotificationDetails>(),
    ),
  );
  sl.registerFactory<DiagnosisBloc>(
    () => DiagnosisBloc(
      diagnosisRepository: sl<DiagnosisRepository>(),
    ),
  );
  sl.registerFactory<TwitterFeedBloc>(
    () => TwitterFeedBloc(
      repository: sl<FeedRepository>(),
    ),
  );
  sl.registerFactory<GithubReleasesBloc>(
    () => GithubReleasesBloc(
      repository: sl<ReleasesRepository>(),
    ),
  );
  sl.registerFactory<NotificationSettingsBloc>(
    () => NotificationSettingsBloc(
      repository: sl<NotificationSettingsRepository>(),
    ),
  );

  final prefs = sl<SharedPreferences>();

  sl.registerFactory<ThemeBloc>(() {
    final String initialTheme = prefs.getString('theme');
    if (initialTheme == "Dark") {
      return ThemeBloc(initialState: const ThemeDark());
    } else if (initialTheme == "Light") {
      return ThemeBloc(initialState: const ThemeLight());
    } else {
      return ThemeBloc(initialState: const ThemeAdaptive());
    }
  });

  sl.registerFactory<PortalBloc>(
    () => PortalBloc(
      loginSetingsRepository: sl<LoginSettingsRepository>(),
    ),
  );
  sl.registerFactory<PortalLoginBloc>(
    () => PortalLoginBloc(
      imprimanteRemoteDataSource: sl<ImprimanteRemoteDataSource>(),
      portailEMSERemoteDataSource: sl<PortailEMSERemoteDataSource>(),
      stormshieldRemoteDataSource: sl<StormshieldRemoteDataSource>(),
      iCalendarRepository: sl<ICalendarRepository>(),
    ),
  );
  sl.registerFactory<PortalStatusBloc>(
    () => PortalStatusBloc(
      calendarURLRepository: sl<CalendarURLRepository>(),
      imprimanteRemoteDataSource: sl<ImprimanteRemoteDataSource>(),
      portailEMSERemoteDataSource: sl<PortailEMSERemoteDataSource>(),
      stormshieldRemoteDataSource: sl<StormshieldRemoteDataSource>(),
    ),
  );

  sl.registerFactory<ReportBloc>(
    () => ReportBloc(
      slackRemoteDataSource: sl<SlackRemoteDataSource>(),
    ),
  );
  sl.registerFactory<ReportStatusBloc>(
    () => ReportStatusBloc(),
  );

  sl.registerFactory<ZabbixHostsBloc>(
    () => ZabbixHostsBloc(
      repository: sl<ZabbixHostsRepository>(),
    ),
  );
}
