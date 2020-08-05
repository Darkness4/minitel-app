// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ntlm/ntlm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/cubits/agenda/agenda_cubit.dart';
import '../presentation/cubits/portal/calendar_status/calendar_status_cubit.dart';
import '../data/datasources/calendar_url/calendar_url_local_data_source.dart';
import '../data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import '../domain/repositories/calendar_url_repository.dart';
import '../data/repositories/calendar_url_repository_impl.dart';
import '../core/cookies/cookie_manager.dart';
import '../core/datetime/datetime_manager.dart';
import '../domain/entities/diagnosis.dart';
import '../presentation/cubits/reporting/diagnosis/diagnosis_cubit.dart';
import '../data/datasources/diagnosis/diagnosis_data_source.dart';
import '../domain/repositories/diagnosis_repository.dart';
import '../data/repositories/diagnosis_repository_impl.dart';
import 'injection_container.dart';
import '../core/files/file_manager.dart';
import '../data/datasources/github/github_local_data_source.dart';
import '../presentation/cubits/news/github_releases/github_releases_cubit.dart';
import '../data/datasources/github/github_remote_data_source.dart';
import '../data/datasources/emse/icalendar_local_data_source.dart';
import '../data/datasources/emse/icalendar_remote_data_source.dart';
import '../domain/repositories/icalendar_repository.dart';
import '../data/repositories/icalendar_repository_impl.dart';
import '../data/datasources/emse/imprimante_remote_data_source.dart';
import '../presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart';
import '../core/internet_address/internet_address_manager.dart';
import '../data/datasources/settings/login_settings_data_source.dart';
import '../domain/repositories/login_settings_repository.dart';
import '../data/repositories/login_settings_repository_impl.dart';
import '../core/network/network_info.dart';
import '../presentation/cubits/news/notification_settings/notification_settings_cubit.dart';
import '../data/datasources/settings/notification_settings_data_source.dart';
import '../domain/repositories/notification_settings_repository.dart';
import '../data/repositories/notification_settings_repository_impl.dart';
import '../data/datasources/emse/portail_emse_remote_data_source.dart';
import '../presentation/cubits/portal/portail_emse_status/portail_emse_status_cubit.dart';
import '../presentation/cubits/portal/portal_cubit.dart';
import '../presentation/cubits/portal/portal_login/portal_login_cubit.dart';
import '../domain/repositories/post_repository.dart';
import '../data/repositories/post_repository_impl.dart';
import '../core/process/process_manager.dart';
import '../domain/repositories/releases_repository.dart';
import '../data/repositories/releases_repository_impl.dart';
import '../presentation/cubits/reporting/report/report_cubit.dart';
import '../presentation/cubits/reporting/report_status/report_status_cubit.dart';
import '../data/datasources/slack/slack_remote_data_source.dart';
import '../data/datasources/emse/stormshield_remote_data_source.dart';
import '../presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart';
import '../presentation/cubits/news/twitter_feed/twitter_feed_cubit.dart';
import '../data/datasources/twitter/twitter_local_data_source.dart';
import '../data/datasources/twitter/twitter_remote_data_source.dart';
import '../presentation/cubits/reporting/zabbix_hosts/zabbix_hosts_cubit.dart';
import '../domain/repositories/zabbix_hosts_repository.dart';
import '../data/repositories/zabbix_hosts_repository_impl.dart';
import '../data/datasources/zabbix/zabbix_remote_data_source.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
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
      () => GithubLocalDataSourceImpl(fileManager: get<FileManager>()));
  gh.lazySingleton<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(client: get<Client>()));
  gh.lazySingleton<ICalendarLocalDataSource>(
      () => ICalendarLocalDataSourceImpl(fileManager: get<FileManager>()));
  gh.lazySingleton<ICalendarRemoteDataSource>(
      () => ICalendarRemoteDataSourceImpl(client: get<Client>()));
  gh.lazySingleton<InternetAddressManager>(() => InternetAddressManagerImpl());
  gh.lazySingleton<NTLMClient>(() => externalsModule.ntlmClient);
  gh.lazySingleton<NetworkInfo>(() => NetworkInfoImpl(get<Connectivity>()));
  gh.lazySingleton<NotificationDetails>(
      () => externalsModule.notificationDetails);
  gh.lazySingleton<PortailEMSERemoteDataSource>(() =>
      PortailEMSERemoteDataSourceImpl(
          client: get<Client>(), cookieManager: get<CookieManager>()));
  gh.factory<PortailEmseStatusCubit>(
      () => PortailEmseStatusCubit(get<PortailEMSERemoteDataSource>()));
  gh.lazySingleton<ProcessManager>(() => ProcessManagerImpl());
  gh.lazySingleton<ReleasesRepository>(() => ReleasesRepositoryImpl(
        localDataSource: get<GithubLocalDataSource>(),
        remoteDataSource: get<GithubRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
      ));
  gh.factory<ReportStatusCubit>(() => ReportStatusCubit());
  final sharedPreferences = await externalsModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<SlackRemoteDataSource>(() => SlackRemoteDataSourceImpl(
      client: get<Client>(), dateTimeManager: get<DateTimeManager>()));
  gh.lazySingleton<StormshieldRemoteDataSource>(
      () => StormshieldRemoteDataSourceImpl(client: get<Client>()));
  gh.factory<StormshieldStatusCubit>(
      () => StormshieldStatusCubit(get<StormshieldRemoteDataSource>()));
  gh.factory<StringBuffer>(() => externalsModule.stringBuffer);
  gh.lazySingleton<TwitterLocalDataSource>(
      () => TwitterLocalDataSourceImpl(fileManager: get<FileManager>()));
  gh.lazySingleton<TwitterRemoteDataSource>(() => TwitterRemoteDataSourceImpl(
      client: get<Client>(), tokenBuffer: get<StringBuffer>()));
  gh.lazySingleton<ZabbixRemoteDataSource>(
      () => ZabbixRemoteDataSourceImpl(clientNoCheck: get<Client>()));
  gh.lazySingleton<CalendarURLLocalDataSource>(
      () => CalendarURLLocalDataSourceImpl(prefs: get<SharedPreferences>()));
  gh.lazySingleton<CalendarURLRemoteDataSource>(
      () => CalendarURLRemoteDataSourceImpl(client: get<Client>()));
  gh.lazySingleton<CalendarURLRepository>(() => CalendarURLRepositoryImpl(
        localDataSource: get<CalendarURLLocalDataSource>(),
        remoteDataSource: get<CalendarURLRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
      ));
  gh.lazySingleton<DiagnosisDataSource>(() => DiagnosisDataSourceImpl(
        diagnosis: get<Diagnosis>(),
        processManager: get<ProcessManager>(),
        connectivity: get<Connectivity>(),
        internetAddressManager: get<InternetAddressManager>(),
        stormshieldRemoteDataSource: get<StormshieldRemoteDataSource>(),
      ));
  gh.lazySingleton<DiagnosisRepository>(() => DiagnosisRepositoryImpl(
      diagnosisDataSource: get<DiagnosisDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<GithubReleasesCubit>(
      () => GithubReleasesCubit(repository: get<ReleasesRepository>()));
  gh.lazySingleton<ICalendarRepository>(() => ICalendarRepositoryImpl(
        localDataSource: get<ICalendarLocalDataSource>(),
        remoteDataSource: get<ICalendarRemoteDataSource>(),
        calendarURLRepository: get<CalendarURLRepository>(),
        networkInfo: get<NetworkInfo>(),
      ));
  gh.lazySingleton<ImprimanteRemoteDataSource>(() =>
      ImprimanteRemoteDataSourceImpl(
          ntlmClient: get<NTLMClient>(), cookieManager: get<CookieManager>()));
  gh.factory<ImprimanteStatusCubit>(
      () => ImprimanteStatusCubit(get<ImprimanteRemoteDataSource>()));
  gh.lazySingleton<LoginSettingsDataSource>(() => LoginSettingsDataSourceImpl(
      prefs: get<SharedPreferences>(), storage: get<FlutterSecureStorage>()));
  gh.lazySingleton<LoginSettingsRepository>(() => LoginSettingsRepositoryImpl(
      localDataSource: get<LoginSettingsDataSource>()));
  gh.lazySingleton<NotificationSettingsDataSource>(() =>
      NotificationSettingsDataSourceImpl(prefs: get<SharedPreferences>()));
  gh.lazySingleton<NotificationSettingsRepository>(() =>
      NotificationSettingsRepositoryImpl(
          localDataSource: get<NotificationSettingsDataSource>()));
  gh.factory<PortalCubit>(() =>
      PortalCubit(loginSetingsRepository: get<LoginSettingsRepository>()));
  gh.factory<PortalLoginCubit>(() => PortalLoginCubit(
        stormshieldRemoteDataSource: get<StormshieldRemoteDataSource>(),
        iCalendarRepository: get<ICalendarRepository>(),
        imprimanteRemoteDataSource: get<ImprimanteRemoteDataSource>(),
        portailEMSERemoteDataSource: get<PortailEMSERemoteDataSource>(),
      ));
  gh.lazySingleton<PostRepository>(() => PostRepositoryImpl(
        localDataSource: get<TwitterLocalDataSource>(),
        remoteDataSource: get<TwitterRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
      ));
  gh.factory<ReportCubit>(
      () => ReportCubit(slackRemoteDataSource: get<SlackRemoteDataSource>()));
  gh.factory<TwitterFeedCubit>(
      () => TwitterFeedCubit(repository: get<PostRepository>()));
  gh.lazySingleton<ZabbixHostsRepository>(() => ZabbixHostsRepositoryImpl(
      remoteDataSource: get<ZabbixRemoteDataSource>()));
  gh.factory<AgendaCubit>(() => AgendaCubit(
        flutterLocalNotificationsPlugin: get<FlutterLocalNotificationsPlugin>(),
        notificationDetails: get<NotificationDetails>(),
        iCalendarRepository: get<ICalendarRepository>(),
      ));
  gh.factory<CalendarStatusCubit>(
      () => CalendarStatusCubit(get<CalendarURLRepository>()));
  gh.factory<DiagnosisCubit>(
      () => DiagnosisCubit(diagnosisRepository: get<DiagnosisRepository>()));
  gh.factory<NotificationSettingsCubit>(() => NotificationSettingsCubit(
      repository: get<NotificationSettingsRepository>()));
  gh.factory<ZabbixHostsCubit>(
      () => ZabbixHostsCubit(repository: get<ZabbixHostsRepository>()));
  return get;
}

class _$ExternalsModule extends ExternalsModule {}
