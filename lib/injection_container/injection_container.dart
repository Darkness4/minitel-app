import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as io_client;
import 'package:minitel_toolbox/core/constants/cache_keys.dart';
import 'package:minitel_toolbox/core/constants/datetime/datetime_manager.dart';
import 'package:minitel_toolbox/core/internet_address/internet_address_manager.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/core/process/process_manager.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis/diagnosis_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github/github_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github/github_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/settings/login_settings_data_source.dart';
import 'package:minitel_toolbox/data/datasources/settings/notification_settings_data_source.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/zabbix/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/calendar_url_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/diagnosis_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/icalendar_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/login_settings_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/notification_settings_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/post_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/releases_repository_impl.dart';
import 'package:minitel_toolbox/data/repositories/zabbix_hosts_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:minitel_toolbox/domain/repositories/login_settings_repository.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';
import 'package:minitel_toolbox/domain/repositories/post_repository.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';
import 'package:minitel_toolbox/presentation/blocs/agenda/agenda_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/diagnosis/diagnosis_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/github_releases/github_releases_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/notification_settings/notification_settings_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portal_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_login/portal_login_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_status/portal_status_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/report/report_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/report_status/report_status_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/twitter_feed/twitter_feed_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/zabbix_hosts/zabbix_hosts_bloc.dart';
import 'package:ntlm/ntlm.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';

part 'inject_bloc.dart';
part 'inject_core.dart';
part 'inject_data_source.dart';
part 'inject_external.dart';
part 'inject_repository.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! External
  await injectExternal();

  //! Core
  injectCore();

  // Data sources
  await injectDataSource();

  // Repository
  injectRepository();

  // Bloc
  injectBloc();
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData get theme => _themeData;

  set theme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
