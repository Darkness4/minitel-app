import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

/// Récupère le cookie pour se connecter à Campus EMSE
///
/// Le reverse engineering a durée plusieurs jours.
/// Appréciez donc cet effort SVP !  --Marc NGUYEN
///
/// [getCampusCookie] s'utilise facilement comme cela :
///
/// ```
/// String cookie = await getCampusCookie(username: "prenom.nom", password: "motdepasse")
/// ```
Future<String> getCampusCookie({String username, String password}) async {
  var status = "";

  var client = HttpClient();

  try {
    HttpClientRequest request =
        await client.getUrl(Uri.parse("https://campus.emse.fr"));
    // var host = request.headers[HttpHeaders.hostHeader];
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();

    var temp = response.headers['set-cookie'].toString();

    /// MoodleSession=Value
    var moodleSession =
        RegExp(r'MoodleSession([^;]*);').firstMatch(temp).group(0);

    // print("$host:\n$moodleSession");

    request = await client.getUrl(Uri.parse(
        "https://campus.emse.fr/Shibboleth.sso/Login?entityID=https%3A%2F%2Fidp.emse.fr%2Fidp%2Fshibboleth&target=https%3A%2F%2Fcampus.emse.fr%2Fauth%2Fshibboleth%2Findex.php"));
    request.headers.set(HttpHeaders.cookieHeader, moodleSession);
    // request.headers
    //     .set(HttpHeaders.refererHeader, "https://campus.emse.fr/login/index.php");
    request.headers.removeAll(HttpHeaders.contentLengthHeader);

    // host = request.headers[HttpHeaders.hostHeader];

    response = await request.close();

    temp = await response.transform(Utf8Decoder()).join();

    /// lt=[Value]
    var lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(temp).group(1);

    /// action=[url]
    var action = RegExp(r'action="([^"]*)"').firstMatch(temp).group(1);

    temp = response.headers['set-cookie'].toString();

    /// JSESSIONID=[Value]
    // var jSessionIDCampus =
    //     RegExp(r'JSESSIONID=([^;]*);').firstMatch(temp).group(1);

    /// JSESSIONID=[Value]
    // var jSessionIDCAS =
    //     RegExp(r'jsessionid%3D([^%]*)%').firstMatch(action).group(1);

    // print("$host:\n$lt\n$action\n$jSessionIDCampus\n$jSessionIDCAS\n");

    request = await client.postUrl(Uri.parse("https://cas.emse.fr$action"));
    request.headers.contentType =
        ContentType("application", "x-www-form-urlencoded", charset: "utf-8");
    var data =
        "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
    request.headers.contentLength = data.length;
    // host = request.headers[HttpHeaders.hostHeader];
    request.write(data);
    response = await request.close();

    temp = response.headers['set-cookie'].toString();

    var agimus;
    try {
      agimus = RegExp(r'AGIMUS=([^;]*);').firstMatch(temp).group(0);
    } catch (e) {
      throw "AGIMUS not found. Maybe bad username or password.";
    }

    var location = response.headers.value('location');

    /// jSessionIDIDP=[Value]
    // var jSessionIDIDP =
    //     RegExp(r'jsessionid=([^?]*)?').firstMatch(location).group(1);

    // print("$host:\n$agimus\n$location\n$jSessionIDIDP\n");

    request = await client.getUrl(Uri.parse(location));
    // host = request.headers[HttpHeaders.hostHeader];
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    request.headers.set(HttpHeaders.cookieHeader, "$agimus");
    // request.headers.set(HttpHeaders.refererHeader, "https://cas.emse.fr$action");
    response = await request.close();

    temp = await response.transform(Utf8Decoder()).join();

    var relayState = RegExp(r'name="RelayState" value="(.*)"/>')
        .firstMatch(temp)
        .group(1)
        .replaceAll("&#x3a;", ":");
    var samlReponse =
        RegExp(r'name="SAMLResponse" value="(.*)"/>').firstMatch(temp).group(1);

    // print("$host:\n$relayState\n${samlReponse.substring(0, 10)}\n");

    request = await client
        .postUrl(Uri.parse("https://campus.emse.fr/Shibboleth.sso/SAML2/POST"));
    request.headers.set(HttpHeaders.cookieHeader, "$agimus");
    // request.headers.set(HttpHeaders.refererHeader,
    //     'https://idp.emse.fr/idp/profile/SAML2/Redirect/SSO?execution=e1s1&_eventId_proceed=1');
    request.headers.contentType =
        ContentType("application", "x-www-form-urlencoded", charset: "utf-8");
    data =
        "RelayState=${Uri.encodeQueryComponent(relayState)}&SAMLResponse=${Uri.encodeQueryComponent(samlReponse)}";
    request.headers.contentLength = data.length;
    request.write(data);
    // host = request.headers[HttpHeaders.hostHeader];
    response = await request.close();

    temp = response.headers['set-cookie'].toString();
    var shibsession = RegExp(r'_shibsession([^;]*);').firstMatch(temp).group(0);
    location = response.headers.value('location');

    // print("$host:\n$shibsession\n$location\n");

    request = await client.getUrl(Uri.parse(location));
    request.headers
        .set(HttpHeaders.cookieHeader, "$agimus $shibsession $moodleSession");
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    // request.headers.set(HttpHeaders.refererHeader,
    //     "https://campus.emse.fr/Shibboleth.sso/SAML2/POST");

    // host = request.headers[HttpHeaders.hostHeader];
    response = await request.close();

    temp = response.headers['set-cookie'].toString();

    /// MoodleSession=Value
    moodleSession = RegExp(r'MoodleSession([^;]*);').firstMatch(temp).group(0);
    // print("$host:\n$moodleSession\n");

    request = await client.getUrl(Uri.parse("https://campus.emse.fr"));
    // host = request.headers[HttpHeaders.hostHeader];
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    request.headers
        .set(HttpHeaders.cookieHeader, "$agimus $shibsession $moodleSession");
    response = await request.close();

    status = "$agimus $shibsession $moodleSession";
  } catch (e) {
    status = e.toString();
  }

  return status;
}

Future<bool> saveCookieCampusFromLogin(
    {String username, String password}) async {
  String cookie = await getCampusCookie(username: username, password: password);

  if (cookie.contains("bad username or password")) return false;

  await saveCookieCampus(cookie);

  return true;
}

Future<void> saveCookieCampus(String cookie) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('cookieCampus', cookie);
}

Future<String> getSavedCookieCampus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String contents = prefs.getString('cookieCampus') ?? "";

  return contents;
}
