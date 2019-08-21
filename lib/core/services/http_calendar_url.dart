import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

/// Calendar Url "API"
class CalendarUrlAPI {
  final _client = HttpClient();

  /// Get from SharedPrefs the url to get the ical
  Future<String> get savedCalendarURL async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String contents = prefs.getString('calendarURL') ?? "";

    return contents;
  }

  /// Get from EMSE the url to get the ical
  Future<String> getCalendarURL({String username, String password}) async {
    var status = "";
    final phpSessionIDCAS = await _bypassCAS(
      username: username,
      password: password,
    );

    try {
      final HttpClientRequest request =
          await _client.postUrl(Uri.parse("https://portail.emse.fr/ics/"))
            ..headers.removeAll(HttpHeaders.contentLengthHeader)
            ..cookies.add(phpSessionIDCAS);
      final HttpClientResponse response = await request.close();
      final body = await response
          .cast<List<int>>()
          .transform(utf8.decoder)
          .transform(const LineSplitter())
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('calendarURL', url);
  }

  /// Login through EMSE CAS Authentication
  Future<Cookie> _bypassCAS({String username, String password}) async {
    const referee = "https://portail.emse.fr/ics/";

    // GET ICS
    HttpClientRequest request = await _client.getUrl(Uri.parse(referee))
      ..followRedirects = false
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    final Cookie phpSessionIDreferee =
        response.cookies.firstWhere((cookie) => cookie.name == "PHPSESSID");

    // GET CAS
    request = await _client.getUrl(Uri.parse(
        "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"))
      ..headers.removeAll(HttpHeaders.contentLengthHeader);
    response = await request.close();

    var lt = await response
        .cast<List<int>>()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .firstWhere(
            (line) => line.contains(RegExp(r'name="lt" value="([^"]*)"')));
    lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(lt).group(1);

    final Cookie jSessionID =
        response.cookies.firstWhere((cookie) => cookie.name == "JSESSIONID");

    // POST CAS
    final data =
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

    final location = response.headers.value('location');
    // print("Location: $location");
    if (location == null) throw Exception("Error : Bad login");

    // GET CAS
    request = await _client.getUrl(Uri.parse(location))
      ..headers.removeAll(HttpHeaders.contentLengthHeader)
      ..followRedirects = false
      ..cookies.add(phpSessionIDreferee);
    response = await request.close();

    final Cookie phpSessionIDCAS =
        response.cookies.firstWhere((cookie) => cookie.name == "PHPSESSID");

    // Cookie
    return phpSessionIDCAS;
  }
}
