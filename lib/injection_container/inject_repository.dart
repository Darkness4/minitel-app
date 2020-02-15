part of 'injection_container.dart';

void injectRepository() {
  sl.registerLazySingleton<LoginSettingsRepository>(
    () => LoginSettingsRepositoryImpl(
      localDataSource: sl<LoginSettingsDataSource>(),
    ),
  );
  sl.registerLazySingleton<ReleasesRepository>(
    () => ReleasesRepositoryImpl(
      localDataSource: sl<GithubLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<GithubRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(
      localDataSource: sl<TwitterLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<TwitterRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<NotificationSettingsRepository>(
    () => NotificationSettingsRepositoryImpl(
      localDataSource: sl<NotificationSettingsDataSource>(),
    ),
  );
  sl.registerLazySingleton<ZabbixHostsRepository>(
    () => ZabbixHostsRepositoryImpl(
      remoteDataSource: sl<ZabbixRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<CalendarURLRepository>(
    () => CalendarURLRepositoryImpl(
      localDataSource: sl<CalendarURLLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<CalendarURLRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<ICalendarRepository>(
    () => ICalendarRepositoryImpl(
      localDataSource: sl<ICalendarLocalDataSource>(),
      remoteDataSource: sl<ICalendarRemoteDataSource>(),
      calendarURLRepository: sl<CalendarURLRepository>(),
    ),
  );
  sl.registerLazySingleton<DiagnosisRepository>(
    () => DiagnosisRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      diagnosisDataSource: sl<DiagnosisDataSource>(),
    ),
  );
}
