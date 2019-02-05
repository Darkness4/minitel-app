import 'dart:io';

import 'package:http/io_client.dart';

/// Get the connection status of the portal.
///
/// The [selectedUrl] is either local (172.17.0.1) or public (fw-cgcp.emse.fr).
/// Be aware, if the local DNS can forward the public address to the local.
/// Be also aware, if the local gateway can forward to the server (195.83.139.7).
///
/// If connected, the response will be "[Duration] seconds left".
/// If not, the response will be "Not logged in"
/// If no response is received, the HTTP error will be outputted.
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
      .post(url) // TODO: GET instead of POST
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

Future<String> autoLogin(
    String uid, String pswd, String selectedUrl, int selectedTime) async {
  var status = "";

  HttpClient client = HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) =>
          true); // SECURITY WARNING  Bypass certificate!!!
  IOClient ioClient = IOClient(client);

  print("1");
  try {
    print("2");
    var sessionId = await ioClient.post("https://$selectedUrl/auth/plain.html",
        body: {
          'uid': uid,
          'time': '$selectedTime',
          'pswd': pswd
        }).then((response) {
      // debugPrint(response.body);
      print("3");
      if (response.statusCode == 200) {
        if (response.body.contains('title_error'))
          throw ("Error: Bad Username or Password");
        else
          return response.body;
      } else
        throw Exception("HttpError: ${response.statusCode}");
    }).then((body) {
      return RegExp(r'"(id=([^"]*))') // SessionId finder.
          .firstMatch(body)
          .group(1);
    }).then((match) {
      if (match is! String)
        throw Exception(
            "Error: SessionId doesn't exist. Please check if the RegEx is updated.");
      else
        return match; // This is the SessionId.
    });

    print("4");
    status = await ioClient.post("https://$selectedUrl/auth/disclaimer.html",
        body: {
          'session': sessionId,
          'read': 'accepted',
          'action': "J'accepte"
        }).then((response) {
      print("5");
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

  print("End");
  return status;
}
