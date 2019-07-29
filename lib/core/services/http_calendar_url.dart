import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class CalendarUrlAPI {
  Future<String> get savedCalendarURL async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String contents = prefs.getString('calendarURL') ?? "";

    return contents;
  }

  Future<String> getCalendarURL({String username, String password}) async {
    var url = "https://portail.emse.fr/ics/";
    var status = "";
    var client = HttpClient();
    var phpSessionIDCAS = await _bypassCAS(
      username: username,
      password: password,
    );

    try {
      HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      request.headers
          .set(HttpHeaders.cookieHeader, "PHPSESSID=$phpSessionIDCAS");
      HttpClientResponse response = await request.close();
      var body =
          await response.cast<List<int>>().transform(utf8.decoder).join();
      status = RegExp(r'https(.*)\.ics').stringMatch(body);
    } catch (e) {
      status = e.toString();
    }

    return status;
  }

  Future<void> saveCalendarURL(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('calendarURL', url);
  }

  Future<String> _bypassCAS({String username, String password}) async {
    var status = "";
    var referee = "https://portail.emse.fr/ics/";
    var client = HttpClient();

    try {
      // GET ICS
      HttpClientRequest request = await client.getUrl(Uri.parse(referee));
      request.followRedirects = false;
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      HttpClientResponse response = await request.close();
      var phpSessionIDreferee = response.headers.value('set-cookie');
      // print("Look for PHPSESSID $phpSessionIDreferee");
      phpSessionIDreferee = RegExp(r'PHPSESSID=([^;]*);')
          .firstMatch(phpSessionIDreferee)
          .group(1);

      // GET CAS
      request = await client.getUrl(Uri.parse(
          "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      response = await request.close();

      var lt = await response.cast<List<int>>().transform(utf8.decoder).join();
      lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(lt).group(1);

      var jSessionID = response.headers.value('set-cookie');
      // print("Look for JSESSIONID $jSessionID");
      jSessionID =
          RegExp(r'JSESSIONID=([^;]*);').firstMatch(jSessionID).group(1);

      // POST CAS
      request = await client.postUrl(Uri.parse(
          'https://cas.emse.fr/login;jsessionid=$jSessionID?service=${Uri.encodeComponent(referee)}'));
      request.headers.contentType =
          ContentType("application", "x-www-form-urlencoded", charset: "utf-8");
      var data =
          "username=$username&password=$password&lt=$lt&execution=e1s1&_eventId=submit";
      request.headers.contentLength = data.length;
      request.headers.set(HttpHeaders.cookieHeader, "JSESSIONID=$jSessionID");
      request.headers.set(HttpHeaders.refererHeader,
          'https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}');
      request.write(data);
      response = await request.close();

      // print("Look for location: ${response.headers}");
      var location = response.headers.value('location');
      // print("Location: $location");
      if (location == null) throw "Error : Bad login";

      // GET CAS
      request = await client.getUrl(Uri.parse(location));
      request.headers.removeAll(HttpHeaders.contentLengthHeader);
      request.followRedirects = false;
      request.headers
          .set(HttpHeaders.cookieHeader, "PHPSESSID=$phpSessionIDreferee");
      response = await request.close();

      var phpSessionIDCAS = response.headers.value("set-cookie");
      // print("Look for PHPSESSID $phpSessionIDCAS");
      phpSessionIDCAS =
          RegExp(r'PHPSESSID=([^;]*);').firstMatch(phpSessionIDCAS).group(1);

      // Cookie
      status = phpSessionIDCAS;
    } catch (e) {
      status = e.toString();
    }

    return status;
  }
}
