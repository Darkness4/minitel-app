import 'app_constants.dart';

class LoginConstants {
  static const List<String> urlRootList = [
    MyIPAdresses.gatewayIP,
    MyIPAdresses.stormshield,
    MyIPAdresses.stormshieldIP,
  ];
  static const Map<String, int> timeMap = {
    '15 minutes': 15,
    '30 minutes': 30,
    '45 minutes': 45,
    '1 hour': 60,
    '2 hours': 120,
    '3 hours': 180,
    '4 hours': 240,
    '(8 hours)': 480,
  };
}
