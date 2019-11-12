import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as ioclient;
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis_data_source.dart';
import 'package:minitel_toolbox/data/datasources/facebook_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/facebook_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/settings_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/slack_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/calendar_url_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/feed_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/icalendar_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/notification_settings_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/releases_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/stormshield_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/zabbix_hosts_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/domain/repositories/feed_repository.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';
import 'package:minitel_toolbox/domain/repositories/stormshield_repository.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/facebook_feed/bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/github_releases/github_releases_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/notification_settings/bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/zabbix_hosts/zabbix_hosts_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => GithubReleasesBloc(
      repository: sl<ReleasesRepository>(),
    ),
  );
  sl.registerFactory(
    () => ZabbixHostsBloc(
      repository: sl<ZabbixHostsRepository>(),
    ),
  );
  sl.registerFactory(
    () => NotificationSettingsBloc(
      repository: sl<NotificationSettingsRepository>(),
    ),
  );
  sl.registerFactory(
    () => FacebookFeedBloc(
      repository: sl<FeedRepository>(),
    ),
  );

  // Repository
  sl.registerLazySingleton<ReleasesRepository>(
    () => ReleasesRepositoryImpl(
      localDataSource: sl<GithubLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<GithubRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(
      localDataSource: sl<FacebookLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<FacebookRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<NotificationSettingsRepository>(
    () => NotificationSettingsRepositoryImpl(
      localDataSource: sl<SettingsLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<StormshieldRepository>(
    () => StormshieldRepositoryImpl(
      remoteDataSource: sl<StormshieldRemoteDataSource>(),
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
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<ICalendarRemoteDataSource>(),
      calendarURLRepository: sl<CalendarURLRepository>(),
    ),
  );

  // Data sources
  final Directory directory = await getApplicationDocumentsDirectory();
  final File releasesFile =
      File('${directory.path}/${CacheConstants.releases}');
  final File feedFile = File('${directory.path}/${CacheConstants.feed}');
  final File icalendarFile =
      File('${directory.path}/${CacheConstants.iCalendar}');
  sl.registerLazySingleton<GithubRemoteDataSource>(
    () => GithubRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<GithubLocalDataSource>(
    () => GithubLocalDataSourceImpl(file: releasesFile),
  );
  sl.registerLazySingleton<ZabbixRemoteDataSource>(
    () => ZabbixRemoteDataSourceImpl(clientNoCheck: sl<ioclient.IOClient>()),
  );
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(prefs: sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<FacebookRemoteDataSource>(
    () => FacebookRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<FacebookLocalDataSource>(
    () => FacebookLocalDataSourceImpl(file: feedFile),
  );
  sl.registerLazySingleton<StormshieldRemoteDataSource>(
    () =>
        StormshieldRemoteDataSourceImpl(clientNoCheck: sl<ioclient.IOClient>()),
  );
  sl.registerLazySingleton<DiagnosisDataSource>(
    () => DiagnosisDataSourceImpl(
      networkInfo: sl<NetworkInfo>(),
      stormshieldRepository: sl<StormshieldRepository>(),
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
    ),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl<Connectivity>()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  final customClient = HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => ioclient.IOClient(customClient));
  sl.registerLazySingleton(() => Connectivity());
}
