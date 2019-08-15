import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

/// Calendar Url "API"
class CalendarUrlAPI {
  final _client = HttpClient();

  /// Get from SharedPrefs the url to get the ical
  Future<String> get savedCalendarURL async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String contents = prefs.getString('calendarURL') ?? "";

    return contents;
  }

  /// Get from EMSE the url to get the ical
  Future<String> getCalendarURL({String username, String password}) async {
    var status = "";
    var phpSessionIDCAS = await _bypassCAS(
      username: username,
      password: password,
    );

    try {
      HttpClientRequest request =
          await _client.postUrl(Uri.parse("https://portail.emse.fr/ics/"))
            ..headers.removeAll(HttpHeaders.contentLengthHeader)
            ..cookies.add(phpSessionIDCAS);
      HttpClientResponse response = await request.close();
      var body = await response
          .cast<List<int>>()
          .transform(utf8.decoder)
          .transform(LineSplitter())
          .firstWhere((line) => line.contains(RegExp(r'https(.*)\.ics')));
      status = RegExp(r'https(.*)\.ics').stringMatch(body);
    } catch (e) {
      status = e.toString();
      print(status);
    }

    return status;
  }

  /// Save the url to get the ical in a SharedPrefs
  Future<void> saveCalendarURL(String url) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('calendarURL', url);
  }

  /// Login through EMSE CAS Authentication
  Future<Cookie> _bypassCAS({String username, String password}) async {
    var referee = "https://portail.emse.fr/ics/";

    // GET ICS
    HttpClientRequest request = await _client.getUrl(Uri.parse(referee))
      ..followRedirects = false
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    Cookie phpSessionIDreferee =
        response.cookies.firstWhere((cookie) => cookie.name == "PHPSESSID");

    // GET CAS
    request = await _client.getUrl(Uri.parse(
        "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    response = await request.close();

    var lt = await response
        .cast<List<int>>()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .firstWhere(
            (line) => line.contains(RegExp(r'name="lt" value="([^"]*)"')));
    lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(lt).group(1);

    Cookie jSessionID =
        response.cookies.firstWhere((cookie) => cookie.name == "JSESSIONID");

    // POST CAS
    var data =
        "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
    request = await _client.postUrl(Uri.parse(
        'https://cas.emse.fr/login;jsessionid=${jSessionID.value}?service=${Uri.encodeComponent(referee)}'))
      ..headers.contentType = ContentType(
        "application",
        "x-www-form-urlencoded",
        charset: "utf-8",
      )
      ..headers.contentLength = data.length
      ..cookies.add(jSessionID)
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
      ..cookies.add(phpSessionIDreferee);
    response = await request.close();

    Cookie phpSessionIDCAS =
        response.cookies.firstWhere((cookie) => cookie.name == "PHPSESSID");

    // Cookie
    return phpSessionIDCAS;
  }
}
