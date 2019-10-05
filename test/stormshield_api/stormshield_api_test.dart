import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';

import '../mock_http_client.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Http Requests', () {
    test('Bad Username or Password to 195.83.139.7', () async {
      await HttpOverrides.runZoned(
        () async {
          try {
            final StormshieldAPI _stormshieldAPI = StormshieldAPI();
            await _stormshieldAPI.login("", "", "195.83.139.7", 480);
            throw Exception("autoLogin did not throw");
          } catch (e) {
            expect(e.toString(), contains("Bad Username or Password"));
          }
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse("https://195.83.139.7/auth/plain.html"):
                utf8.encode('title_error'),
          },
        ),
      );
    });

    test('Bad Username and Password to google.fr to get HttpError', () async {
      try {
        final StormshieldAPI _stormshieldAPI = StormshieldAPI();
        await _stormshieldAPI.login("", "", "google.fr", 0);
        throw Exception("autoLogin did not throw");
      } catch (e) {
        expect(e.toString(), contains("HttpError"));
      }
    });

    test('Get status Not logged in from 195.83.139.7', () async {
      await HttpOverrides.runZoned(
        () async {
          final StormshieldAPI _stormshieldAPI = StormshieldAPI();
          await _stormshieldAPI.logOut("195.83.139.7");
          try {
            await _stormshieldAPI.fetchStatus("195.83.139.7");
            expect(true, isFalse);
          } on NotLoggedInException catch (e) {
            final String status = e.toString();
            print(status);

            expect(status, contains("Not logged in"));
          }
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(
                    "https://195.83.139.7/auth/auth.html?url=&uid=&time=480&logout=D%C3%A9connexion"):
                utf8.encode('title_success'),
            Uri.parse("https://195.83.139.7/auth/login.html"): utf8.encode(''),
          },
        ),
      );
    });

    test('Get status SUCCESS from 195.83.139.7', () async {
      await HttpOverrides.runZoned(
        () async {
          final StormshieldAPI _stormshieldAPI = StormshieldAPI();
          final Cookie cookie = await _stormshieldAPI.login("marc.nguyen",
              utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
          final String statusFromReturn =
              await _stormshieldAPI.fetchStatus("195.83.139.7", cookie: cookie);
          final String statusFromApi = await _stormshieldAPI
              .fetchStatus("195.83.139.7", cookie: _stormshieldAPI.cookie);

          expect(statusFromApi, contains("12345"));
          expect(statusFromReturn, contains("12345"));
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse("https://195.83.139.7/auth/plain.html"):
                utf8.encode('title_success'),
            Uri.parse("https://195.83.139.7/auth/login.html"):
                utf8.encode('<span id="l_rtime">12345<\/span>'),
          },
          cookies: <Cookie>[
            Cookie('NETASQ_USER', ''),
          ],
        ),
      );
    });

    test('Get status intentionaly from google.fr to get error', () async {
      final StormshieldAPI _stormshieldAPI = StormshieldAPI();
      try {
        await _stormshieldAPI.fetchStatus("www.google.fr");
      } on HttpException catch (e) {
        final String status = e.toString();
        print(status);

        expect(status, contains("HttpError"));
      }
    });

    test('Disconnect intentionaly from google.fr to get error', () async {
      final StormshieldAPI _stormshieldAPI = StormshieldAPI();
      final String status = await _stormshieldAPI.logOut("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect from 195.83.139.7', () async {
      await HttpOverrides.runZoned(
        () async {
          final StormshieldAPI _stormshieldAPI = StormshieldAPI();
          final Cookie cookie = await _stormshieldAPI.login("marc.nguyen",
              utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
          final String status =
              await _stormshieldAPI.logOut("195.83.139.7", cookie: cookie);
          print(status);

          expect(status.contains("You have logged out"), true);
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse("https://195.83.139.7/auth/plain.html"):
                utf8.encode('title_success'),
            Uri.parse(
                    "https://195.83.139.7/auth/auth.html?url=&uid=&time=480&logout=D%C3%A9connexion"):
                utf8.encode('title_success'),
          },
          cookies: <Cookie>[
            Cookie('NETASQ_USER', ''),
          ],
        ),
      );
    });

    test('Good Username and Password to 195.83.139.7', () async {
      await HttpOverrides.runZoned(
        () async {
          final StormshieldAPI _stormshieldAPI = StormshieldAPI();
          final Cookie status = await _stormshieldAPI.login("marc.nguyen",
              utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
          print(status);

          expect(status.name, equals("NETASQ_USER"));
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse("https://195.83.139.7/auth/plain.html"):
                utf8.encode('title_success'),
          },
          cookies: <Cookie>[
            Cookie('NETASQ_USER', ''),
          ],
        ),
      );
    });
  });
}
