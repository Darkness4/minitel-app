import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';

Future<void> main() async {
  final CalendarUrlAPI _calendarURL = CalendarUrlAPI();
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
      final String output = await _calendarURL.savedCalendarURL;
      expect(output, equals(""));
    });

    test("getCalendarURL: bad credentials", () async {
      try {
        await _calendarURL.getCalendarURL(
          username: "",
          password: "",
        );
        throw Exception("getCalendarURL shouldn't work here");
      } on Exception catch (e) {
        expect(e.toString(), contains("Bad login"));
      }
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
      const String url =
          "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
      await _calendarURL.saveCalendarURL(url);
    });

    test("savedCalendarURL not existing", () async {
      const String url =
          "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
      await _calendarURL.saveCalendarURL(url);
      final String output = await _calendarURL.savedCalendarURL;
      expect(output, equals(RegExp(r'https(.*)\.ics').stringMatch(output)));
    });

    test("getCalendarURL", () async {
      final String output = await _calendarURL.getCalendarURL(
        username: "marc.nguyen",
        password: utf8.decode(base64.decode("b3BzdGU5NjM=")),
      );
      expect(output, equals(RegExp(r'https(.*)\.ics').stringMatch(output)));
    });
  });
}
