import 'dart:io';

import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    // Create a temporary directory to work with
    final directory = await Directory.systemTemp.createTemp();

    // Mock out the MethodChannel for the path_provider plugin
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      // If you're getting the apps documents directory, return the path to the
      // temp directory on the test environment instead.
      if (methodCall.method == 'getTemporaryDirectory') {
        return directory.path;
      }
      return null;
    });
  });

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
    var response =
        await saveCalendar(username: "marc.nguyen", password: "stickman963");

    expect(response, true);
  });

  test('FAIL to saveCalendar', () async {
    var response = await saveCalendar(username: "", password: "");

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

  test('readCalendar', () async {
    await saveCalendar(username: "marc.nguyen", password: "stickman963");
    print(await readCalendar());
  });

  test('FAIL to readCalendar', () async {
    try {
      var out = await readCalendar();
      print(out);
      return false;
    } catch (e) {
      print(e.toString());
      expect(e.toString(), contains("FileSystemException"));
    }
  });
}
