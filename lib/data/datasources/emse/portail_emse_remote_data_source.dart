import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';

abstract class PortailEMSERemoteDataSource {
  /// Login to portail EMSE
  Future<List<Cookie>> login({String username, String password});

  /// Get list of cookies
  List<Cookie> get cookies;
}

/// HTTP requests handler for EMSE Portal
class PortailEMSERemoteDataSourceImpl implements PortailEMSERemoteDataSource {
  final http.Client client;

  @override
  final List<Cookie> cookies;

  const PortailEMSERemoteDataSourceImpl({
    @required this.client,
    @required this.cookies,
  });

  @override
  Future<List<Cookie>> login({String username, String password}) async {
    try {
      final response = await client.get(
          "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin");
      cookies.clear();

      if (response.statusCode != 200) {
        throw ServerException(
            "HTTP Status Code : ${response.statusCode} ${response.reasonPhrase}");
      }

      final String lt = RegExp(r'name="lt" value="([^"]*)"')
          .firstMatch(response.body)
          .group(1);
      final String action =
          RegExp(r'action="([^"]*)"').firstMatch(response.body).group(1);

      final Cookie jSessionIDCampus = response.headers
          .parseSetCookie()
          .firstWhere((Cookie cookie) => cookie.name == "JSESSIONID");

      final Map<String, String> data = {
        'username': username,
        'password': password,
        'lt': lt,
        'execution': 'e1s1',
        '_eventId': 'submit',
      };

      final response2 = await client.send(
        http.Request('POST', Uri.parse("https://cas.emse.fr$action"))
          ..followRedirects = false
          ..bodyFields = data
          ..headers[HttpHeaders.cookieHeader] =
              '${jSessionIDCampus.name}=${jSessionIDCampus.value}',
      );

      if (response2.statusCode != 302) {
        throw ServerException(
            "HTTP Status Code : ${response2.statusCode} ${response2.reasonPhrase}");
      }

      if (!response2.headers[HttpHeaders.setCookieHeader].contains('AGIMUS')) {
        throw ClientException(
            "AGIMUS not found. Maybe bad username or password.");
      }

      final listCookies2 = response2.headers.parseSetCookie();
      final Cookie agimus =
          listCookies2.firstWhere((Cookie cookie) => cookie.name == "AGIMUS");
      final Cookie casPrivacy = listCookies2
          .firstWhere((Cookie cookie) => cookie.name == "CASPRIVACY");
      final Cookie casGC =
          listCookies2.firstWhere((Cookie cookie) => cookie.name == "CASTGC");

      String location = response2.headers[HttpHeaders.locationHeader];

      final response3 = await client.send(
        http.Request('GET', Uri.parse(location))
          ..followRedirects = false
          ..headers[HttpHeaders.cookieHeader] =
              '${agimus.name}=${agimus.value}; '
                  '${casPrivacy.name}=${casPrivacy.value}; '
                  '${casGC.name}=${casGC.value}',
      );

      if (response3.statusCode != 302) {
        throw ServerException(
            "HTTP Status Code : ${response3.statusCode} ${response3.reasonPhrase}");
      }

      final Cookie casAuth = response3.headers
          .parseSetCookie()
          .firstWhere((Cookie cookie) => cookie.name == "CASAuth");
      location = response3.headers[HttpHeaders.locationHeader];

      final response4 = await client.get(location, headers: {
        HttpHeaders.cookieHeader: '${agimus.name}=${agimus.value}; '
            '${casAuth.name}=${casAuth.value}'
      });

      if (response4.statusCode != 200) {
        throw ServerException(
            "HTTP Status Code : ${response4.statusCode} ${response4.reasonPhrase}");
      }

      final listCookies4 = response4.headers.parseSetCookie();
      final Cookie laravelToken = listCookies4
          .firstWhere((Cookie cookie) => cookie.name == "laravel_token");
      final Cookie xsrfToken = listCookies4
          .firstWhere((Cookie cookie) => cookie.name == "XSRF-TOKEN");
      final Cookie portailEntEmseSession = listCookies4.firstWhere(
          (Cookie cookie) => cookie.name == "portail_ent_emse_session");

      cookies.addAll(<Cookie>[
        agimus,
        casAuth,
        laravelToken,
        xsrfToken,
        portailEntEmseSession
      ]);

      return cookies;
    } on Exception {
      cookies.clear();
      rethrow;
    }
  }
}
