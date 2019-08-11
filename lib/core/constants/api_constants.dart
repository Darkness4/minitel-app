/// Api keys
///
/// After cloning from remote, add your own API keys with b64 encoding.
/// This file should NOT be tracked by any Version Control System.
/// Track this file ONLY IF new keys will be used, like the exemple below.
import 'dart:convert';

class ApiConstants {
  // API keys should be placed here with b64 encoding to avoid search engine
  /// Slack incomming webhook endpoint
  static const _webhook = "ZXhlbXBsZQ=="; // ZXhlbXBsZQ== = exemple

  /// Facebook api key
  static const _facebookApi = "ZXhlbXBsZQ=="; // ZXhlbXBsZQ== = exemple

  /// Slack incomming webhook endpoint
  static String get webhook => utf8.decode(base64.decode(_webhook));

  /// Facebook api key
  static String get facebookApi => utf8.decode(base64.decode(_facebookApi));
}
