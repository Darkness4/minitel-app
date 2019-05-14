import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

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

  var client = HttpClient();

  try {
    HttpClientRequest request = await client.getUrl(
        Uri.parse("https://portail.emse.fr/css-emse/bandeau_login.php"));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();

    var temp = await response.transform(Utf8Decoder()).join();

    /// lt=[Value]
    var lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(temp).group(1);

    /// action=[url]
    var action = RegExp(r'action="([^"]*)"').firstMatch(temp).group(1);

    temp = response.headers['set-cookie'].toString();

    /// JSESSIONID=[Value]
    var jSessionIDPortail =
        RegExp(r'JSESSIONID=([^;]*);').firstMatch(temp).group(1);

    request = await client.postUrl(Uri.parse("https://cas.emse.fr$action"));
    request.headers.contentType =
        ContentType("application", "x-www-form-urlencoded", charset: "utf-8");
    var data =
        "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
    request.headers.contentLength = data.length;
    request.headers
        .set(HttpHeaders.cookieHeader, "JSESSIONID=$jSessionIDPortail");
    request.write(data);
    response = await request.close();

    temp = response.headers['set-cookie'].toString();

    /// AGIMUS=Value
    var agimus;
    try {
      agimus = RegExp(r'AGIMUS=([^;]*);').firstMatch(temp).group(0);
    } catch (e) {
      throw "AGIMUS not found. Maybe bad username or password.";
    }

    var location = response.headers.value('location');

    request = await client.postUrl(Uri.parse(location));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    request.headers.set(HttpHeaders.cookieHeader, "$agimus");
    response = await request.close();

    temp = await response.transform(Utf8Decoder()).join();

    temp = response.headers['set-cookie'].toString();

    var phpSessID = RegExp(r'PHPSESSID=ST([^;]*);').firstMatch(temp).group(0);

    location = response.headers.value('location');

    // request = await client.getUrl(Uri.parse(location));
    // request.headers.removeAll(HttpHeaders.contentLengthHeader);
    // request.headers.set(HttpHeaders.cookieHeader, "$agimus $phpSessID");
    // response = await request.close();

    status = "$agimus $phpSessID";
  } catch (e) {
    status = e.toString();
  }

  return status;
}

Future<bool> saveCookiePortailFromLogin(
    {String username, String password}) async {
  String cookie =
      await getPortailCookie(username: username, password: password);

  if (cookie.contains("bad username or password")) return false;

  await saveCookiePortail(cookie);

  return true;
}

Future<void> saveCookiePortail(String cookie) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('cookiePortail', cookie);
}

Future<String> getSavedCookiePortail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String contents = prefs.getString('cookiePortail') ?? "";

  return contents;
}
