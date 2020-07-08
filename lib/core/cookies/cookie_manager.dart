import 'dart:io';

import 'package:injectable/injectable.dart';

@lazySingleton
class CookieManager {
  final List<Cookie> imprimanteCookies = <Cookie>[];
  final List<Cookie> portailCookies = <Cookie>[];
}
