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
      bool result;
      try {
        await _portail.getPortailCookie(username: "", password: "");
        result = false;
      } on Exception catch (e) {
        result = e.toString().contains("bad username or password");
      }
      return result;
    });

    test('FAIL getSavedCookiePortail', () async {
      String cookie = await _portail.getSavedCookiePortail();
      print(cookie);
      expect(cookie == "", true);
    });

    test('FAIL to saveCookiePortailFromLogin', () async {
      try {
        await _portail.saveCookiePortailFromLogin(username: "", password: "");
        throw "saveCookiePortailFromLogin shouldn't work here";
      } on Exception catch (e) {
        expect(e.toString(), contains("bad username or password"));
      }
    });
  });

  group('Http Requests Portail', () {
    test('Get succefully a cookie', () async {
      String cookie = await _portail.getPortailCookie(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      print(cookie);

      expect(cookie, contains("portail_ent_emse_session"));
    });

    test('getSavedCookiePortail', () async {
      await _portail.saveCookiePortailFromLogin(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      String cookie = await _portail.getSavedCookiePortail();
      print(cookie);
      expect(cookie, contains("portail_ent_emse_session"));
    });

    test('saveCookiePortailFromLogin', () async {
      var response = await _portail.saveCookiePortailFromLogin(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));

      expect(response, true);
    });
  });
}
