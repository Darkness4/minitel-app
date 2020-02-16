part of 'injection_container.dart';

Future<void> injectDataSource() async {
  final Directory directory =
      await path_provider.getApplicationDocumentsDirectory();
  final File releasesFile = File('${directory.path}/${CacheKeys.releases}');
  final File feedFile = File('${directory.path}/${CacheKeys.feed}');
  final File icalendarFile = File('${directory.path}/${CacheKeys.iCalendar}');
  sl.registerLazySingleton<LoginSettingsDataSource>(
    () => LoginSettingsDataSourceImpl(
      prefs: sl<SharedPreferences>(),
      storage: sl<FlutterSecureStorage>(),
    ),
  );
  sl.registerLazySingleton<GithubRemoteDataSource>(
    () => GithubRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<GithubLocalDataSource>(
    () => GithubLocalDataSourceImpl(file: releasesFile),
  );
  sl.registerLazySingleton<ZabbixRemoteDataSource>(
    () => ZabbixRemoteDataSourceImpl(clientNoCheck: sl<io_client.IOClient>()),
  );
  sl.registerLazySingleton<NotificationSettingsDataSource>(
    () => NotificationSettingsDataSourceImpl(prefs: sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<TwitterRemoteDataSource>(
    () => TwitterRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<TwitterLocalDataSource>(
    () => TwitterLocalDataSourceImpl(file: feedFile),
  );
  sl.registerLazySingleton<StormshieldRemoteDataSource>(
    () => StormshieldRemoteDataSourceImpl(client: sl<io_client.IOClient>()),
  );
  sl.registerLazySingleton<DiagnosisDataSource>(
    () => DiagnosisDataSourceImpl(
      diagnosis: Diagnosis(),
      connectivity: sl<Connectivity>(),
      internetAddressManager: sl<InternetAddressManager>(),
      processManager: sl<ProcessManager>(),
      stormshieldRemoteDataSource: sl<StormshieldRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<CalendarURLLocalDataSource>(
    () => CalendarURLLocalDataSourceImpl(
      prefs: sl<SharedPreferences>(),
    ),
  );
  sl.registerLazySingleton<CalendarURLRemoteDataSource>(
    () => CalendarURLRemoteDataSourceImpl(
      client: sl<http.Client>(),
    ),
  );
  sl.registerLazySingleton<ICalendarLocalDataSource>(
    () => ICalendarLocalDataSourceImpl(
      file: icalendarFile,
    ),
  );
  sl.registerLazySingleton<ICalendarRemoteDataSource>(
    () => ICalendarRemoteDataSourceImpl(
      client: sl<http.Client>(),
    ),
  );
  sl.registerLazySingleton<SlackRemoteDataSource>(
    () => SlackRemoteDataSourceImpl(
      client: sl<http.Client>(),
      dateTimeManager: sl<DateTimeManager>(),
    ),
  );
  sl.registerLazySingleton<ImprimanteRemoteDataSource>(
    () => ImprimanteRemoteDataSourceImpl(
      ntlmClient: sl<NTLMClient>(),
      cookies: <Cookie>[],
    ),
  );
  sl.registerLazySingleton<PortailEMSERemoteDataSource>(
    () => PortailEMSERemoteDataSourceImpl(
      client: sl<http.Client>(),
      cookies: <Cookie>[],
    ),
  );
}
