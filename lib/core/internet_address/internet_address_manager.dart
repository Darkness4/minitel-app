import 'dart:io';

abstract class InternetAddressManager {
  Future<List<InternetAddress>> lookup(String target);
}

class InternetAddressManagerImpl implements InternetAddressManager {
  const InternetAddressManagerImpl();

  @override
  Future<List<InternetAddress>> lookup(String target) =>
      InternetAddress.lookup(target);
}
