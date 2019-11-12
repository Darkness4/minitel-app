import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/funcs.dart';
import 'package:minitel_toolbox/data/models/stormshield_model.dart';

abstract class StormshieldRemoteDataSource {
  /// Login to stormshield
  Future<void> login(
      String uid, String pswd, String selectedUrl, int selectedTime);

  /// Logout from stormshield
  Future<void> logout(String selectedUrl);

  /// Fetch status from stormshield
  Future<StormshieldModel> fetchStatus(String selectedUrl);
}

/// This class handle the connections through stormshield, aka the gateway.
class StormshieldRemoteDataSourceImpl implements StormshieldRemoteDataSource {
  final http.Client clientNoCheck;

  Cookie cookie;

  StormshieldRemoteDataSourceImpl({
    @required this.clientNoCheck,
    @required this.cookie,
  });

  /// Connect to the portal.
  ///
  /// The [selectedUrl] is either local (10.163.0.2) or public (fw-cgcp.emse.fr).
  /// Be aware, if the local DNS can forward the public address to the local.
  /// Be also aware, if the local gateway can forward to the server (195.83.139.7).
  /// The [uid] and [pswd] correspond to the Username and Password.
  /// The [selectedTime] is listed on the website and is in minutes.
  ///
  /// If connected, the response will be the cookie of the user.
  /// **The cookie will be also stored in the API object !**
  /// If a response is received, it will be manually decrypted using RegEx like
  /// "Bad Username or Password".
  /// If no response is received, the HTTP error will be outputted.
  ///
  /// You can use [login] like this:
  ///
  /// ```
  /// String cookie = await login("MyName", "MyPassword", "10.163.0.2", 480) // "28800 seconds left"
  /// ```
  @override
  Future<void> login(
      String uid, String pswd, String selectedUrl, int selectedTime) async {
    // SessionId
    final Map<String, String> data = {
      'uid': uid,
      'time': selectedTime.toString(),
      'pswd': pswd,
    };
    final response = await clientNoCheck.post(
      'https://$selectedUrl/auth/plain.html',
      headers: <String, String>{
        HttpHeaders.cookieHeader: 'disclaimer=1;',
      },
      body: data,
    );
    if (response.statusCode == 200) {
      if (response.body.contains('title_error')) {
        throw ClientException('Bad Username or Password');
      } else {
        if (response.headers[HttpHeaders.setCookieHeader]
            .contains("NETASQ_USER")) {
          final Cookie netasq_user =
              CookieUtils.parseSetCookie(response.headers)
                  .firstWhere((Cookie cookie) => cookie.name == "NETASQ_USER");
          cookie = netasq_user;
        }
      }
    } else {
      throw ServerException(response.statusCode);
    }
  }

  /// Disconnect from the portal.
  ///
  /// ```
  /// String status = await disconnectGateway("172.17.0.1") // "You have logged out"
  /// ```
  @override
  Future<void> logout(String selectedUrl) async {
    final String url =
        'https://$selectedUrl/auth/auth.html?url=&uid=&time=480&logout=D%C3%A9connexion';

    Map<String, String> headers;
    if (cookie != null) {
      headers = {HttpHeaders.cookieHeader: cookie.toString()};
    }
    final response = await clientNoCheck.get(url, headers: headers);

    if (response.statusCode == 200) {
      if (!response.body.contains('title_success')) {
        throw ClientException("Couldn't log out");
      }
    } else {
      throw ServerException(response.statusCode);
    }
  }

  /// Get the connection status of the portal.
  ///
  /// The [selectedUrl] is either local (10.163.0.2) or public (fw-cgcp.emse.fr).
  /// Be aware, if the local DNS can forward the public address to the local.
  /// Be also aware, if the local gateway can forward to the server (195.83.139.7).
  ///
  /// If connected, the response will be "[time] seconds left".
  /// If not, the response will be "Non connecté"
  /// If no response is received, the HTTP error will be outputted.
  ///
  /// You can use [fetchStatus] like this:
  ///
  /// ```
  /// String status = await getStatus("172.17.0.1") // "x seconds left"
  /// ```
  ///
  /// If a cookie is available, (for example in the API), you can do this :
  ///
  /// ```
  /// var _gateway = GatewayAPI();
  /// await autoLogin("MyName", "MyPassword", "10.163.0.2", 480) // "28800 seconds left"
  /// String status = await getStatus("172.17.0.1", cookie: _gateway.cookie) // "x seconds left"
  /// ```
  ///
  @override
  Future<StormshieldModel> fetchStatus(String selectedUrl) async {
    String status = "";

    final String url = 'https://$selectedUrl/auth/login.html';
    final RegExp exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');

    Map<String, String> headers;
    if (cookie != null) {
      headers = {HttpHeaders.cookieHeader: cookie.toString()};
    }
    final response = await clientNoCheck.get(url, headers: headers);

    if (response.statusCode == 200) {
      if (!response.body.contains('l_rtime')) {
        throw NotLoggedInException();
      } else {
        final String match = exp.firstMatch(response.body).group(1);
        status = match;
      }
    } else {
      throw ServerException(response.statusCode);
    }

    return StormshieldModel(
      status: status,
      cookie: cookie,
    );
  }
}
