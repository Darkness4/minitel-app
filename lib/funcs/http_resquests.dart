import 'dart:io';

import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

/// Get the connection status of the portal.
///
/// The [selectedUrl] is either local (172.17.0.1) or public (fw-cgcp.emse.fr).
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
  var url = 'https://$selectedUrl/auth/';
  var status = "";
  RegExp exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');

  HttpClient client = HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) =>
          true); // SECURITY WARNING  Bypass certificate!!!
  IOClient ioClient = IOClient(client);

  status = await ioClient
      .post(url)  // TODO: GET instead of POST
      .then((response) {
        // debugPrint(response.body);
        if (response.statusCode == 200) {
          if (!response.body.contains('l_rtime'))
            throw ("Not logged in");
          else
            return response.body;
        } else
          throw Exception("HttpError: ${response.statusCode}");
      })
      .then((body) => exp.firstMatch(body).group(1))
      .then((match) {
        if (match is! String)
          throw Exception(
              "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
        else
          return '$match seconds left';
      })
      .catchError((e) => e.toString());

  return status;
}


/// Connect to the portal.
///
/// The [selectedUrl] is either local (172.17.0.1) or public (fw-cgcp.emse.fr).
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
/// String status = await autoLogin("MyName", "MyPassword", "172.17.0.1", 480) // "28800 seconds left"
/// ```
Future<String> autoLogin(
    String uid, String pswd, String selectedUrl, int selectedTime) async {
  var status = "";

  HttpClient client = HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) =>
          true); // SECURITY WARNING  Bypass certificate!!!
  IOClient ioClient = IOClient(client);

  try {
    var sessionId = await ioClient.post("https://$selectedUrl/auth/plain.html",
        body: {
          'uid': uid,
          'time': '$selectedTime',
          'pswd': pswd
        }).then((response) {
      // debugPrint(response.body);
      if (response.statusCode == 200) {
        if (response.body.contains('title_error'))
          throw ("Error: Bad Username or Password");
        else
          return response.body;
      } else
        throw Exception("HttpError: ${response.statusCode}");
    }).then((body) => RegExp(r'"(id=([^"]*))') // SessionId finder.
          .firstMatch(body)
          .group(1)).then((match) {
      if (match is! String)
        throw Exception(
            "Error: SessionId doesn't exist. Please check if the RegEx is updated.");
      else
        return match;
    });

    status = await ioClient.post("https://$selectedUrl/auth/disclaimer.html",
        body: {
          'session': sessionId,
          'read': 'accepted',
          'action': "J'accepte"
        }).then((response) {
      if (response.body.contains('title_error'))
        throw Exception(
            "Error: SessionId is incorrect. Please check the RegEx.");
      else
        return response.body;
    }).then((body) {
      return RegExp(r'<span id="l_rtime">([^<]*)<\/span>') // Time finder.
          .firstMatch(body)
          .group(1);
    }).then((match) {
      if (match is! String)
        throw Exception(
            "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
      else
        return '$match seconds left';
    });
  } catch (e) {
    status = e.toString();
  }

  return status;
}


Future<AtomFeed> getAtom(String atomUrl) async {
  IOClient ioClient = IOClient(HttpClient());
  var response = await ioClient.get("$atomUrl");
  return AtomFeed.parse(response.body);
}

Future<RssFeed> getRss(String rssUrl) async {
  IOClient ioClient = IOClient(HttpClient());
  var response = await ioClient.get("$rssUrl");
  return RssFeed.parse(response.body);
}
