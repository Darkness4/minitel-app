import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';

import '../mock_http_client.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FAIL Http Requests Portail', () {
    test('Get empty cookie', () async {
      final PortailAPI _portail = PortailAPI();
      final List<Cookie> cookies = _portail.cookies;
      expect(cookies, isEmpty);
    });

    test('FAIL to saveCookiePortailFromLogin: Bad login', () async {
      await HttpOverrides.runZoned(
        () async {
          try {
            final PortailAPI _portail = PortailAPI();
            await _portail.saveCookiePortailFromLogin(
                username: "", password: "");
            throw Exception("saveCookiePortailFromLogin shouldn't work here");
          } on Exception catch (e) {
            expect(e.toString(), contains("bad username or password"));
          }
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(
                    "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin"):
                utf8.encode(
                    'name="lt" value="value1",\naction="/thisisafakeaction"'),
            Uri.parse("https://cas.emse.fr/thisisafakeaction"):
                utf8.encode('value2'),
          },
          cookies: <Cookie>[
            Cookie("JSESSIONID", ""),
          ],
        ),
      );
    });
  });

  group('Http Requests Portail', () {
    test('getSavedCookiePortail', () async {
      await HttpOverrides.runZoned(
        () async {
          final PortailAPI _portail = PortailAPI();
          await _portail.saveCookiePortailFromLogin(
              username: "marc.nguyen",
              password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
          final List<Cookie> cookies = _portail.cookies;
          expect(cookies.map((Cookie cookie) => cookie.name).toList(),
              contains("portail_ent_emse_session"));
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(
                    "https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin"):
                utf8.encode(
                    'name="lt" value="value1",\naction="/thisisafakeaction"'),
            Uri.parse("https://cas.emse.fr/thisisafakeaction"): utf8.encode(''),
          },
          cookies: <Cookie>[
            Cookie("JSESSIONID", ""),
            Cookie("AGIMUS", ""),
            Cookie("CASAuth", ""),
            Cookie("laravel_token", ""),
            Cookie("XSRF-TOKEN", ""),
            Cookie("portail_ent_emse_session", ""),
          ],
          customHeaders: <String, String>{
            HttpHeaders.locationHeader: 'https//cas.emse.fr/customendpoint'
          },
        ),
      );
    });
  });
}
