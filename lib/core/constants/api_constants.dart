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
  static const _webhook = "ZXhlbXBsZQ=="; // ZXhlbXBsZQ== = exemple

  /// Facebook api key
  static const _facebookApi = "ZXhlbXBsZQ=="; // ZXhlbXBsZQ== = exemple

  /// Slack incomming webhook endpoint
  static String get webhook => utf8.decode(base64.decode(_webhook));

  /// Facebook api key
  static String get facebookApi => utf8.decode(base64.decode(_facebookApi));
}
