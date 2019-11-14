part of 'injection_container.dart';

Future<void> injectExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getBool('dark') ?? false) {
    sl.registerFactory<ThemeState>(
      () => const ThemeDark(),
    );
  } else {
    sl.registerLazySingleton<ThemeState>(
      () => const ThemeLight(),
    );
  }
  final customClient = HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  const FlutterSecureStorage storage = FlutterSecureStorage();
  sl.registerLazySingleton<FlutterSecureStorage>(() => storage);
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<HttpClient>(() => customClient);
  sl.registerLazySingleton<NTLMClient>(() => NTLMClient(
        username: "",
        password: "",
      ));
  sl.registerLazySingleton<ioclient.IOClient>(
      () => ioclient.IOClient(customClient));
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  final _androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'minitel_channel',
    'Minitel Channel',
    'Notification channel for the Minitel App',
    importance: Importance.Max,
    priority: Priority.High,
    enableVibration: true,
  );
  final _iOSPlatformChannelSpecifics = IOSNotificationDetails();

  sl.registerLazySingleton<FlutterLocalNotificationsPlugin>(
      () => FlutterLocalNotificationsPlugin());
  sl.registerLazySingleton<NotificationDetails>(() => NotificationDetails(
        _androidPlatformChannelSpecifics,
        _iOSPlatformChannelSpecifics,
      ));
}
