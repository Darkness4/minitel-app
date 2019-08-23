import 'app_constants.dart';

class LoginConstants {
  /// Choose between these url to log in through the gateway
  static const List<String> urlRootList = <String>[
    MyIPAdresses.gatewayIP,
    MyIPAdresses.stormshield,
    MyIPAdresses.stormshieldIP,
  ];

  /// Stormshield time limit
  static const Map<String, int> timeMap = <String, int>{
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
