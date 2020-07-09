import 'dart:io';

import 'package:alt_http/alt_http.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as io_client;
import 'package:injectable/injectable.dart';
import 'package:ntlm/ntlm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection_container.iconfig.dart';

final GetIt sl = GetIt.instance;

@injectableInit
Future<void> init() async => $initGetIt(sl);

@module
abstract class ExternalsModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();

  @lazySingleton
  http.Client get httpClient => io_client.IOClient(AltHttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true));

  @lazySingleton
  NotificationDetails get notificationDetails => const NotificationDetails(
        AndroidNotificationDetails(
          'minitel_channel',
          'Minitel Channel',
          'Notification channel for the Minitel App',
          importance: Importance.Max,
          priority: Priority.High,
        ),
        IOSNotificationDetails(),
      );

  @lazySingleton
  NTLMClient get ntlmClient => NTLMClient(username: '', password: '');

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  StringBuffer get stringBuffer => StringBuffer();
}
