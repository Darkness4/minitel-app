import 'dart:io';

import 'package:injectable/injectable.dart';

abstract class InternetAddressManager {
  Future<List<InternetAddress>> lookup(String target);
}

@LazySingleton(as: InternetAddressManager)
class InternetAddressManagerImpl implements InternetAddressManager {
  const InternetAddressManagerImpl();

  @override
  Future<List<InternetAddress>> lookup(String target) =>
      InternetAddress.lookup(target);
}
