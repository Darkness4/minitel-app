import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';

/// Calendar Url "API"
abstract class CalendarURLRemoteDataSource {
  /// Get .ics url from network.
  Future<String> getCalendarURL({
    @required String username,
    @required String password,
  });
}

/// Calendar Url "API"
@LazySingleton(as: CalendarURLRemoteDataSource)
class CalendarURLRemoteDataSourceImpl implements CalendarURLRemoteDataSource {
  final http.Client client;

  const CalendarURLRemoteDataSourceImpl({@required this.client});

  /// Get from EMSE the url to get the ical
  @override
  Future<String> getCalendarURL({String username, String password}) async {
    final Cookie phpSessionIDCAS = await _fetchCasCookie(
      username: username,
      password: password,
    );

    final String calendarUrl = await _fetchCalendarUrl(phpSessionIDCAS);
    return calendarUrl;
  }

  Future<String> _fetchCalendarUrl(Cookie phpSessionIDCAS) async {
    final http.Response response = await client.get(
      "https://portail.emse.fr/ics/",
      headers: {
        HttpHeaders.cookieHeader:
            "${phpSessionIDCAS.name}=${phpSessionIDCAS.value}"
      },
    );
    final String calendarUrl =
        RegExp(r'https(.*)\.ics').stringMatch(response.body);
    return calendarUrl;
  }

  /// Login through EMSE CAS Authentication
  Future<Cookie> _fetchCasCookie({String username, String password}) async {
    const String referee = "https://portail.emse.fr/ics/";

    // GET CAS
    final http.Response responseCAS = await client.get(
        "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}");

    if (responseCAS.statusCode != 200) {
      throw ServerException('HTTP Error: ${responseCAS.statusCode}');
    }

    final String lt = RegExp('name="lt" value="([^"]*)"')
        .firstMatch(responseCAS.body)
        .group(1);

    final Cookie jSessionID = responseCAS.headers
        .parseSetCookie()
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
        headers: <String, String>{
          HttpHeaders.refererHeader:
              'https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}'
        });

    if (!responsePOST.headers.containsKey(HttpHeaders.locationHeader)) {
      throw ClientException('Location was not found, probably a Bad login');
    }

    final String location = responsePOST.headers[HttpHeaders.locationHeader];

    // GET CAS
    final http.Request request = http.Request('GET', Uri.parse(location))
      ..followRedirects = false;
    final responseFinal = await client.send(request);

    final Cookie phpSessionIDCAS = responseFinal.headers
        .parseSetCookie()
        .firstWhere((Cookie cookie) => cookie.name == "PHPSESSID");

    // Cookie
    return phpSessionIDCAS;
  }
}
