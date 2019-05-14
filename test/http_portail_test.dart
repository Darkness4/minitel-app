import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/funcs/http_portail.dart';

void main() {
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
      String cookie = await getPortailCookie(username: "", password: "");
      print(cookie);

      expect(cookie, contains("bad username or password"));
    });

    test('FAIL getSavedCookiePortail', () async {
      String cookie = await getSavedCookiePortail();
      print(cookie);
      expect(cookie == "", true);
    });

    test('FAIL to saveCookiePortailFromLogin', () async {
      var response =
          await saveCookiePortailFromLogin(username: "", password: "");

      expect(response, false);
    });
  });

  group('Http Requests Portail', () {
    test('Get succefully a cookie', () async {
      String cookie = await getPortailCookie(
          username: "marc.nguyen", password: "stickman963");
      print(cookie);

      expect(cookie, contains("PHPSESSID=ST"));
    });

    test('getSavedCookiePortail', () async {
      await saveCookiePortailFromLogin(
          username: "marc.nguyen", password: "stickman963");
      String cookie = await getSavedCookiePortail();
      print(cookie);
      expect(cookie, contains("PHPSESSID=ST"));
    });

    test('saveCookiePortailFromLogin', () async {
      var response = await saveCookiePortailFromLogin(
          username: "marc.nguyen", password: "stickman963");

      expect(response, true);
    });
  });
}
