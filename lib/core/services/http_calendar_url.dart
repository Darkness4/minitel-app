import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class CalendarUrlAPI {
  final _client = HttpClient();
  Future<String> get savedCalendarURL async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String contents = prefs.getString('calendarURL') ?? "";

    return contents;
  }

  Future<String> getCalendarURL({String username, String password}) async {
    var status = "";
    var phpSessionIDCAS = await _bypassCAS(
      username: username,
      password: password,
    );

    try {
      HttpClientRequest request = await _client
          .postUrl(Uri.parse("https://portail.emse.fr/ics/"))
        ..headers.removeAll(HttpHeaders.contentLengthHeader)
        ..headers.set(HttpHeaders.cookieHeader, "PHPSESSID=$phpSessionIDCAS");
      HttpClientResponse response = await request.close();
      var body =
          await response.cast<List<int>>().transform(utf8.decoder).join();
      status = RegExp(r'https(.*)\.ics').stringMatch(body);
    } catch (e) {
      status = e.toString();
      print(status);
    }

    return status;
  }

  Future<void> saveCalendarURL(String url) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('calendarURL', url);
  }

  Future<String> _bypassCAS({String username, String password}) async {
    var referee = "https://portail.emse.fr/ics/";

    // GET ICS
    HttpClientRequest request = await _client.getUrl(Uri.parse(referee))
      ..followRedirects = false
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    var phpSessionIDreferee = response.headers.value('set-cookie');
    // print("Look for PHPSESSID $phpSessionIDreferee");
    phpSessionIDreferee =
        RegExp(r'PHPSESSID=([^;]*);').firstMatch(phpSessionIDreferee).group(1);

    // GET CAS
    request = await _client.getUrl(Uri.parse(
        "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    response = await request.close();

    var lt = await response.cast<List<int>>().transform(utf8.decoder).join();
    lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(lt).group(1);

    var jSessionID = response.headers.value('set-cookie');
    // print("Look for JSESSIONID $jSessionID");
    jSessionID = RegExp(r'JSESSIONID=([^;]*);').firstMatch(jSessionID).group(1);

    // POST CAS
    var data =
        "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
    request = await _client.postUrl(Uri.parse(
        'https://cas.emse.fr/login;jsessionid=$jSessionID?service=${Uri.encodeComponent(referee)}'))
      ..headers.contentType = ContentType(
        "application",
        "x-www-form-urlencoded",
        charset: "utf-8",
      )
      ..headers.contentLength = data.length
      ..headers.set(
        HttpHeaders.cookieHeader,
        "JSESSIONID=$jSessionID",
      )
      ..headers.set(
        HttpHeaders.refererHeader,
        'https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}',
      )
      ..write(data);
    response = await request.close();

    var location = response.headers.value('location');
    // print("Location: $location");
    if (location == null) throw Exception("Error : Bad login");

    // GET CAS
    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..followRedirects = false
      ..headers.set(
        HttpHeaders.cookieHeader,
        "PHPSESSID=$phpSessionIDreferee",
      );
    response = await request.close();

    var phpSessionIDCAS = response.headers.value("set-cookie");
    phpSessionIDCAS =
        RegExp(r'PHPSESSID=([^;]*);').firstMatch(phpSessionIDCAS).group(1);

    // Cookie
    return phpSessionIDCAS;
  }
}
