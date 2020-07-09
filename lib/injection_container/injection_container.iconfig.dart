// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:http/src/client.dart';
import 'package:connectivity/connectivity.dart';
import 'package:minitel_toolbox/core/cookies/cookie_manager.dart';
import 'package:minitel_toolbox/core/datetime/datetime_manager.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minitel_toolbox/data/datasources/github/github_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github/github_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/core/internet_address/internet_address_manager.dart';
import 'package:ntlm/ntlm.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:flutter_local_notifications/src/notification_details.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portail_emse_status/portail_emse_status_cubit.dart';
import 'package:minitel_toolbox/core/process/process_manager.dart';
import 'package:minitel_toolbox/data/repositories/releases_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/report_status/report_status_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/stormshield_status/stormshield_status_cubit.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/zabbix/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/calendar_url_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis/diagnosis_data_source.dart';
import 'package:minitel_toolbox/data/repositories/diagnosis_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/github_releases/github_releases_bloc.dart';
import 'package:minitel_toolbox/data/repositories/icalendar_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/imprimante_status/imprimante_status_cubit.dart';
import 'package:minitel_toolbox/data/datasources/settings/login_settings_data_source.dart';
import 'package:minitel_toolbox/data/repositories/login_settings_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/login_settings_repository.dart';
import 'package:minitel_toolbox/data/datasources/settings/notification_settings_data_source.dart';
import 'package:minitel_toolbox/data/repositories/notification_settings_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portal_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_login/portal_login_bloc.dart';
import 'package:minitel_toolbox/data/repositories/post_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/post_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/report/report_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/twitter_feed/twitter_feed_bloc.dart';
import 'package:minitel_toolbox/data/repositories/zabbix_hosts_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/agenda/agenda_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/calendar_status/calendar_status_cubit.dart';
import 'package:minitel_toolbox/presentation/blocs/diagnosis/diagnosis_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/notification_settings/notification_settings_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/zabbix_hosts/zabbix_hosts_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final externalsModule = _$ExternalsModule();
  g.registerLazySingleton<Client>(() => externalsModule.httpClient);
  g.registerLazySingleton<Connectivity>(() => externalsModule.connectivity);
  g.registerLazySingleton<CookieManager>(() => CookieManager());
  g.registerLazySingleton<DateTimeManager>(() => DateTimeManagerImpl());
  g.registerFactory<Diagnosis>(() => Diagnosis());
  g.registerLazySingleton<FileManager>(() => FileManager());
  g.registerLazySingleton<FlutterLocalNotificationsPlugin>(
      () => externalsModule.flutterLocalNotificationsPlugin);
  g.registerLazySingleton<FlutterSecureStorage>(() => externalsModule.storage);
  g.registerLazySingleton<GithubLocalDataSource>(
      () => GithubLocalDataSourceImpl(fileManager: g<FileManager>()));
  g.registerLazySingleton<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(client: g<Client>()));
  g.registerLazySingleton<ICalendarLocalDataSource>(
      () => ICalendarLocalDataSourceImpl(fileManager: g<FileManager>()));
  g.registerLazySingleton<ICalendarRemoteDataSource>(
      () => ICalendarRemoteDataSourceImpl(client: g<Client>()));
  g.registerLazySingleton<InternetAddressManager>(
      () => InternetAddressManagerImpl());
  g.registerLazySingleton<NTLMClient>(() => externalsModule.ntlmClient);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(g<Connectivity>()));
  g.registerLazySingleton<NotificationDetails>(
      () => externalsModule.notificationDetails);
  g.registerLazySingleton<PortailEMSERemoteDataSource>(() =>
      PortailEMSERemoteDataSourceImpl(
          client: g<Client>(), cookieManager: g<CookieManager>()));
  g.registerFactory<PortailEmseStatusCubit>(
      () => PortailEmseStatusCubit(g<PortailEMSERemoteDataSource>()));
  g.registerLazySingleton<ProcessManager>(() => ProcessManagerImpl());
  g.registerLazySingleton<ReleasesRepository>(() => ReleasesRepositoryImpl(
        localDataSource: g<GithubLocalDataSource>(),
        remoteDataSource: g<GithubRemoteDataSource>(),
        networkInfo: g<NetworkInfo>(),
      ));
  g.registerFactory<ReportStatusBloc>(() => ReportStatusBloc());
  final sharedPreferences = await externalsModule.prefs;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerLazySingleton<SlackRemoteDataSource>(() =>
      SlackRemoteDataSourceImpl(
          client: g<Client>(), dateTimeManager: g<DateTimeManager>()));
  g.registerLazySingleton<StormshieldRemoteDataSource>(
      () => StormshieldRemoteDataSourceImpl(client: g<Client>()));
  g.registerFactory<StormshieldStatusCubit>(
      () => StormshieldStatusCubit(g<StormshieldRemoteDataSource>()));
  g.registerFactory<StringBuffer>(() => externalsModule.stringBuffer);
  g.registerLazySingleton<TwitterLocalDataSource>(
      () => TwitterLocalDataSourceImpl(fileManager: g<FileManager>()));
  g.registerLazySingleton<TwitterRemoteDataSource>(() =>
      TwitterRemoteDataSourceImpl(
          client: g<Client>(), tokenBuffer: g<StringBuffer>()));
  g.registerLazySingleton<ZabbixRemoteDataSource>(
      () => ZabbixRemoteDataSourceImpl(clientNoCheck: g<Client>()));
  g.registerLazySingleton<CalendarURLLocalDataSource>(
      () => CalendarURLLocalDataSourceImpl(prefs: g<SharedPreferences>()));
  g.registerLazySingleton<CalendarURLRemoteDataSource>(
      () => CalendarURLRemoteDataSourceImpl(client: g<Client>()));
  g.registerLazySingleton<CalendarURLRepository>(
      () => CalendarURLRepositoryImpl(
            localDataSource: g<CalendarURLLocalDataSource>(),
            remoteDataSource: g<CalendarURLRemoteDataSource>(),
            networkInfo: g<NetworkInfo>(),
          ));
  g.registerLazySingleton<DiagnosisDataSource>(() => DiagnosisDataSourceImpl(
        diagnosis: g<Diagnosis>(),
        processManager: g<ProcessManager>(),
        connectivity: g<Connectivity>(),
        internetAddressManager: g<InternetAddressManager>(),
        stormshieldRemoteDataSource: g<StormshieldRemoteDataSource>(),
      ));
  g.registerLazySingleton<DiagnosisRepository>(() => DiagnosisRepositoryImpl(
      diagnosisDataSource: g<DiagnosisDataSource>(),
      networkInfo: g<NetworkInfo>()));
  g.registerFactory<GithubReleasesBloc>(
      () => GithubReleasesBloc(repository: g<ReleasesRepository>()));
  g.registerLazySingleton<ICalendarRepository>(() => ICalendarRepositoryImpl(
        localDataSource: g<ICalendarLocalDataSource>(),
        remoteDataSource: g<ICalendarRemoteDataSource>(),
        calendarURLRepository: g<CalendarURLRepository>(),
        networkInfo: g<NetworkInfo>(),
      ));
  g.registerLazySingleton<ImprimanteRemoteDataSource>(() =>
      ImprimanteRemoteDataSourceImpl(
          ntlmClient: g<NTLMClient>(), cookieManager: g<CookieManager>()));
  g.registerFactory<ImprimanteStatusCubit>(
      () => ImprimanteStatusCubit(g<ImprimanteRemoteDataSource>()));
  g.registerLazySingleton<LoginSettingsDataSource>(() =>
      LoginSettingsDataSourceImpl(
          prefs: g<SharedPreferences>(), storage: g<FlutterSecureStorage>()));
  g.registerLazySingleton<LoginSettingsRepository>(() =>
      LoginSettingsRepositoryImpl(
          localDataSource: g<LoginSettingsDataSource>()));
  g.registerLazySingleton<NotificationSettingsDataSource>(
      () => NotificationSettingsDataSourceImpl(prefs: g<SharedPreferences>()));
  g.registerLazySingleton<NotificationSettingsRepository>(() =>
      NotificationSettingsRepositoryImpl(
          localDataSource: g<NotificationSettingsDataSource>()));
  g.registerFactory<PortalBloc>(
      () => PortalBloc(loginSetingsRepository: g<LoginSettingsRepository>()));
  g.registerFactory<PortalLoginBloc>(() => PortalLoginBloc(
        stormshieldRemoteDataSource: g<StormshieldRemoteDataSource>(),
        iCalendarRepository: g<ICalendarRepository>(),
        imprimanteRemoteDataSource: g<ImprimanteRemoteDataSource>(),
        portailEMSERemoteDataSource: g<PortailEMSERemoteDataSource>(),
      ));
  g.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        localDataSource: g<TwitterLocalDataSource>(),
        remoteDataSource: g<TwitterRemoteDataSource>(),
        networkInfo: g<NetworkInfo>(),
      ));
  g.registerFactory<ReportBloc>(
      () => ReportBloc(slackRemoteDataSource: g<SlackRemoteDataSource>()));
  g.registerFactory<TwitterFeedBloc>(
      () => TwitterFeedBloc(repository: g<PostRepository>()));
  g.registerLazySingleton<ZabbixHostsRepository>(() =>
      ZabbixHostsRepositoryImpl(remoteDataSource: g<ZabbixRemoteDataSource>()));
  g.registerFactory<AgendaBloc>(() => AgendaBloc(
        flutterLocalNotificationsPlugin: g<FlutterLocalNotificationsPlugin>(),
        notificationDetails: g<NotificationDetails>(),
        iCalendarRepository: g<ICalendarRepository>(),
      ));
  g.registerFactory<CalendarStatusCubit>(
      () => CalendarStatusCubit(g<CalendarURLRepository>()));
  g.registerFactory<DiagnosisBloc>(
      () => DiagnosisBloc(diagnosisRepository: g<DiagnosisRepository>()));
  g.registerFactory<NotificationSettingsBloc>(() => NotificationSettingsBloc(
      repository: g<NotificationSettingsRepository>()));
  g.registerFactory<ZabbixHostsBloc>(
      () => ZabbixHostsBloc(repository: g<ZabbixHostsRepository>()));
}

class _$ExternalsModule extends ExternalsModule {}
