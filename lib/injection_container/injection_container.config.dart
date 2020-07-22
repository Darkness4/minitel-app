// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:ntlm/ntlm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/cookies/cookie_manager.dart';
import '../core/datetime/datetime_manager.dart';
import '../core/files/file_manager.dart';
import '../core/internet_address/internet_address_manager.dart';
import '../core/network/network_info.dart';
import '../core/process/process_manager.dart';
import '../data/datasources/calendar_url/calendar_url_local_data_source.dart';
import '../data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import '../data/datasources/diagnosis/diagnosis_data_source.dart';
import '../data/datasources/emse/icalendar_local_data_source.dart';
import '../data/datasources/emse/icalendar_remote_data_source.dart';
import '../data/datasources/emse/imprimante_remote_data_source.dart';
import '../data/datasources/emse/portail_emse_remote_data_source.dart';
import '../data/datasources/emse/stormshield_remote_data_source.dart';
import '../data/datasources/github/github_local_data_source.dart';
import '../data/datasources/github/github_remote_data_source.dart';
import '../data/datasources/settings/login_settings_data_source.dart';
import '../data/datasources/settings/notification_settings_data_source.dart';
import '../data/datasources/slack/slack_remote_data_source.dart';
import '../data/datasources/twitter/twitter_local_data_source.dart';
import '../data/datasources/twitter/twitter_remote_data_source.dart';
import '../data/datasources/zabbix/zabbix_remote_data_source.dart';
import '../data/repositories/calendar_url_repository_impl.dart';
import '../data/repositories/diagnosis_repository_impl.dart';
import '../data/repositories/icalendar_repository_impl.dart';
import '../data/repositories/login_settings_repository_impl.dart';
import '../data/repositories/notification_settings_repository_impl.dart';
import '../data/repositories/post_repository_impl.dart';
import '../data/repositories/releases_repository_impl.dart';
import '../data/repositories/zabbix_hosts_repository_impl.dart';
import '../domain/entities/diagnosis.dart';
import '../domain/repositories/calendar_url_repository.dart';
import '../domain/repositories/diagnosis_repository.dart';
import '../domain/repositories/icalendar_repository.dart';
import '../domain/repositories/login_settings_repository.dart';
import '../domain/repositories/notification_settings_repository.dart';
import '../domain/repositories/post_repository.dart';
import '../domain/repositories/releases_repository.dart';
import '../domain/repositories/zabbix_hosts_repository.dart';
import '../presentation/cubits/agenda/agenda_cubit.dart';
import '../presentation/cubits/news/github_releases/github_releases_cubit.dart';
import '../presentation/cubits/news/notification_settings/notification_settings_cubit.dart';
import '../presentation/cubits/news/twitter_feed/twitter_feed_cubit.dart';
import '../presentation/cubits/portal/calendar_status/calendar_status_cubit.dart';
import '../presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart';
import '../presentation/cubits/portal/portail_emse_status/portail_emse_status_cubit.dart';
import '../presentation/cubits/portal/portal_cubit.dart';
import '../presentation/cubits/portal/portal_login/portal_login_cubit.dart';
import '../presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart';
import '../presentation/cubits/reporting/diagnosis/diagnosis_cubit.dart';
import '../presentation/cubits/reporting/report/report_cubit.dart';
import '../presentation/cubits/reporting/report_status/report_status_cubit.dart';
import '../presentation/cubits/reporting/zabbix_hosts/zabbix_hosts_cubit.dart';
import 'injection_container.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final gh = GetItHelper(g, environment);
  final externalsModule = _$ExternalsModule();
  gh.lazySingleton<Client>(() => externalsModule.httpClient);
  gh.lazySingleton<Connectivity>(() => externalsModule.connectivity);
  gh.lazySingleton<CookieManager>(() => CookieManager());
  gh.lazySingleton<DateTimeManager>(() => DateTimeManagerImpl());
  gh.factory<Diagnosis>(() => Diagnosis());
  gh.lazySingleton<FileManager>(() => FileManager());
  gh.lazySingleton<FlutterLocalNotificationsPlugin>(
      () => externalsModule.flutterLocalNotificationsPlugin);
  gh.lazySingleton<FlutterSecureStorage>(() => externalsModule.storage);
  gh.lazySingleton<GithubLocalDataSource>(
      () => GithubLocalDataSourceImpl(fileManager: g<FileManager>()));
  gh.lazySingleton<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(client: g<Client>()));
  gh.lazySingleton<ICalendarLocalDataSource>(
      () => ICalendarLocalDataSourceImpl(fileManager: g<FileManager>()));
  gh.lazySingleton<ICalendarRemoteDataSource>(
      () => ICalendarRemoteDataSourceImpl(client: g<Client>()));
  gh.lazySingleton<InternetAddressManager>(() => InternetAddressManagerImpl());
  gh.lazySingleton<NTLMClient>(() => externalsModule.ntlmClient);
  gh.lazySingleton<NetworkInfo>(() => NetworkInfoImpl(g<Connectivity>()));
  gh.lazySingleton<NotificationDetails>(
      () => externalsModule.notificationDetails);
  gh.lazySingleton<PortailEMSERemoteDataSource>(() =>
      PortailEMSERemoteDataSourceImpl(
          client: g<Client>(), cookieManager: g<CookieManager>()));
  gh.factory<PortailEmseStatusCubit>(
      () => PortailEmseStatusCubit(g<PortailEMSERemoteDataSource>()));
  gh.lazySingleton<ProcessManager>(() => ProcessManagerImpl());
  gh.lazySingleton<ReleasesRepository>(() => ReleasesRepositoryImpl(
        localDataSource: g<GithubLocalDataSource>(),
        remoteDataSource: g<GithubRemoteDataSource>(),
        networkInfo: g<NetworkInfo>(),
      ));
  gh.factory<ReportStatusCubit>(() => ReportStatusCubit());
  final sharedPreferences = await externalsModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<SlackRemoteDataSource>(() => SlackRemoteDataSourceImpl(
      client: g<Client>(), dateTimeManager: g<DateTimeManager>()));
  gh.lazySingleton<StormshieldRemoteDataSource>(
      () => StormshieldRemoteDataSourceImpl(client: g<Client>()));
  gh.factory<StormshieldStatusCubit>(
      () => StormshieldStatusCubit(g<StormshieldRemoteDataSource>()));
  gh.factory<StringBuffer>(() => externalsModule.stringBuffer);
  gh.lazySingleton<TwitterLocalDataSource>(
      () => TwitterLocalDataSourceImpl(fileManager: g<FileManager>()));
  gh.lazySingleton<TwitterRemoteDataSource>(() => TwitterRemoteDataSourceImpl(
      client: g<Client>(), tokenBuffer: g<StringBuffer>()));
  gh.lazySingleton<ZabbixRemoteDataSource>(
      () => ZabbixRemoteDataSourceImpl(clientNoCheck: g<Client>()));
  gh.lazySingleton<CalendarURLLocalDataSource>(
      () => CalendarURLLocalDataSourceImpl(prefs: g<SharedPreferences>()));
  gh.lazySingleton<CalendarURLRemoteDataSource>(
      () => CalendarURLRemoteDataSourceImpl(client: g<Client>()));
  gh.lazySingleton<CalendarURLRepository>(() => CalendarURLRepositoryImpl(
        localDataSource: g<CalendarURLLocalDataSource>(),
        remoteDataSource: g<CalendarURLRemoteDataSource>(),
        networkInfo: g<NetworkInfo>(),
      ));
  gh.lazySingleton<DiagnosisDataSource>(() => DiagnosisDataSourceImpl(
        diagnosis: g<Diagnosis>(),
        processManager: g<ProcessManager>(),
        connectivity: g<Connectivity>(),
        internetAddressManager: g<InternetAddressManager>(),
        stormshieldRemoteDataSource: g<StormshieldRemoteDataSource>(),
      ));
  gh.lazySingleton<DiagnosisRepository>(() => DiagnosisRepositoryImpl(
      diagnosisDataSource: g<DiagnosisDataSource>(),
      networkInfo: g<NetworkInfo>()));
  gh.factory<GithubReleasesCubit>(
      () => GithubReleasesCubit(repository: g<ReleasesRepository>()));
  gh.lazySingleton<ICalendarRepository>(() => ICalendarRepositoryImpl(
        localDataSource: g<ICalendarLocalDataSource>(),
        remoteDataSource: g<ICalendarRemoteDataSource>(),
        calendarURLRepository: g<CalendarURLRepository>(),
        networkInfo: g<NetworkInfo>(),
      ));
  gh.lazySingleton<ImprimanteRemoteDataSource>(() =>
      ImprimanteRemoteDataSourceImpl(
          ntlmClient: g<NTLMClient>(), cookieManager: g<CookieManager>()));
  gh.factory<ImprimanteStatusCubit>(
      () => ImprimanteStatusCubit(g<ImprimanteRemoteDataSource>()));
  gh.lazySingleton<LoginSettingsDataSource>(() => LoginSettingsDataSourceImpl(
      prefs: g<SharedPreferences>(), storage: g<FlutterSecureStorage>()));
  gh.lazySingleton<LoginSettingsRepository>(() => LoginSettingsRepositoryImpl(
      localDataSource: g<LoginSettingsDataSource>()));
  gh.lazySingleton<NotificationSettingsDataSource>(
      () => NotificationSettingsDataSourceImpl(prefs: g<SharedPreferences>()));
  gh.lazySingleton<NotificationSettingsRepository>(() =>
      NotificationSettingsRepositoryImpl(
          localDataSource: g<NotificationSettingsDataSource>()));
  gh.factory<PortalCubit>(
      () => PortalCubit(loginSetingsRepository: g<LoginSettingsRepository>()));
  gh.factory<PortalLoginCubit>(() => PortalLoginCubit(
        stormshieldRemoteDataSource: g<StormshieldRemoteDataSource>(),
        iCalendarRepository: g<ICalendarRepository>(),
        imprimanteRemoteDataSource: g<ImprimanteRemoteDataSource>(),
        portailEMSERemoteDataSource: g<PortailEMSERemoteDataSource>(),
      ));
  gh.lazySingleton<PostRepository>(() => PostRepositoryImpl(
        localDataSource: g<TwitterLocalDataSource>(),
        remoteDataSource: g<TwitterRemoteDataSource>(),
        networkInfo: g<NetworkInfo>(),
      ));
  gh.factory<ReportCubit>(
      () => ReportCubit(slackRemoteDataSource: g<SlackRemoteDataSource>()));
  gh.factory<TwitterFeedCubit>(
      () => TwitterFeedCubit(repository: g<PostRepository>()));
  gh.lazySingleton<ZabbixHostsRepository>(() =>
      ZabbixHostsRepositoryImpl(remoteDataSource: g<ZabbixRemoteDataSource>()));
  gh.factory<AgendaCubit>(() => AgendaCubit(
        flutterLocalNotificationsPlugin: g<FlutterLocalNotificationsPlugin>(),
        notificationDetails: g<NotificationDetails>(),
        iCalendarRepository: g<ICalendarRepository>(),
      ));
  gh.factory<CalendarStatusCubit>(
      () => CalendarStatusCubit(g<CalendarURLRepository>()));
  gh.factory<DiagnosisCubit>(
      () => DiagnosisCubit(diagnosisRepository: g<DiagnosisRepository>()));
  gh.factory<NotificationSettingsCubit>(() => NotificationSettingsCubit(
      repository: g<NotificationSettingsRepository>()));
  gh.factory<ZabbixHostsCubit>(
      () => ZabbixHostsCubit(repository: g<ZabbixHostsRepository>()));
}

class _$ExternalsModule extends ExternalsModule {}
