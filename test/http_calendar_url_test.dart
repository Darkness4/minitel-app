import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';

void main() async {
  final CalendarURLAPI _calendarURL = CalendarURLAPI();
  group("Must FAIL", () {
    // Mock out the MethodChannel for the path_provider plugin
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
    test("savedCalendarURL: not existing", () async {
      String output = await _calendarURL.savedCalendarURL;
      expect(output, equals(""));
    });

    test("getCalendarURL: bad credentials", () async {
      String output = await _calendarURL.getCalendarURL(
        username: "",
        password: "",
      );
      expect(output, equals(null));
    });
  });

  group("Must WORK", () {
    // Mock out the MethodChannel for the path_provider plugin
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
    test("saveCalendarURL", () async {
      var url =
          "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
      await _calendarURL.saveCalendarURL(url);
    });

    test("savedCalendarURL not existing", () async {
      var url =
          "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
      await _calendarURL.saveCalendarURL(url);
      String output = await _calendarURL.savedCalendarURL;
      expect(output, equals(RegExp(r'https(.*)\.ics').stringMatch(output)));
    });

    test("getCalendarURL", () async {
      String output = await _calendarURL.getCalendarURL(
        username: "marc.nguyen",
        password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")),
      );
      expect(output, equals(RegExp(r'https(.*)\.ics').stringMatch(output)));
    });
  });
}
