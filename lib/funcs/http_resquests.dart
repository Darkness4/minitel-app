import 'dart:convert';
import 'dart:io';

import 'package:webfeed/webfeed.dart';

/// Connect to the portal.
///
/// The [selectedUrl] is either local (10.163.0.2) or public (fw-cgcp.emse.fr).
/// Be aware, if the local DNS can forward the public address to the local.
/// Be also aware, if the local gateway can forward to the server (195.83.139.7).
/// The [uid] and [pswd] correspond to the Username and Password.
/// The [selectedTime] is listed on the website and is in minutes.
///
/// If connected, the response will be "[time] seconds left".
/// If a response is received, it will be manually decrypted using RegEx like "Bad Username or Password".
/// If no response is received, the HTTP error will be outputted.
///
/// You can use [autoLogin] like this:
///
/// ```
/// String status = await autoLogin("MyName", "MyPassword", "10.163.0.2", 480) // "28800 seconds left"
/// ```
Future<String> autoLogin(
    String uid, String pswd, String selectedUrl, int selectedTime) async {
  var status = "";

  var client = HttpClient();
  client.badCertificateCallback = (cert, host, port) => true;

  try {
    // SessionId
    HttpClientRequest request =
        await client.postUrl(Uri.parse('https://$selectedUrl/auth/plain.html'));

    request.headers.contentType =
        ContentType("application", "x-www-form-urlencoded", charset: 'utf-8');
    var data = "uid=$uid&time=$selectedTime&pswd=$pswd";
    request.headers.contentLength = data.length; // Needed
    request.write(data);
    HttpClientResponse response = await request.close();
    var sessionId = "";
    var body = await response.transform(Utf8Decoder()).join();
    if (response.statusCode == 200) {
      if (body.contains('title_error')) {
        throw ("Error: Bad Username or Password");
      } else {
        var match = RegExp(r'"(id=([^"]*))').firstMatch(body).group(1); // Id
        if (match is! String)
          throw Exception(
              "Error: SessionId doesn't exist. Please check if the RegEx is updated.");
        else
          sessionId = match;
      }
    } else
      throw Exception("HttpError: ${response.statusCode}");

    // Status
    request = await client
        .postUrl(Uri.parse('https://$selectedUrl/auth/disclaimer.html'));
    request.headers.contentType =
        ContentType("application", "x-www-form-urlencoded", charset: "utf-8");
    data = "session=$sessionId&read=accepted&action=J'accepte";
    request.headers.contentLength = data.length;
    request.write(data);

    response = await request.close();
    body = await response.transform(Utf8Decoder()).join();
    if (body.contains('title_error'))
      throw Exception("Error: SessionId is incorrect. Please check the RegEx.");
    else {
      var match = RegExp(r'<span id="l_rtime">([^<]*)<\/span>') // Time finder.
          .firstMatch(body)
          .group(1);
      if (match is! String)
        throw Exception(
            "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
      else
        status = '$match seconds left';
    }
  } catch (e) {
    status = e.toString();
  }

  return status;
}

Future<AtomFeed> getAtom(String atomUrl) async {
  var client = HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(atomUrl));
  HttpClientResponse response = await request.close();
  var status = await response.transform(Utf8Decoder()).join();
  return AtomFeed.parse(status);
}

Future<RssFeed> getRss(String rssUrl) async {
  var client = HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(rssUrl));
  HttpClientResponse response = await request.close();
  var status = await response.transform(Utf8Decoder()).join();
  return RssFeed.parse(status);
}

/// Get the connection status of the portal.
///
/// The [selectedUrl] is either local (10.163.0.2) or public (fw-cgcp.emse.fr).
/// Be aware, if the local DNS can forward the public address to the local.
/// Be also aware, if the local gateway can forward to the server (195.83.139.7).
///
/// If connected, the response will be "[time] seconds left".
/// If not, the response will be "Not logged in"
/// If no response is received, the HTTP error will be outputted.
///
/// You can use [getStatus] like this:
///
/// ```
/// String status = await getStatus("172.17.0.1") // "x seconds left"
/// ```
Future<String> getStatus(String selectedUrl) async {
  var url = 'https://$selectedUrl/auth/login.html';
  var status = "";
  RegExp exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');

  var client = HttpClient();
  client.badCertificateCallback = (cert, host, port) => true;

  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    // print(request.method.toString());
    // print(request.headers.toString());

    HttpClientResponse response = await request.close();
    var body = await response.transform(Utf8Decoder()).join();
    if (response.statusCode == 200) {
      if (!body.contains('l_rtime')) {
        throw ("Not logged in");
      } else {
        var match = exp.firstMatch(body).group(1);
        if (match is! String)
          throw Exception(
              "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
        else
          status = '$match seconds left';
      }
    } else
      throw Exception("HttpError: ${response.statusCode}");
  } catch (e) {
    status = e.toString();
  }

  return status;
}

/// Disconnect from the portal.
///
///
///
/// ```
/// String status = await getStatus("172.17.0.1") // "x seconds left"
/// ```
Future<String> disconnectGateway(String selectedUrl) async {
  var url =
      'https://$selectedUrl/auth/auth.html?url=&uid=&time=480&logout=D%C3%A9connexion';
  var status = "";

  var client = HttpClient();
  client.badCertificateCallback = (cert, host, port) => true;

  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.removeAll(HttpHeaders.contentLengthHeader);
    HttpClientResponse response = await request.close();
    var body = await response.transform(Utf8Decoder()).join();
    if (response.statusCode == 200) {
      status = body.contains('title_success')
          ? 'You have logged out'
          : "Disconnection failed.";
    } else
      throw Exception("HttpError: ${response.statusCode}");
  } catch (e) {
    status = e.toString();
  }

  return status;
}

/// Report data to the Slack of Minitel
///
/// Send a POST data to the Webhook of the Slack of Minitel by using [HttpClientRequest].
///
/// You can use [report] like this:
///
/// ```
/// String status = await report("Description", title: "Title");
/// ```
Future<String> report(String text,
    {String title, String channel: "projet_flutter_notif"}) async {
  var status = "";

  if (text != "" && title != "") {
    var client = HttpClient();
    var out = "*--Report ${DateTime.now()}--*\n"
        "*$title*\n"
        "$text\n";
    var data = {
      'text': out,
      'username': 'Flutter Reporter Bot',
      'icon_url':
          'https://raw.githubusercontent.com/dart-lang/logos/master/flutter/logo%2Btext/vertical/default.png',
      'channel': channel, // Marc : DE8PA0Z1C
    };

    try {
      HttpClientRequest request = await client.postUrl(Uri.parse(
          'https://hooks.slack.com/services/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'));

      request.headers.contentType =
          ContentType("application", "json", charset: "utf-8");
      request.write(json.encode(data));
      HttpClientResponse response = await request.close();
      status = await response.transform(Utf8Decoder()).join();
    } catch (e) {
      status = e.toString();
    }
  } else {
    status = "Not enough information.";
  }

  return status;
}

Future<String> loginSogo(String uid, String pswd) async {
  var url = 'https://sogo.emse.fr/SOGo/connect';
  var status = "";

  var client = HttpClient();

  try {
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    var data = {'userName': uid, 'password': pswd, 'rememberLogin': '1'};
    request.headers.contentLength = json.encode(data).length; // Needed
    request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");
    request.write(json.encode(data));
    HttpClientResponse response = await request.close();
    var body = await response.transform(Utf8Decoder()).join();
    print(body);
    if (response.statusCode == 200) {
    } else
      throw Exception("HttpError: ${response.statusCode}");
  } catch (e) {
    status = e.toString();
  }

  return status;
}
