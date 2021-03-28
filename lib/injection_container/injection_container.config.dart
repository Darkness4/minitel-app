// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i4;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ntlm/ntlm.dart' as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

import '../core/cookies/cookie_manager.dart' as _i5;
import '../core/datetime/datetime_manager.dart' as _i6;
import '../core/files/file_manager.dart' as _i8;
import '../core/internet_address/internet_address_manager.dart' as _i15;
import '../core/network/network_info.dart' as _i17;
import '../core/process/process_manager.dart' as _i20;
import '../data/database/diagnosis.dart' as _i7;
import '../data/datasources/calendar_url/calendar_url_local_data_source.dart'
    as _i31;
import '../data/datasources/calendar_url/calendar_url_remote_data_source.dart'
    as _i32;
import '../data/datasources/diagnosis/diagnosis_data_source.dart' as _i35;
import '../data/datasources/emse/icalendar_local_data_source.dart' as _i13;
import '../data/datasources/emse/icalendar_remote_data_source.dart' as _i14;
import '../data/datasources/emse/imprimante_remote_data_source.dart' as _i41;
import '../data/datasources/emse/portail_emse_remote_data_source.dart' as _i18;
import '../data/datasources/emse/stormshield_remote_data_source.dart' as _i26;
import '../data/datasources/github/github_local_data_source.dart' as _i11;
import '../data/datasources/github/github_remote_data_source.dart' as _i12;
import '../data/datasources/settings/login_settings_data_source.dart' as _i43;
import '../data/datasources/settings/notification_settings_data_source.dart'
    as _i46;
import '../data/datasources/slack/slack_remote_data_source.dart' as _i25;
import '../data/datasources/twitter/twitter_local_data_source.dart' as _i28;
import '../data/datasources/twitter/twitter_remote_data_source.dart' as _i29;
import '../data/datasources/zabbix/zabbix_remote_data_source.dart' as _i30;
import '../data/repositories/calendar_url_repository_impl.dart' as _i34;
import '../data/repositories/diagnosis_repository_impl.dart' as _i37;
import '../data/repositories/icalendar_repository_impl.dart' as _i40;
import '../data/repositories/login_settings_repository_impl.dart' as _i45;
import '../data/repositories/notification_settings_repository_impl.dart'
    as _i48;
import '../data/repositories/post_repository_impl.dart' as _i52;
import '../data/repositories/releases_repository_impl.dart' as _i22;
import '../data/repositories/zabbix_hosts_repository_impl.dart' as _i56;
import '../domain/repositories/calendar_url_repository.dart' as _i33;
import '../domain/repositories/diagnosis_repository.dart' as _i36;
import '../domain/repositories/icalendar_repository.dart' as _i39;
import '../domain/repositories/login_settings_repository.dart' as _i44;
import '../domain/repositories/notification_settings_repository.dart' as _i47;
import '../domain/repositories/post_repository.dart' as _i51;
import '../domain/repositories/releases_repository.dart' as _i21;
import '../domain/repositories/zabbix_hosts_repository.dart' as _i55;
import '../presentation/cubits/agenda/agenda_cubit.dart' as _i57;
import '../presentation/cubits/news/github_releases/github_releases_cubit.dart'
    as _i38;
import '../presentation/cubits/news/notification_settings/notification_settings_cubit.dart'
    as _i58;
import '../presentation/cubits/news/twitter_feed/twitter_feed_cubit.dart'
    as _i54;
import '../presentation/cubits/portal/calendar_status/calendar_status_cubit.dart'
    as _i59;
import '../presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart'
    as _i42;
import '../presentation/cubits/portal/portail_emse_status/portail_emse_status_cubit.dart'
    as _i19;
import '../presentation/cubits/portal/portal_cubit.dart' as _i49;
import '../presentation/cubits/portal/portal_login/portal_login_cubit.dart'
    as _i50;
import '../presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart'
    as _i27;
import '../presentation/cubits/reporting/diagnosis/diagnosis_cubit.dart'
    as _i60;
import '../presentation/cubits/reporting/report/report_cubit.dart' as _i53;
import '../presentation/cubits/reporting/report_status/report_status_cubit.dart'
    as _i23;
import '../presentation/cubits/reporting/zabbix_hosts/zabbix_hosts_cubit.dart'
    as _i61;
import 'injection_container.dart'
    as _i62; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final externalsModule = _$ExternalsModule();
  gh.lazySingleton<_i3.Client>(() => externalsModule.httpClient);
  gh.lazySingleton<_i4.Connectivity>(() => externalsModule.connectivity);
  gh.lazySingleton<_i5.CookieManager>(() => _i5.CookieManager());
  gh.lazySingleton<_i6.DateTimeManager>(() => _i6.DateTimeManagerImpl());
  gh.factory<_i7.Diagnosis>(() => _i7.Diagnosis());
  gh.lazySingleton<_i8.FileManager>(() => _i8.FileManager());
  gh.lazySingleton<_i9.FlutterLocalNotificationsPlugin>(
      () => externalsModule.flutterLocalNotificationsPlugin);
  gh.lazySingleton<_i10.FlutterSecureStorage>(() => externalsModule.storage);
  gh.lazySingleton<_i11.GithubLocalDataSource>(() =>
      _i11.GithubLocalDataSourceImpl(fileManager: get<_i8.FileManager>()));
  gh.lazySingleton<_i12.GithubRemoteDataSource>(
      () => _i12.GithubRemoteDataSourceImpl(client: get<_i3.Client>()));
  gh.lazySingleton<_i13.ICalendarLocalDataSource>(() =>
      _i13.ICalendarLocalDataSourceImpl(fileManager: get<_i8.FileManager>()));
  gh.lazySingleton<_i14.ICalendarRemoteDataSource>(
      () => _i14.ICalendarRemoteDataSourceImpl(client: get<_i3.Client>()));
  gh.lazySingleton<_i15.InternetAddressManager>(
      () => _i15.InternetAddressManagerImpl());
  gh.lazySingleton<_i16.NTLMClient>(() => externalsModule.ntlmClient);
  gh.lazySingleton<_i17.NetworkInfo>(
      () => _i17.NetworkInfoImpl(get<_i4.Connectivity>()));
  gh.lazySingleton<_i9.NotificationDetails>(
      () => externalsModule.notificationDetails);
  gh.lazySingleton<_i18.PortailEMSERemoteDataSource>(() =>
      _i18.PortailEMSERemoteDataSourceImpl(
          client: get<_i3.Client>(), cookieManager: get<_i5.CookieManager>()));
  gh.factory<_i19.PortailEmseStatusCubit>(() =>
      _i19.PortailEmseStatusCubit(get<_i18.PortailEMSERemoteDataSource>()));
  gh.lazySingleton<_i20.ProcessManager>(() => _i20.ProcessManagerImpl());
  gh.lazySingleton<_i21.ReleasesRepository>(() => _i22.ReleasesRepositoryImpl(
      localDataSource: get<_i11.GithubLocalDataSource>(),
      remoteDataSource: get<_i12.GithubRemoteDataSource>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.factory<_i23.ReportStatusCubit>(() => _i23.ReportStatusCubit());
  await gh.factoryAsync<_i24.SharedPreferences>(() => externalsModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i25.SlackRemoteDataSource>(() =>
      _i25.SlackRemoteDataSourceImpl(
          client: get<_i3.Client>(),
          dateTimeManager: get<_i6.DateTimeManager>()));
  gh.lazySingleton<_i26.StormshieldRemoteDataSource>(
      () => _i26.StormshieldRemoteDataSourceImpl(client: get<_i3.Client>()));
  gh.factory<_i27.StormshieldStatusCubit>(() =>
      _i27.StormshieldStatusCubit(get<_i26.StormshieldRemoteDataSource>()));
  gh.factory<StringBuffer>(() => externalsModule.stringBuffer);
  gh.lazySingleton<_i28.TwitterLocalDataSource>(() =>
      _i28.TwitterLocalDataSourceImpl(fileManager: get<_i8.FileManager>()));
  gh.lazySingleton<_i29.TwitterRemoteDataSource>(() =>
      _i29.TwitterRemoteDataSourceImpl(
          client: get<_i3.Client>(), tokenBuffer: get<StringBuffer>()));
  gh.lazySingleton<_i30.ZabbixRemoteDataSource>(
      () => _i30.ZabbixRemoteDataSourceImpl(clientNoCheck: get<_i3.Client>()));
  gh.lazySingleton<_i31.CalendarURLLocalDataSource>(() =>
      _i31.CalendarURLLocalDataSourceImpl(
          prefs: get<_i24.SharedPreferences>()));
  gh.lazySingleton<_i32.CalendarURLRemoteDataSource>(
      () => _i32.CalendarURLRemoteDataSourceImpl(client: get<_i3.Client>()));
  gh.lazySingleton<_i33.CalendarURLRepository>(() =>
      _i34.CalendarURLRepositoryImpl(
          localDataSource: get<_i31.CalendarURLLocalDataSource>(),
          remoteDataSource: get<_i32.CalendarURLRemoteDataSource>(),
          networkInfo: get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i35.DiagnosisDataSource>(() => _i35.DiagnosisDataSourceImpl(
      diagnosis: get<_i7.Diagnosis>(),
      processManager: get<_i20.ProcessManager>(),
      internetAddressManager: get<_i15.InternetAddressManager>(),
      stormshieldRemoteDataSource: get<_i26.StormshieldRemoteDataSource>()));
  gh.lazySingleton<_i36.DiagnosisRepository>(() => _i37.DiagnosisRepositoryImpl(
      diagnosisDataSource: get<_i35.DiagnosisDataSource>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.factory<_i38.GithubReleasesCubit>(() =>
      _i38.GithubReleasesCubit(repository: get<_i21.ReleasesRepository>()));
  gh.lazySingleton<_i39.ICalendarRepository>(() => _i40.ICalendarRepositoryImpl(
      localDataSource: get<_i13.ICalendarLocalDataSource>(),
      remoteDataSource: get<_i14.ICalendarRemoteDataSource>(),
      calendarURLRepository: get<_i33.CalendarURLRepository>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i41.ImprimanteRemoteDataSource>(() =>
      _i41.ImprimanteRemoteDataSourceImpl(
          ntlmClient: get<_i16.NTLMClient>(),
          cookieManager: get<_i5.CookieManager>()));
  gh.factory<_i42.ImprimanteStatusCubit>(
      () => _i42.ImprimanteStatusCubit(get<_i41.ImprimanteRemoteDataSource>()));
  gh.lazySingleton<_i43.LoginSettingsDataSource>(() =>
      _i43.LoginSettingsDataSourceImpl(
          prefs: get<_i24.SharedPreferences>(),
          storage: get<_i10.FlutterSecureStorage>()));
  gh.lazySingleton<_i44.LoginSettingsRepository>(() =>
      _i45.LoginSettingsRepositoryImpl(
          localDataSource: get<_i43.LoginSettingsDataSource>()));
  gh.lazySingleton<_i46.NotificationSettingsDataSource>(() =>
      _i46.NotificationSettingsDataSourceImpl(
          prefs: get<_i24.SharedPreferences>()));
  gh.lazySingleton<_i47.NotificationSettingsRepository>(() =>
      _i48.NotificationSettingsRepositoryImpl(
          localDataSource: get<_i46.NotificationSettingsDataSource>()));
  gh.factory<_i49.PortalCubit>(() => _i49.PortalCubit(
      loginSetingsRepository: get<_i44.LoginSettingsRepository>()));
  gh.factory<_i50.PortalLoginCubit>(() => _i50.PortalLoginCubit(
      stormshieldRemoteDataSource: get<_i26.StormshieldRemoteDataSource>(),
      iCalendarRepository: get<_i39.ICalendarRepository>(),
      imprimanteRemoteDataSource: get<_i41.ImprimanteRemoteDataSource>(),
      portailEMSERemoteDataSource: get<_i18.PortailEMSERemoteDataSource>()));
  gh.lazySingleton<_i51.PostRepository>(() => _i52.PostRepositoryImpl(
      localDataSource: get<_i28.TwitterLocalDataSource>(),
      remoteDataSource: get<_i29.TwitterRemoteDataSource>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.factory<_i53.ReportCubit>(() => _i53.ReportCubit(
      slackRemoteDataSource: get<_i25.SlackRemoteDataSource>()));
  gh.factory<_i54.TwitterFeedCubit>(
      () => _i54.TwitterFeedCubit(repository: get<_i51.PostRepository>()));
  gh.lazySingleton<_i55.ZabbixHostsRepository>(() =>
      _i56.ZabbixHostsRepositoryImpl(
          remoteDataSource: get<_i30.ZabbixRemoteDataSource>()));
  gh.factoryParam<_i57.AgendaCubit, _i58.NotificationSettingsCubit?, dynamic>(
      (notificationSettingsCubit, _) => _i57.AgendaCubit(
          flutterLocalNotificationsPlugin:
              get<_i9.FlutterLocalNotificationsPlugin>(),
          notificationDetails: get<_i9.NotificationDetails>(),
          iCalendarRepository: get<_i39.ICalendarRepository>(),
          notificationSettingsCubit: notificationSettingsCubit));
  gh.factory<_i59.CalendarStatusCubit>(
      () => _i59.CalendarStatusCubit(get<_i33.CalendarURLRepository>()));
  gh.factory<_i60.DiagnosisCubit>(() => _i60.DiagnosisCubit(
      diagnosisRepository: get<_i36.DiagnosisRepository>()));
  gh.factory<_i58.NotificationSettingsCubit>(() =>
      _i58.NotificationSettingsCubit(
          repository: get<_i47.NotificationSettingsRepository>()));
  gh.factory<_i61.ZabbixHostsCubit>(() =>
      _i61.ZabbixHostsCubit(repository: get<_i55.ZabbixHostsRepository>()));
  return get;
}

class _$ExternalsModule extends _i62.ExternalsModule {}
