import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';

/// Calendar Url "API"
abstract class CalendarURLRemoteDataSource {
  /// Get .ics url from network.
  Future<String> getCalendarURL({
    required String username,
    required String password,
  });
}

/// Calendar Url "API"
@LazySingleton(as: CalendarURLRemoteDataSource)
class CalendarURLRemoteDataSourceImpl implements CalendarURLRemoteDataSource {
  final http.Client client;

  const CalendarURLRemoteDataSourceImpl({required this.client});

  /// Get from EMSE the url to get the ical
  @override
  Future<String> getCalendarURL(
      {required String username, required String password}) async {
    final phpSessionIDCAS = await _fetchCasCookie(
      username: username,
      password: password,
    );

    return _fetchCalendarUrl(phpSessionIDCAS);
  }

  Future<String> _fetchCalendarUrl(Cookie phpSessionIDCAS) async {
    final response = await client.get(
      Uri.parse('https://portail.emse.fr/ics/'),
      headers: {
        HttpHeaders.cookieHeader:
            '${phpSessionIDCAS.name}=${phpSessionIDCAS.value}'
      },
    );
    if (response.statusCode != HttpStatus.ok) {
      throw ServerException('HTTP Error: ${response.statusCode}');
    }
    final calendarUrl = RegExp(r'https(.*)\.ics').stringMatch(response.body);
    return calendarUrl!;
  }

  /// Login through EMSE CAS Authentication
  Future<Cookie> _fetchCasCookie(
      {required String username, required String password}) async {
    final referee = Uri.encodeComponent('https://portail.emse.fr/ics/');

    // GET CAS
    String lt;
    Cookie jSessionID;
    {
      final response = await client
          .get(Uri.parse('https://cas.emse.fr/login?service=$referee'));

      if (response.statusCode != HttpStatus.ok) {
        throw ServerException('HTTP Error: ${response.statusCode}');
      }

      lt = RegExp('name="lt" value="([^"]*)"')
          .firstMatch(response.body)!
          .group(1)!;

      jSessionID = response.headers.parseSetCookie().firstWhere(
            (cookie) => cookie.name == 'JSESSIONID',
            orElse: () => throw ServerException('JSESSIONID Cookie not found.'),
          );
    }

    // POST CAS
    String location;
    {
      final data = <String, String>{
        'username': username,
        'password': password,
        'lt': lt,
        'execution': 'e1s1',
        '_eventId': 'submit',
      };
      final response = await client.post(
          Uri.parse(
              'https://cas.emse.fr/login;jsessionid=${jSessionID.value}?service=$referee'),
          body: data,
          headers: {
            HttpHeaders.refererHeader:
                'https://cas.emse.fr/login?service=$referee'
          });

      if (!response.headers.containsKey(HttpHeaders.locationHeader)) {
        throw ClientException('Location was not found, probably a Bad login');
      }

      location = response.headers[HttpHeaders.locationHeader]!;
    }

    // GET CAS
    {
      final request = http.Request('GET', Uri.parse(location))
        ..followRedirects = false;

      final response = await client.send(request);

      return response.headers.parseSetCookie().firstWhere(
            (cookie) => cookie.name == 'PHPSESSID',
            orElse: () => throw ServerException('PHPSESSID Cookie not found.'),
          );
    }
  }
}
