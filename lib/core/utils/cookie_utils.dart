import 'dart:io';

extension CookieUtils on Map<String, String> {
  List<Cookie> parseSetCookie() {
    return RegExp(r'(.+?)(,(?=[^\s])|$)')
        .allMatches(this[HttpHeaders.setCookieHeader]!)
        .map((RegExpMatch match) => Cookie.fromSetCookieValue(match.group(1)!))
        .toList();
  }
}
