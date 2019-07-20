import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';

void main() {
  final PortailAPI _portail = PortailAPI();
  setUpAll(() async {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
  });

  group('FAIL Http Requests Portail', () {
    test('Fail succefully to get a cookie: Bad login', () async {
      String cookie =
          await _portail.getPortailCookie(username: "", password: "");
      print(cookie);

      expect(cookie, contains("bad username or password"));
    });

    test('FAIL getSavedCookiePortail', () async {
      String cookie = await _portail.getSavedCookiePortail();
      print(cookie);
      expect(cookie == "", true);
    });

    test('FAIL to saveCookiePortailFromLogin', () async {
      var response =
          await _portail.saveCookiePortailFromLogin(username: "", password: "");

      expect(response, false);
    });
  });

  group('Http Requests Portail', () {
    test('Get succefully a cookie', () async {
      String cookie = await _portail.getPortailCookie(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")));
      print(cookie);

      expect(cookie, contains("portail_ent_emse_session"));
    });

    test('getSavedCookiePortail', () async {
      await _portail.saveCookiePortailFromLogin(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")));
      String cookie = await _portail.getSavedCookiePortail();
      print(cookie);
      expect(cookie, contains("portail_ent_emse_session"));
    });

    test('saveCookiePortailFromLogin', () async {
      var response = await _portail.saveCookiePortailFromLogin(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")));

      expect(response, true);
    });
  });
}
