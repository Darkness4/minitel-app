import 'dart:io';
import 'dart:convert';

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
    print("Location: $jSessionID");

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

Future<String> getCalendar({String phpSessionIDCAS, String url}) async {
  var status = "";

  var client = HttpClient();

  try {
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    request.headers.set(HttpHeaders.cookieHeader, "PHPSESSID=$phpSessionIDCAS");
    HttpClientResponse response = await request.close();
    var body = await response.transform(Utf8Decoder()).join();
    print(body);

    status = RegExp(r'https(.*)ics').stringMatch(body);
  } catch (e) {
    status = e.toString();
  }

  return status;
}
