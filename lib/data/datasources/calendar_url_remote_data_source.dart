import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/funcs.dart';

/// Calendar Url "API"
abstract class CalendarURLRemoteDataSource {
  /// Get .ics url from network.
  Future<String> getCalendarURL({
    @required String username,
    @required String password,
  });
}

/// Calendar Url "API"
class CalendarURLRemoteDataSourceImpl implements CalendarURLRemoteDataSource {
  final http.Client client;

  const CalendarURLRemoteDataSourceImpl({@required this.client});

  /// Get from EMSE the url to get the ical
  @override
  Future<String> getCalendarURL({String username, String password}) async {
    final Cookie phpSessionIDCAS = await _bypassCAS(
      username: username,
      password: password,
    );

    final http.Response response = await client.post(
      "https://portail.emse.fr/ics/",
      headers: {HttpHeaders.cookieHeader: phpSessionIDCAS.toString()},
    );
    return RegExp(r'https(.*)\.ics').stringMatch(response.body);
  }

  /// Login through EMSE CAS Authentication
  Future<Cookie> _bypassCAS({String username, String password}) async {
    const String referee = "https://portail.emse.fr/ics/";

    // GET CAS
    final http.Response responseCAS = await client.get(
        "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}");

    if (responseCAS.statusCode != 200) {
      throw ServerException('HTTP Error: ${responseCAS.statusCode}');
    }

    final String lt = RegExp(r'name="lt" value="([^"]*)"')
        .firstMatch(responseCAS.body)
        .group(1);

    final Cookie jSessionID = CookieUtils.parseSetCookie(responseCAS.headers)
        .firstWhere((Cookie cookie) => cookie.name == "JSESSIONID");

    // POST CAS
    final Map<String, String> data = {
      'username': username,
      'password': password,
      'lt': lt,
      'execution': 'e1s1',
      '_eventId': 'submit',
    };
    final http.Response responsePOST = await client.post(
        'https://cas.emse.fr/login;jsessionid=${jSessionID.value}?service=${Uri.encodeComponent(referee)}',
        body: data,
        headers: {
          HttpHeaders.cookieHeader: jSessionID.toString(),
          HttpHeaders.refererHeader:
              'https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}'
        });

    final String location = responsePOST.headers[HttpHeaders.locationHeader];

    if (location == "null") {
      throw ClientException('Location was not found, probably a Bad login');
    }

    // GET CAS
    final http.Request request = http.Request('GET', Uri.parse(location))
      ..followRedirects = false;
    final responseFinal = await request.send();

    final Cookie phpSessionIDCAS =
        CookieUtils.parseSetCookie(responseFinal.headers)
            .firstWhere((Cookie cookie) => cookie.name == "PHPSESSID");

    // Cookie
    return phpSessionIDCAS;
  }
}
