import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';

void main() {
  final PortailAPI _portail = PortailAPI();

  group('FAIL Http Requests Portail', () {
    test('Get empty cookie', () async {
      final List<Cookie> cookies = _portail.cookies;
      expect(cookies, isEmpty);
    });

    test('FAIL to saveCookiePortailFromLogin: Bad login', () async {
      try {
        await _portail.saveCookiePortailFromLogin(username: "", password: "");
        throw Exception("saveCookiePortailFromLogin shouldn't work here");
      } on Exception catch (e) {
        expect(e.toString(), contains("bad username or password"));
      }
    });
  });

  group('Http Requests Portail', () {
    test('getSavedCookiePortail', () async {
      await _portail.saveCookiePortailFromLogin(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      final List<Cookie> cookies = _portail.cookies;
      expect(cookies.map((Cookie cookie) => cookie.name).toList(),
          contains("portail_ent_emse_session"));
    });
  });
}
