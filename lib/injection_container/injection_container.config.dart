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
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../core/cookies/cookie_manager.dart' as _i5;
import '../core/datetime/datetime_manager.dart' as _i6;
import '../core/files/file_manager.dart' as _i8;
import '../core/internet_address/internet_address_manager.dart' as _i15;
import '../core/network/network_info.dart' as _i17;
import '../core/process/process_manager.dart' as _i19;
import '../data/database/diagnosis.dart' as _i7;
import '../data/datasources/calendar_url/calendar_url_local_data_source.dart'
    as _i29;
import '../data/datasources/calendar_url/calendar_url_remote_data_source.dart'
    as _i30;
import '../data/datasources/diagnosis/diagnosis_data_source.dart' as _i33;
import '../data/datasources/emse/icalendar_local_data_source.dart' as _i13;
import '../data/datasources/emse/icalendar_remote_data_source.dart' as _i14;
import '../data/datasources/emse/imprimante_remote_data_source.dart' as _i41;
import '../data/datasources/emse/portail_emse_remote_data_source.dart' as _i18;
import '../data/datasources/emse/stormshield_remote_data_source.dart' as _i25;
import '../data/datasources/github/github_local_data_source.dart' as _i11;
import '../data/datasources/github/github_remote_data_source.dart' as _i12;
import '../data/datasources/settings/login_settings_data_source.dart' as _i42;
import '../data/datasources/settings/notification_settings_data_source.dart'
    as _i48;
import '../data/datasources/slack/slack_remote_data_source.dart' as _i24;
import '../data/datasources/twitter/twitter_local_data_source.dart' as _i26;
import '../data/datasources/twitter/twitter_remote_data_source.dart' as _i27;
import '../data/datasources/zabbix/zabbix_remote_data_source.dart' as _i28;
import '../data/repositories/calendar_url_repository_impl.dart' as _i32;
import '../data/repositories/diagnosis_repository_impl.dart' as _i35;
import '../data/repositories/icalendar_repository_impl.dart' as _i40;
import '../data/repositories/login_settings_repository_impl.dart' as _i44;
import '../data/repositories/notification_settings_repository_impl.dart'
    as _i50;
import '../data/repositories/post_repository_impl.dart' as _i55;
import '../data/repositories/releases_repository_impl.dart' as _i21;
import '../data/repositories/zabbix_hosts_repository_impl.dart' as _i60;
import '../domain/repositories/calendar_url_repository.dart' as _i31;
import '../domain/repositories/diagnosis_repository.dart' as _i34;
import '../domain/repositories/icalendar_repository.dart' as _i39;
import '../domain/repositories/login_settings_repository.dart' as _i43;
import '../domain/repositories/notification_settings_repository.dart' as _i49;
import '../domain/repositories/post_repository.dart' as _i54;
import '../domain/repositories/releases_repository.dart' as _i20;
import '../domain/repositories/zabbix_hosts_repository.dart' as _i59;
import '../domain/usecases/fetch_portail_emse_cookies.dart' as _i36;
import '../domain/usecases/fetch_printer_cookies.dart' as _i65;
import '../domain/usecases/fetch_stormshield_status.dart' as _i37;
import '../domain/usecases/login_to_portail_emse.dart' as _i45;
import '../domain/usecases/login_to_printer.dart' as _i46;
import '../domain/usecases/login_to_stormshield.dart' as _i47;
import '../domain/usecases/report_to_slack.dart' as _i56;
import '../presentation/cubits/agenda/agenda_cubit.dart' as _i61;
import '../presentation/cubits/news/github_releases/github_releases_cubit.dart'
    as _i38;
import '../presentation/cubits/news/notification_settings/notification_settings_cubit.dart'
    as _i62;
import '../presentation/cubits/news/twitter_feed/twitter_feed_cubit.dart'
    as _i58;
import '../presentation/cubits/portal/calendar_status/calendar_status_cubit.dart'
    as _i63;
import '../presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart'
    as _i66;
import '../presentation/cubits/portal/portail_emse_status/portail_emse_status_cubit.dart'
    as _i51;
import '../presentation/cubits/portal/portal_cubit.dart' as _i52;
import '../presentation/cubits/portal/portal_login/portal_login_cubit.dart'
    as _i53;
import '../presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart'
    as _i57;
import '../presentation/cubits/reporting/diagnosis/diagnosis_cubit.dart'
    as _i64;
import '../presentation/cubits/reporting/report/report_cubit.dart' as _i67;
import '../presentation/cubits/reporting/report_status/report_status_cubit.dart'
    as _i22;
import '../presentation/cubits/reporting/zabbix_hosts/zabbix_hosts_cubit.dart'
    as _i68;
import 'injection_container.dart'
    as _i69; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i19.ProcessManager>(() => _i19.ProcessManagerImpl());
  gh.lazySingleton<_i20.ReleasesRepository>(() => _i21.ReleasesRepositoryImpl(
      localDataSource: get<_i11.GithubLocalDataSource>(),
      remoteDataSource: get<_i12.GithubRemoteDataSource>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.factory<_i22.ReportStatusCubit>(() => _i22.ReportStatusCubit());
  await gh.factoryAsync<_i23.SharedPreferences>(() => externalsModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i24.SlackRemoteDataSource>(() =>
      _i24.SlackRemoteDataSourceImpl(
          client: get<_i3.Client>(),
          dateTimeManager: get<_i6.DateTimeManager>()));
  gh.lazySingleton<_i25.StormshieldRemoteDataSource>(
      () => _i25.StormshieldRemoteDataSourceImpl(client: get<_i3.Client>()));
  gh.factory<StringBuffer>(() => externalsModule.stringBuffer);
  gh.lazySingleton<_i26.TwitterLocalDataSource>(() =>
      _i26.TwitterLocalDataSourceImpl(fileManager: get<_i8.FileManager>()));
  gh.lazySingleton<_i27.TwitterRemoteDataSource>(() =>
      _i27.TwitterRemoteDataSourceImpl(
          client: get<_i3.Client>(), tokenBuffer: get<StringBuffer>()));
  gh.lazySingleton<_i28.ZabbixRemoteDataSource>(
      () => _i28.ZabbixRemoteDataSourceImpl(clientNoCheck: get<_i3.Client>()));
  gh.lazySingleton<_i29.CalendarURLLocalDataSource>(() =>
      _i29.CalendarURLLocalDataSourceImpl(
          prefs: get<_i23.SharedPreferences>()));
  gh.lazySingleton<_i30.CalendarURLRemoteDataSource>(
      () => _i30.CalendarURLRemoteDataSourceImpl(client: get<_i3.Client>()));
  gh.lazySingleton<_i31.CalendarURLRepository>(() =>
      _i32.CalendarURLRepositoryImpl(
          localDataSource: get<_i29.CalendarURLLocalDataSource>(),
          remoteDataSource: get<_i30.CalendarURLRemoteDataSource>(),
          networkInfo: get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i33.DiagnosisDataSource>(() => _i33.DiagnosisDataSourceImpl(
      diagnosis: get<_i7.Diagnosis>(),
      processManager: get<_i19.ProcessManager>(),
      internetAddressManager: get<_i15.InternetAddressManager>(),
      stormshieldRemoteDataSource: get<_i25.StormshieldRemoteDataSource>()));
  gh.lazySingleton<_i34.DiagnosisRepository>(() => _i35.DiagnosisRepositoryImpl(
      diagnosisDataSource: get<_i33.DiagnosisDataSource>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.factory<_i36.FetchPortailEmseCookies>(() =>
      _i36.FetchPortailEmseCookies(get<_i18.PortailEMSERemoteDataSource>()));
  gh.factory<_i37.FetchStormshieldStatus>(() =>
      _i37.FetchStormshieldStatus(get<_i25.StormshieldRemoteDataSource>()));
  gh.factory<_i38.GithubReleasesCubit>(() =>
      _i38.GithubReleasesCubit(repository: get<_i20.ReleasesRepository>()));
  gh.lazySingleton<_i39.ICalendarRepository>(() => _i40.ICalendarRepositoryImpl(
      localDataSource: get<_i13.ICalendarLocalDataSource>(),
      remoteDataSource: get<_i14.ICalendarRemoteDataSource>(),
      calendarURLRepository: get<_i31.CalendarURLRepository>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i41.ImprimanteRemoteDataSource>(() =>
      _i41.ImprimanteRemoteDataSourceImpl(
          ntlmClient: get<_i16.NTLMClient>(),
          cookieManager: get<_i5.CookieManager>()));
  gh.lazySingleton<_i42.LoginSettingsDataSource>(() =>
      _i42.LoginSettingsDataSourceImpl(
          prefs: get<_i23.SharedPreferences>(),
          storage: get<_i10.FlutterSecureStorage>()));
  gh.lazySingleton<_i43.LoginSettingsRepository>(() =>
      _i44.LoginSettingsRepositoryImpl(
          localDataSource: get<_i42.LoginSettingsDataSource>()));
  gh.factory<_i45.LoginToPortailEmse>(
      () => _i45.LoginToPortailEmse(get<_i18.PortailEMSERemoteDataSource>()));
  gh.factory<_i46.LoginToPrinter>(
      () => _i46.LoginToPrinter(get<_i41.ImprimanteRemoteDataSource>()));
  gh.factory<_i47.LoginToStormshield>(
      () => _i47.LoginToStormshield(get<_i25.StormshieldRemoteDataSource>()));
  gh.lazySingleton<_i48.NotificationSettingsDataSource>(() =>
      _i48.NotificationSettingsDataSourceImpl(
          prefs: get<_i23.SharedPreferences>()));
  gh.lazySingleton<_i49.NotificationSettingsRepository>(() =>
      _i50.NotificationSettingsRepositoryImpl(
          localDataSource: get<_i48.NotificationSettingsDataSource>()));
  gh.factory<_i51.PortailEmseStatusCubit>(
      () => _i51.PortailEmseStatusCubit(get<_i36.FetchPortailEmseCookies>()));
  gh.factory<_i52.PortalCubit>(() => _i52.PortalCubit(
      loginSetingsRepository: get<_i43.LoginSettingsRepository>()));
  gh.factory<_i53.PortalLoginCubit>(() => _i53.PortalLoginCubit(
      loginToStormshield: get<_i47.LoginToStormshield>(),
      iCalendarRepository: get<_i39.ICalendarRepository>(),
      loginToPrinter: get<_i46.LoginToPrinter>(),
      loginToPortailEmse: get<_i45.LoginToPortailEmse>()));
  gh.lazySingleton<_i54.PostRepository>(() => _i55.PostRepositoryImpl(
      localDataSource: get<_i26.TwitterLocalDataSource>(),
      remoteDataSource: get<_i27.TwitterRemoteDataSource>(),
      networkInfo: get<_i17.NetworkInfo>()));
  gh.factory<_i56.ReportToSlack>(
      () => _i56.ReportToSlack(get<_i24.SlackRemoteDataSource>()));
  gh.factory<_i57.StormshieldStatusCubit>(
      () => _i57.StormshieldStatusCubit(get<_i37.FetchStormshieldStatus>()));
  gh.factory<_i58.TwitterFeedCubit>(
      () => _i58.TwitterFeedCubit(repository: get<_i54.PostRepository>()));
  gh.lazySingleton<_i59.ZabbixHostsRepository>(() =>
      _i60.ZabbixHostsRepositoryImpl(
          remoteDataSource: get<_i28.ZabbixRemoteDataSource>()));
  gh.factoryParam<_i61.AgendaCubit, _i62.NotificationSettingsCubit?, dynamic>(
      (notificationSettingsCubit, _) => _i61.AgendaCubit(
          flutterLocalNotificationsPlugin:
              get<_i9.FlutterLocalNotificationsPlugin>(),
          notificationDetails: get<_i9.NotificationDetails>(),
          iCalendarRepository: get<_i39.ICalendarRepository>(),
          notificationSettingsCubit: notificationSettingsCubit));
  gh.factory<_i63.CalendarStatusCubit>(
      () => _i63.CalendarStatusCubit(get<_i31.CalendarURLRepository>()));
  gh.factory<_i64.DiagnosisCubit>(() => _i64.DiagnosisCubit(
      diagnosisRepository: get<_i34.DiagnosisRepository>()));
  gh.factory<_i65.FetchPrinterCookies>(
      () => _i65.FetchPrinterCookies(get<_i41.ImprimanteRemoteDataSource>()));
  gh.factory<_i66.ImprimanteStatusCubit>(
      () => _i66.ImprimanteStatusCubit(get<_i65.FetchPrinterCookies>()));
  gh.factory<_i62.NotificationSettingsCubit>(() =>
      _i62.NotificationSettingsCubit(
          repository: get<_i49.NotificationSettingsRepository>()));
  gh.factory<_i67.ReportCubit>(
      () => _i67.ReportCubit(report: get<_i56.ReportToSlack>()));
  gh.factory<_i68.ZabbixHostsCubit>(() =>
      _i68.ZabbixHostsCubit(repository: get<_i59.ZabbixHostsRepository>()));
  return get;
}

class _$ExternalsModule extends _i69.ExternalsModule {}
