import 'dart:convert';
import 'dart:io';

/// This class handle the connections through stormshield, aka the gateway.
class GatewayAPI {
  final _client = HttpClient();
  String cookie;

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
  /// You can use [autoLogin] like this:
  ///
  /// ```
  /// String cookie = await autoLogin("MyName", "MyPassword", "10.163.0.2", 480) // "28800 seconds left"
  /// ```
  Future<String> autoLogin(
      String uid, String pswd, String selectedUrl, int selectedTime) async {
    var status = "";

    _client.badCertificateCallback = (cert, host, port) => true;

    try {
      // SessionId
      var data = "uid=$uid&time=$selectedTime&pswd=$pswd";
      HttpClientRequest request = await _client
          .postUrl(Uri.parse('https://$selectedUrl/auth/plain.html'))
        ..headers.contentType = ContentType(
          "application",
          "x-www-form-urlencoded",
          charset: 'utf-8',
        )
        ..headers.set(HttpHeaders.cookieHeader, "lang=us; disclaimer=1;")
        ..headers.contentLength = data.length // Needed
        ..write(data);
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        var body =
            await response.cast<List<int>>().transform(utf8.decoder).join();
        if (body.contains('title_error')) {
          throw ("Error: Bad Username or Password");
        } else {
          var temp = response.headers['set-cookie'].toString();
          var netasq_user =
              RegExp(r'NETASQ_USER=([^;]*);').firstMatch(temp).group(0);
          status = netasq_user;
          cookie = netasq_user;
        }
      } else {
        throw Exception("HttpError: ${response.statusCode}");
      }
    } catch (e) {
      status = e.toString();
    }

    print(status);
    return status;
  }

  /// Disconnect from the portal.
  ///
  /// ```
  /// String status = await disconnectGateway("172.17.0.1") // "You have logged out"
  /// ```
  Future<String> disconnectGateway(String selectedUrl, {String cookie}) async {
    var url =
        'https://$selectedUrl/auth/auth.html?url=&uid=&time=480&logout=D%C3%A9connexion';
    var status = "";
    var _cookie = "lang=us; ";
    _cookie += cookie ?? "";

    _client.badCertificateCallback = (cert, host, port) => true;

    try {
      HttpClientRequest request = await _client.getUrl(Uri.parse(url))
        ..headers.set(HttpHeaders.cookieHeader, _cookie)
        ..headers.removeAll(HttpHeaders.contentLengthHeader);
      HttpClientResponse response = await request.close();
      var body =
          await response.cast<List<int>>().transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        status = body.contains('title_success')
            ? 'You have logged out'
            : "Disconnection failed.";
      } else {
        throw Exception("HttpError: ${response.statusCode}");
      }
    } catch (e) {
      status = e.toString();
    }

    return status;
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
  ///
  /// If a cookie is available, (for example in the API), you can do this :
  ///
  /// ```
  /// var _gateway = GatewayAPI();
  /// await autoLogin("MyName", "MyPassword", "10.163.0.2", 480) // "28800 seconds left"
  /// String status = await getStatus("172.17.0.1", cookie: _gateway.cookie) // "x seconds left"
  /// ```
  ///
  Future<String> getStatus(String selectedUrl, {String cookie}) async {
    var status = "";
    _client.badCertificateCallback = (cert, host, port) => true;
    var url = 'https://$selectedUrl/auth/login.html';
    RegExp exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');

    try {
      var _cookie = "lang=us; ";
      _cookie += cookie ?? "";
      HttpClientRequest request = await _client.getUrl(Uri.parse(url))
        ..headers.set(HttpHeaders.cookieHeader, _cookie)
        ..headers.removeAll(HttpHeaders.contentLengthHeader);

      HttpClientResponse response = await request.close();
      var body =
          await response.cast<List<int>>().transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        if (!body.contains('l_rtime')) {
          throw "Not logged in";
        } else {
          var match = exp.firstMatch(body).group(1);
          if (match is! String) {
            throw Exception(
                "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
          } else {
            status = '$match secondes restantes';
          }
        }
      } else {
        throw Exception("HttpError: ${response.statusCode}");
      }
    } catch (e) {
      status = e.toString();
    }

    return status;
  }
}
