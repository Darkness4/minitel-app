import 'dart:convert';
import 'dart:io';

/// HTTP requests handler for EMSE Portal
class PortailAPI {
  final _client = HttpClient();
  List<Cookie> _cookie;
  var _catchedCookies = <Cookie>[];

  List<Cookie> get cookie => _cookie;
  List<Cookie> get catchedCookies => _catchedCookies;

  /// Récupère le cookie pour se connecter à Portail EMSE
  ///
  /// [getPortailCookie] s'utilise facilement comme cela :
  ///
  /// ```
  /// List<Cookie> cookies = await getPortailCookie(username: "prenom.nom", password: "motdepasse")
  /// ```
  Future<List<Cookie>> getPortailCookie(
      {String username, String password}) async {
    HttpClientRequest request = await _client.getUrl(Uri.parse(
        "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin"))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();

    var temp = await response.cast<List<int>>().transform(utf8.decoder).join();
    var lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(temp).group(1);
    var action = RegExp(r'action="([^"]*)"').firstMatch(temp).group(1);

    Cookie jSessionIDCampus =
        response.cookies.firstWhere((cookie) => cookie.name == "JSESSIONID");

    var data =
        "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
    request = await _client.postUrl(Uri.parse("https://cas.emse.fr$action"))
      ..followRedirects = false
      ..headers.contentType = ContentType(
        "application",
        "x-www-form-urlencoded",
        charset: "utf-8",
      )
      ..headers.contentLength = data.length
      ..cookies.add(jSessionIDCampus)
      ..write(data);
    response = await request.close();

    _catchedCookies.addAll(response.cookies);

    Cookie agimus;
    try {
      agimus = response.cookies.firstWhere((cookie) => cookie.name == "AGIMUS");
    } on NoSuchMethodError {
      throw Exception("AGIMUS not found. Maybe bad username or password.");
    }
    var location = response.headers.value('location');

    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..cookies.add(agimus)
      ..followRedirects = false;
    response = await request.close();

    _catchedCookies.addAll(response.cookies);
    Cookie casAuth =
        response.cookies.firstWhere((cookie) => cookie.name == "CASAuth");
    location = response.headers.value('location');

    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..cookies.add(agimus)
      ..cookies.add(casAuth);
    response = await request.close();

    _catchedCookies.addAll(response.cookies);
    Cookie laravelToken =
        response.cookies.firstWhere((cookie) => cookie.name == "laravel_token");
    Cookie xsrfToken =
        response.cookies.firstWhere((cookie) => cookie.name == "XSRF-TOKEN");
    Cookie portailEntEmseSession = response.cookies
        .firstWhere((cookie) => cookie.name == "portail_ent_emse_session");

    // _catchedCookies.forEach((cookie) {
    //   print("${cookie.domain}, "
    //       "${cookie.expires}, "
    //       "${cookie.httpOnly}, "
    //       "${cookie.maxAge}, "
    //       "${cookie.name}, "
    //       "${cookie.path}, "
    //       "${cookie.secure}, "
    //       "${cookie.value}, ");
    // });

    return [agimus, casAuth, laravelToken, xsrfToken, portailEntEmseSession];
  }

  /// Save the cookie gotten through CAS Authentication
  Future<void> saveCookiePortailFromLogin(
      {String username, String password}) async {
    try {
      List<Cookie> cookies =
          await getPortailCookie(username: username, password: password);
      _cookie = cookies;
    } on Exception {
      _cookie = null;
      rethrow;
    }
  }
}
