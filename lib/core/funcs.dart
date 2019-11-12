import 'dart:io';

class CookieUtils {
  // TODO: extension
  static List<Cookie> parseSetCookie(Map<String, String> headers) {
    return RegExp(r'(.+?)(,(?=[^\s])|$)')
        .allMatches(headers[HttpHeaders.setCookieHeader])
        .map((RegExpMatch match) => Cookie.fromSetCookieValue(match.group(1)))
        .toList();
  }
}
