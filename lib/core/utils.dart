import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

extension CookieUtils on Map<String, String> {
  List<Cookie> parseSetCookie() {
    return RegExp(r'(.+?)(,(?=[^\s])|$)')
        .allMatches(this[HttpHeaders.setCookieHeader])
        .map((RegExpMatch match) => Cookie.fromSetCookieValue(match.group(1)))
        .toList();
  }
}

/// Url Launcher
class LaunchURLUtils {
  /// Launch the given url
  static Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
