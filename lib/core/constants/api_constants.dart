/// Api keys
///
/// After cloning from remote, add your own API keys with b64 encoding.
/// This file should NOT be tracked by any Version Control System.
/// Track this file ONLY IF new keys will be used, like the exemple below.
import 'dart:convert';

/// API keys should be placed here with b64 encoding to avoid search engine
///
/// Good script to implement in VCS CI/CD is to simply replace the exemple with
/// the actual API keys using sed, during a pipeline, (precisely at the
/// pre-build script).
///
/// Exemple:
///
/// ```sh
/// CI_WEBHOOK_KEY=${YOUR_API_KEY}
/// CI_FACEBOOK_KEY=${YOUR_API_KEY_2}
/// sed -iEn "s/_webhook = \"ZXhlbXBsZQ==\"/_webhook = \"${CI_WEBHOOK_KEY}\"/g" ./lib/core/constants/api_constants.dart
/// sed -iEn "s/_facebookApi = \"ZXhlbXBsZQ==\"/_facebookApi = \"${CI_FACEBOOK_KEY}\"/g" ./lib/core/constants/api_constants.dart
/// ```
///
/// Please, see more in the .gitlab.yml file.
///
/// Also, for secutiry reason, DO NOT ADD ANY UNIT TEST USING THIS FILE.
class ApiConstants {
  /// Slack incomming webhook endpoint
  static const String _webhook = "ZXhlbXBsZQ=="; // ZXhlbXBsZQ== = exemple

  /// Facebook api key
  static const String _facebookApi = "ZXhlbXBsZQ=="; // ZXhlbXBsZQ== = exemple

  /// Github Repo to get the releases changelog
  static const String githubRepo = "Darkness4/minitel-app";

  /// Zabbix authentication Token
  ///
  /// This is only procures read only permissions. It can be publicly published.
  static const String _zabbixToken =
      "NzQ0ZDI3NjkwZWE0NGIxMWEyNzlmZTk4Zjk3N2Y5N2U=";

  /// Host URI to zabbix server
  static const String zabbixPath = 'https://10.163.0.7';

  /// Zabbix group 16 (networking/switches)
  static const int zabbixSwitches = 16;

  /// Zabbix group 17 (networking/accesspoints)
  static const int zabbixAP = 17;

  /// Zabbix group 20 (networking/servers)
  static const int zabbixServers = 20;

  /// Facebook api key
  static String get facebookApi => utf8.decode(base64.decode(_facebookApi));
  static String get facebookProfilePictureUrl =>
      "https://graph.facebook.com/v4.0/100012919189214/picture?type=large";

  /// Slack incomming webhook endpoint
  static String get webhook => utf8.decode(base64.decode(_webhook));

  /// Zabbix Token
  static String get zabbixToken => utf8.decode(base64.decode(_zabbixToken));
}

class CacheConstants {
  // File
  static const String releases = 'releases.json';
  static const String feed = 'feed.json';
  static const String iCalendar = 'calendar.ics';

  // SharedPreferences
  static const String early = 'early';
  static const String range = 'range';
  static const String enabled = 'enabled';
  static const String calendarURL = 'calendarURL';
}
