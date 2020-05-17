part of 'injection_container.dart';

Future<void> injectExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  final customClient = HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  const FlutterSecureStorage storage = FlutterSecureStorage();
  sl.registerLazySingleton<FlutterSecureStorage>(() => storage);
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<HttpClient>(() => customClient);
  sl.registerLazySingleton<NTLMClient>(() => NTLMClient(
        username: "",
        password: "",
      ));
  sl.registerLazySingleton<io_client.IOClient>(
      () => io_client.IOClient(customClient));
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  const _androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'minitel_channel',
    'Minitel Channel',
    'Notification channel for the Minitel App',
    importance: Importance.Max,
    priority: Priority.High,
    enableVibration: true,
  );
  const _iOSPlatformChannelSpecifics = IOSNotificationDetails();

  sl.registerLazySingleton<FlutterLocalNotificationsPlugin>(
      () => FlutterLocalNotificationsPlugin());
  sl.registerLazySingleton<NotificationDetails>(() => const NotificationDetails(
        _androidPlatformChannelSpecifics,
        _iOSPlatformChannelSpecifics,
      ));
}
