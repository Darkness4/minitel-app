import 'dart:convert';
import 'dart:io';

/// HTTP requests handler for EMSE Portal
class PortailAPI {
  final HttpClient _client = HttpClient();
  List<Cookie> _cookie;
  final List<Cookie> _catchedCookies = <Cookie>[];

  List<Cookie> get catchedCookies => _catchedCookies;
  List<Cookie> get cookie => _cookie;

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

    final String temp = await response.transform(utf8.decoder).join();
    final String lt =
        RegExp(r'name="lt" value="([^"]*)"').firstMatch(temp).group(1);
    final String action = RegExp(r'action="([^"]*)"').firstMatch(temp).group(1);

    final Cookie jSessionIDCampus = response.cookies
        .firstWhere((Cookie cookie) => cookie.name == "JSESSIONID");

    final String data =
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
      agimus = response.cookies
          .firstWhere((Cookie cookie) => cookie.name == "AGIMUS");
    } on Exception {
      throw Exception("AGIMUS not found. Maybe bad username or password.");
    }
    String location = response.headers.value('location');

    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..cookies.add(agimus)
      ..followRedirects = false;
    response = await request.close();

    _catchedCookies.addAll(response.cookies);
    final Cookie casAuth = response.cookies
        .firstWhere((Cookie cookie) => cookie.name == "CASAuth");
    location = response.headers.value('location');

    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..cookies.add(agimus)
      ..cookies.add(casAuth);
    response = await request.close();

    _catchedCookies.addAll(response.cookies);
    final Cookie laravelToken = response.cookies
        .firstWhere((Cookie cookie) => cookie.name == "laravel_token");
    final Cookie xsrfToken = response.cookies
        .firstWhere((Cookie cookie) => cookie.name == "XSRF-TOKEN");
    final Cookie portailEntEmseSession = response.cookies.firstWhere(
        (Cookie cookie) => cookie.name == "portail_ent_emse_session");

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

    return <Cookie>[
      agimus,
      casAuth,
      laravelToken,
      xsrfToken,
      portailEntEmseSession
    ];
  }

  /// Save the cookie gotten through CAS Authentication
  Future<void> saveCookiePortailFromLogin(
      {String username, String password}) async {
    try {
      final List<Cookie> cookies =
          await getPortailCookie(username: username, password: password);
      _cookie = cookies;
    } on Exception {
      _cookie = null;
      rethrow;
    }
  }
}
