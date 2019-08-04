import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final _calendarUrlAPI = CalendarUrlAPI();
  setUpAll(() async {
    final directory = await Directory.systemTemp.createTemp();

    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });

  SharedPreferences.setMockInitialValues({});

  group('Must FAIL', () {
    test("getCalendarFromFile: Not Existing", () async {
      try {
        await ICalendar(_calendarUrlAPI).getCalendarFromFile();
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), contains("File calendar.ics do not exists"));
      }
    });

    test("parseCalendar: Not Existing", () async {
      try {
        await ICalendar(_calendarUrlAPI).parseCalendar();
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), contains("Calendar stream not found"));
      }
    });
    test("saveCalendar: Wrong URL", () async {
      try {
        await ICalendar(_calendarUrlAPI)
            .saveCalendar("https://portail.emse.fr/ics/1.ics");
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });
  });

  group("Must WORK", () {
    test("saveCalendar", () async {
      var ical = ICalendar(_calendarUrlAPI);
      var url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")));
      await ical.saveCalendar(url);
    });

    test("getCalendarFromFile", () async {
      var ical = ICalendar(_calendarUrlAPI);
      await ical.getCalendarFromFile();
    });

    test("parseCalendar from Login", () async {
      var ical = ICalendar(_calendarUrlAPI);
      var url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")));
      if (url != null) {
        await ical.saveCalendar(url);
      } else {
        print("Cannot update calendar. Taking from cache.");
        exit(1);
      }
      await ical.getCalendarFromFile();
      var parsedCalendar = await ical.parseCalendar();
      print(parsedCalendar.timezone.daylight.toString());
      print(parsedCalendar.events[0]["DTSTART"]);
      print(parsedCalendar.events[0].length);
      print(parsedCalendar.events.length);
      expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
    });

    test("parseCalendar from cache", () async {
      var ical = ICalendar(_calendarUrlAPI);
      ParsedCalendar parsedCalendar;
      // Save before the test
      var url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("c3RpY2ttYW45NjM=")));
      await ical.saveCalendar(url);

      // Test
      url = await _calendarUrlAPI.getCalendarURL(
        username: "",
        password: utf8.decode(base64.decode("")),
      ); // This should fail

      if (url != null) {
        await ical.saveCalendar(url);
        exit(1);
      } else {
        print("Cannot update calendar. Taking from cache.");
      }

      var ical2 = ICalendar(_calendarUrlAPI);
      await ical2.getCalendarFromFile();
      parsedCalendar = await ical2.parseCalendar();
      print(parsedCalendar.events.length);
      print(parsedCalendar.timezone.daylight.toString());
      print(parsedCalendar.events[0]["DTSTART"]);
      print(parsedCalendar.events[0].length);
      expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
    });
  });
}
