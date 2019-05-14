import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/funcs/http_campus.dart';

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

  group('FAIL Http Requests Campus', () {
    test('Fail succefully to get a cookie: Bad login', () async {
      String cookie = await getCampusCookie(username: "", password: "");
      print(cookie);

      expect(cookie, contains("bad username or password"));
    });

    test('FAIL getSavedCookieCampus', () async {
      String cookie = await getSavedCookieCampus();
      print(cookie);
      expect(cookie == "", true);
    });

    test('FAIL to saveCookieCampusFromLogin', () async {
      var response =
          await saveCookieCampusFromLogin(username: "", password: "");

      expect(response, false);
    });
  });

  group('Http Requests Campus', () {
    test('Get succefully a cookie', () async {
      String cookie = await getCampusCookie(
          username: "marc.nguyen", password: "stickman963");
      print(cookie);

      expect(cookie, contains("shibsession"));
    });

    test('getSavedCookieCampus', () async {
      await saveCookieCampusFromLogin(
          username: "marc.nguyen", password: "stickman963");
      String cookie = await getSavedCookieCampus();
      print(cookie);
      expect(cookie, contains("_shibsession"));
    });

    test('saveCookieCampusFromLogin', () async {
      var response = await saveCookieCampusFromLogin(
          username: "marc.nguyen", password: "stickman963");

      expect(response, true);
    });
  });
}
