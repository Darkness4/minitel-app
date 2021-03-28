import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/cookies/cookie_manager.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';

abstract class PortailEMSERemoteDataSource {
  /// Get list of cookies
  List<Cookie> get cookies;

  /// Login to portail EMSE
  Future<List<Cookie>> login(
      {required String username, required String password});
}

/// HTTP requests handler for EMSE Portal
@LazySingleton(as: PortailEMSERemoteDataSource)
class PortailEMSERemoteDataSourceImpl implements PortailEMSERemoteDataSource {
  final http.Client client;
  final CookieManager cookieManager;

  const PortailEMSERemoteDataSourceImpl({
    required this.client,
    required this.cookieManager,
  });

  @override
  List<Cookie> get cookies => cookieManager.portailCookies;

  @override
  Future<List<Cookie>> login(
      {required String username, required String password}) async {
    String action;
    String lt;
    Cookie jSessionIDCampus;
    try {
      {
        final response = await client.get(Uri.parse(
            'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin'));
        cookies.clear();

        if (response.statusCode != HttpStatus.ok) {
          throw ServerException(
              'HTTP Status Code : ${response.statusCode} ${response.reasonPhrase}\n${response.body} ${response.reasonPhrase}');
        }

        lt = RegExp('name="lt" value="([^"]*)"')
            .firstMatch(response.body)!
            .group(1)!;
        action =
            RegExp('action="([^"]*)"').firstMatch(response.body)!.group(1)!;

        jSessionIDCampus = response.headers.parseSetCookie().firstWhere(
              (Cookie cookie) => cookie.name == 'JSESSIONID',
              orElse: () =>
                  throw ServerException('JSESSIONID Cookie not found.'),
            );
      }

      String location;
      Cookie agimus;
      Cookie casPrivacy;
      Cookie casGC;
      {
        final data = <String, String>{
          'username': username,
          'password': password,
          'lt': lt,
          'execution': 'e1s1',
          '_eventId': 'submit',
        };

        final response = await client.send(
          http.Request('POST', Uri.parse('https://cas.emse.fr$action'))
            ..followRedirects = false
            ..bodyFields = data
            ..headers[HttpHeaders.cookieHeader] =
                '${jSessionIDCampus.name}=${jSessionIDCampus.value}',
        );

        if (response.statusCode != HttpStatus.movedTemporarily) {
          throw ServerException(
              'HTTP Status Code : ${response.statusCode} ${response.reasonPhrase}');
        }

        if (!response.headers[HttpHeaders.setCookieHeader]!
            .contains('AGIMUS')) {
          throw ClientException(
              'AGIMUS not found. Maybe bad username or password.');
        }

        final listCookies = response.headers.parseSetCookie();
        agimus = listCookies.firstWhere(
          (cookie) => cookie.name == 'AGIMUS',
          orElse: () => throw ServerException('AGIMUS Cookie not found.'),
        );
        casPrivacy = listCookies.firstWhere(
          (cookie) => cookie.name == 'CASPRIVACY',
          orElse: () => throw ServerException('CASPRIVACY Cookie not found.'),
        );
        casGC = listCookies.firstWhere(
          (cookie) => cookie.name == 'CASTGC',
          orElse: () => throw ServerException('CASTGC Cookie not found.'),
        );

        location = response.headers[HttpHeaders.locationHeader]!;
      }

      Cookie casAuth;
      {
        final response = await client.send(
          http.Request('GET', Uri.parse(location))
            ..followRedirects = false
            ..headers[HttpHeaders.cookieHeader] =
                '${agimus.name}=${agimus.value}; '
                    '${casPrivacy.name}=${casPrivacy.value}; '
                    '${casGC.name}=${casGC.value}',
        );

        if (response.statusCode != 302) {
          throw ServerException(
              'HTTP Status Code : ${response.statusCode} ${response.reasonPhrase}');
        }

        casAuth = response.headers.parseSetCookie().firstWhere(
              (cookie) => cookie.name == 'CASAuth',
              orElse: () => throw ServerException('CASAuth Cookie not found.'),
            );
        location = response.headers[HttpHeaders.locationHeader]!;
      }

      Cookie laravelToken;
      Cookie xsrfToken;
      Cookie portailEntEmseSession;
      {
        final response = await client.get(Uri.parse(location), headers: {
          HttpHeaders.cookieHeader: '${agimus.name}=${agimus.value}; '
              '${casAuth.name}=${casAuth.value}'
        });

        if (response.statusCode != 200) {
          throw ServerException(
              'HTTP Status Code : ${response.statusCode} ${response.reasonPhrase}');
        }

        final listCookies = response.headers.parseSetCookie();
        laravelToken = listCookies.firstWhere(
          (cookie) => cookie.name == 'laravel_token',
          orElse: () =>
              throw ServerException('laravel_token Cookie not found.'),
        );
        xsrfToken = listCookies.firstWhere(
          (cookie) => cookie.name == 'XSRF-TOKEN',
          orElse: () => throw ServerException('XSRF-TOKEN Cookie not found.'),
        );
        portailEntEmseSession = listCookies.firstWhere(
          (cookie) => cookie.name == 'portail_ent_emse_session',
          orElse: () => throw ServerException(
              'portail_ent_emse_session Cookie not found.'),
        );
      }

      cookies.addAll([
        agimus,
        casAuth,
        laravelToken,
        xsrfToken,
        portailEntEmseSession,
      ]);

      return cookies;
    } on Exception {
      cookies.clear();
      rethrow;
    }
  }
}
