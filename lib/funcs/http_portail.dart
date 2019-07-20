import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

/// HTTP requests handler for EMSE Portal
class Portail {
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
  static Future<String> getPortailCookie(
      {String username, String password}) async {
    var status = "";

    var client = HttpClient();

    try {
      HttpClientRequest request = await client.getUrl(Uri.parse(
          "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin"));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      HttpClientResponse response = await request.close();

      var temp =
          await response.cast<List<int>>().transform(utf8.decoder).join();
      var lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(temp).group(1);
      var action = RegExp(r'action="([^"]*)"').firstMatch(temp).group(1);

      temp = response.headers['set-cookie'].toString();
      var jSessionIDCampus =
          RegExp(r'JSESSIONID=([^;]*);').firstMatch(temp).group(0);

      request = await client.postUrl(Uri.parse("https://cas.emse.fr$action"));
      request.followRedirects = false;
      request.headers.contentType =
          ContentType("application", "x-www-form-urlencoded", charset: "utf-8");
      var data =
          "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
      request.headers.contentLength = data.length;
      request.headers.set(HttpHeaders.cookieHeader, "$jSessionIDCampus");
      request.write(data);
      response = await request.close();

      temp = response.headers['set-cookie'].toString();
      String agimus;
      try {
        agimus = RegExp(r'AGIMUS=([^;]*);').firstMatch(temp).group(0);
      } catch (e) {
        throw "AGIMUS not found. Maybe bad username or password.";
      }
      var location = response.headers.value('location');

      request = await client.getUrl(Uri.parse(location));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      request.headers.set(HttpHeaders.cookieHeader, "$agimus");
      request.followRedirects = false;
      response = await request.close();

      temp = response.headers['set-cookie'].toString();
      var casAuth = RegExp(r'CASAuth=([^;]*);').firstMatch(temp).group(0);
      location = response.headers.value('location');

      request = await client.getUrl(Uri.parse(location));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      request.headers.set(HttpHeaders.cookieHeader, "$agimus $casAuth");
      response = await request.close();

      temp = response.headers['set-cookie'].toString();
      var laravelToken =
          RegExp(r'laravel_token=([^;]*);').firstMatch(temp).group(0);
      var xsrfToken = RegExp(r'XSRF-TOKEN=([^;]*);').firstMatch(temp).group(0);
      var portailEntEmseSession = RegExp(r'portail_ent_emse_session=([^;]*);')
          .firstMatch(temp)
          .group(0);

      status =
          "$agimus $casAuth $xsrfToken $laravelToken $portailEntEmseSession";
    } catch (e) {
      status = e.toString();
      print(status);
    }

    return status;
  }

  static Future<bool> saveCookiePortailFromLogin(
      {String username, String password}) async {
    String cookie =
        await getPortailCookie(username: username, password: password);

    if (cookie.contains("bad username or password")) return false;

    await saveCookiePortail(cookie);

    return true;
  }

  static Future<void> saveCookiePortail(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cookiePortail', cookie);
  }

  static Future<String> getSavedCookiePortail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String contents = prefs.getString('cookiePortail') ?? "";

    return contents;
  }
}
