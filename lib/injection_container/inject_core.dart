part of 'injection_container.dart';

void injectCore() {
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl<Connectivity>()),
  );
  sl.registerLazySingleton<InternetAddressManager>(
    () => const InternetAddressManagerImpl(),
  );
  sl.registerLazySingleton<ProcessManager>(
    () => const ProcessManagerImpl(),
  );
  sl.registerLazySingleton<DateTimeManager>(
    () => const DateTimeManagerImpl(),
  );
}
