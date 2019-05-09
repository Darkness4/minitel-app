import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/funcs/http_calendar.dart';

void main() {
  setUpAll(() async {
    // Create a temporary directory to work with
    final directory = await Directory.systemTemp.createTemp();

    // Mock out the MethodChannel for the path_provider plugin
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      // If you're getting the apps documents directory, return the path to the
      // temp directory on the test environment instead.
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });

  group('Http calendar', () {
    test('bypassCAS', () async {
      var phpSessionId = await bypassCAS(
        username: "marc.nguyen",
        password: "stickman963",
        referee: "https://portail.emse.fr/ics/",
      );
      print(phpSessionId);

      expect(phpSessionId, contains("ST"));
    });

    test('getCalendar', () async {
      var phpSessionId = await bypassCAS(
        username: "marc.nguyen",
        password: "stickman963",
        referee: "https://portail.emse.fr/ics/",
      );
      print(phpSessionId);

      var icsUrl = await getCalendarURL(
        phpSessionIDCAS: phpSessionId,
        url: "https://portail.emse.fr/ics/",
      );
      print(icsUrl);

      expect(icsUrl, contains("https://portail.emse.fr/ics/"));
      expect(icsUrl, contains(".ics"));
    });

    test('saveCalendar', () async {
      var response = await saveCalendarFromLogin(
          username: "marc.nguyen", password: "stickman963");

      expect(response, true);
    });

    test('FAIL to saveCalendar', () async {
      var response = await saveCalendarFromLogin(username: "", password: "");

      expect(response, false);
    });

    test('FAIL to bypassCAS', () async {
      var phpSessionId = await bypassCAS(
        username: "",
        password: "",
        referee: "https://portail.emse.fr/ics/",
      );

      print(phpSessionId);

      expect(phpSessionId, "Error : Bad login");
    });

    test('saveCalendarFromLogin', () async {
      await saveCalendarFromLogin(
          username: "marc.nguyen", password: "stickman963");
      print(await readCalendar());
    });

    test('saveCalendarFromUrl', () async {
      var phpSessionId = await bypassCAS(
        username: "marc.nguyen",
        password: "stickman963",
        referee: "https://portail.emse.fr/ics/",
      );

      if (phpSessionId == "Error : Bad login") return false;

      var icsUrl = await getCalendarURL(
        phpSessionIDCAS: phpSessionId,
        url: "https://portail.emse.fr/ics/",
      );
      await saveCalendarFromUrl(icsUrl);
      print(await readCalendar());
    });

    test('FAIL to readCalendar', () async {
      try {
        var out = await readCalendar();
        print("FAIL : $out");
        return -1;
      } catch (e) {
        print(e.toString());
        expect(e.toString(), contains("FileSystemException"));
      }
    });

    test('getSavedCalendarUrl', () async {
      await saveCalendarFromLogin(
          username: "marc.nguyen", password: "stickman963");
      String url = await getSavedCalendarURL();
      expect(url, contains("http"));
    });

    test('Read a non existing calendar', () async {
      try {
        await readCalendar();
        return -1;
      } catch (e) {
        print(e.toString());
        expect(e.toString(), contains("File calendar.ics do not exists"));
      }
    });

    test('Read a non existing calendarURL', () async {
      try {
        await getSavedCalendarURL();
        return -1;
      } catch (e) {
        print(e.toString());
        expect(e.toString(), contains("File savedCalendarURL do not exists"));
      }
    });
  });
}
