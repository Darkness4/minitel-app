import 'dart:convert';
import 'dart:io';

/// HTTP requests handler for EMSE Portal
class PortailAPI {
  final _client = HttpClient();
  String _cookie;

  String get cookie => _cookie;

  /// Récupère le cookie pour se connecter à Portail EMSE
  ///
  /// Le reverse engineering a durée plusieurs jours.
  /// Appréciez donc cet effort SVP !  --Marc NGUYEN
  ///
  /// [getPortailCookie] s'utilise facilement comme cela :
  ///
  /// ```
  /// String cookie = await getPortailCookie(username: "prenom.nom", password: "motdepasse")
  /// ```
  Future<String> getPortailCookie({String username, String password}) async {
    var status = "";

    HttpClientRequest request = await _client.getUrl(Uri.parse(
        "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin"))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();

    var temp = await response.cast<List<int>>().transform(utf8.decoder).join();
    var lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(temp).group(1);
    var action = RegExp(r'action="([^"]*)"').firstMatch(temp).group(1);

    temp = response.headers['set-cookie'].toString();
    var jSessionIDCampus =
        RegExp(r'JSESSIONID=([^;]*);').firstMatch(temp).group(0);

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
      ..headers.set(HttpHeaders.cookieHeader, "$jSessionIDCampus")
      ..write(data);
    response = await request.close();

    temp = response.headers['set-cookie'].toString();
    String agimus;
    try {
      agimus = RegExp(r'AGIMUS=([^;]*);').firstMatch(temp).group(0);
    } on NoSuchMethodError {
      throw Exception("AGIMUS not found. Maybe bad username or password.");
    }
    var location = response.headers.value('location');

    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..headers.set(HttpHeaders.cookieHeader, "$agimus")
      ..followRedirects = false;
    response = await request.close();

    temp = response.headers['set-cookie'].toString();
    var casAuth = RegExp(r'CASAuth=([^;]*);').firstMatch(temp).group(0);
    location = response.headers.value('location');

    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..headers.set(HttpHeaders.cookieHeader, "$agimus $casAuth");
    response = await request.close();

    temp = response.headers['set-cookie'].toString();
    var laravelToken =
        RegExp(r'laravel_token=([^;]*);').firstMatch(temp).group(0);
    var xsrfToken = RegExp(r'XSRF-TOKEN=([^;]*);').firstMatch(temp).group(0);
    var portailEntEmseSession =
        RegExp(r'portail_ent_emse_session=([^;]*);').firstMatch(temp).group(0);

    status = "$agimus $casAuth $xsrfToken $laravelToken $portailEntEmseSession";

    return status;
  }

  /// Save the cookie gotten through CAS Authentication in a SharedPrefs
  Future<void> saveCookiePortailFromLogin(
      {String username, String password}) async {
    try {
      String cookie =
          await getPortailCookie(username: username, password: password);
      _cookie = cookie;
    } on Exception {
      _cookie = null;
      rethrow;
    }
  }
}
