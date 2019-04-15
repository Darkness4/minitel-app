import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'icalendar_parser.dart';

Future<File> get _calendar async {
  final path = await _localPath;
  return File('$path/calendar.ics');
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _savedCalendarURL async {
  final path = await _localPath;
  return File('$path/savedCalendarURL');
}

Future<String> bypassCAS(
    {String username, String password, String referee}) async {
  var status = "";

  var client = HttpClient();

  try {
    // GET ICS
    HttpClientRequest request = await client.postUrl(Uri.parse(referee));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    var phpSessionIDreferee = response.headers.value('set-cookie');
    print("Look for PHPSESSID $phpSessionIDreferee");
    phpSessionIDreferee =
        RegExp(r'PHPSESSID=([^;]*);').firstMatch(phpSessionIDreferee).group(1);

    // GET CAS
    request = await client.getUrl(Uri.parse(
        "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    response = await request.close();

    var lt = await response.transform(Utf8Decoder()).join();
    lt = RegExp(r'name="lt" value="([^"]*)"').firstMatch(lt).group(1);

    var jSessionID = response.headers.value('set-cookie');
    print("Look for JSESSIONID $jSessionID");
    jSessionID = RegExp(r'JSESSIONID=([^;]*);').firstMatch(jSessionID).group(1);

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

    var location = response.headers.value('location');
    print("Location: $location");
    if (location == null) throw "Error : Bad login";

    // GET CAS
    request = await client.postUrl(Uri.parse(location));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    request.headers
        .set(HttpHeaders.cookieHeader, "PHPSESSID=$phpSessionIDreferee");
    response = await request.close();

    var phpSessionIDCAS = response.headers.value("set-cookie");
    print("Look for PHPSESSID $phpSessionIDCAS");
    phpSessionIDCAS =
        RegExp(r'PHPSESSID=([^;]*);').firstMatch(phpSessionIDCAS).group(1);

    // Cookie
    status = phpSessionIDCAS;
  } catch (e) {
    status = e.toString();
  }

  return status;
}

Future<String> getCalendarURL({String phpSessionIDCAS, String url}) async {
  var status = "";

  var client = HttpClient();

  try {
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    request.headers.set(HttpHeaders.cookieHeader, "PHPSESSID=$phpSessionIDCAS");
    HttpClientResponse response = await request.close();
    var body = await response.transform(Utf8Decoder()).join();
    status = RegExp(r'https(.*)ics').stringMatch(body);
  } catch (e) {
    status = e.toString();
  }

  return status;
}

Future<String> getSavedCalendarURL() async {
  final file = await _savedCalendarURL;
  if (!(await file.exists()))
    throw Exception("File savedCalendarURL do not exists");

  // Read the file
  String contents = await file.readAsString();
  if (!contents.contains("http")) throw "Error : This is not an URL";

  return contents;
}

Future<String> readCalendar() async {
  final file = await _calendar;
  if (!(await file.exists()))
    throw Exception("File calendar.ics do not exists");

  // Read the file
  String contents = await file.readAsString();

  return contents;
}

Future<bool> saveCalendarFromLogin({String username, String password}) async {
  final file = await _calendar;

  var phpSessionId = await bypassCAS(
    username: username,
    password: password,
    referee: "https://portail.emse.fr/ics/",
  );

  if (phpSessionId == "Error : Bad login") return false;

  var icsUrl = await getCalendarURL(
    phpSessionIDCAS: phpSessionId,
    url: "https://portail.emse.fr/ics/",
  );

  saveCalendarURL(icsUrl);

  var iCalendar = "";

  iCalendar = await getCalendar(icsUrl);
  file.writeAsString(iCalendar);

  return true;
}

Future<void> saveCalendarFromUrl(String url) async {
  final file = await _calendar;

  var iCalendar = "";

  iCalendar = await getCalendar(url);
  if (!iCalendar.contains("VCALENDAR")) throw "Error: This is not a calendar";
  file.writeAsString(iCalendar);
}

Future<void> saveCalendarURL(String url) async {
  final file = await _savedCalendarURL;
  file.writeAsString(url);
}
