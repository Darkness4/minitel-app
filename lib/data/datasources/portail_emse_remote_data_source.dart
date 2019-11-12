import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/funcs.dart';

abstract class PortailEMSERemoteDataSource {
  /// Login to portail EMSE
  Future<List<Cookie>> login({String username, String password});
}

/// HTTP requests handler for EMSE Portal
class PortailEMSERemoteDataSourceImpl implements PortailEMSERemoteDataSource {
  final http.Client client;
  final List<Cookie> cookies;

  PortailEMSERemoteDataSourceImpl({
    @required this.client,
    @required this.cookies,
  });

  @override
  Future<List<Cookie>> login({String username, String password}) async {
    try {
      final response = await client.get(
          "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin");
      cookies.clear();

      final String lt = RegExp(r'name="lt" value="([^"]*)"')
          .firstMatch(response.body)
          .group(1);
      final String action =
          RegExp(r'action="([^"]*)"').firstMatch(response.body).group(1);

      final Cookie jSessionIDCampus =
          CookieUtils.parseSetCookie(response.headers)
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

      if (!response2.headers[HttpHeaders.setCookieHeader].contains('AGIMUS')) {
        throw Exception("AGIMUS not found. Maybe bad username or password.");
      }

      final listCookies2 = CookieUtils.parseSetCookie(response2.headers);
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

      final Cookie casAuth = CookieUtils.parseSetCookie(response3.headers)
          .firstWhere((Cookie cookie) => cookie.name == "CASAuth");
      location = response3.headers[HttpHeaders.locationHeader];

      final response4 = await client.get(location, headers: {
        HttpHeaders.cookieHeader: '${agimus.name}=${agimus.value}; '
            '${casAuth.name}=${casAuth.value}'
      });

      final listCookies4 = CookieUtils.parseSetCookie(response4.headers);
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

      return <Cookie>[
        agimus,
        casAuth,
        laravelToken,
        xsrfToken,
        portailEntEmseSession
      ];
    } on Exception {
      cookies.clear();
      rethrow;
    }
  }
}
