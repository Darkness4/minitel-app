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
        await ICalendar().getCalendarFromFile();
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), contains("File calendar.ics do not exists"));
      }
    });

    test("parseCalendar: Not Existing", () async {
      try {
        await ICalendar().parseCalendar();
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), contains("Calendar stream not found"));
      }
    });
    test("saveCalendar: Wrong URL", () async {
      try {
        await ICalendar()
            .saveCalendar("https://portail.emse.fr/ics/1.ics", _calendarUrlAPI);
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });
  });

  group("Must WORK", () {
    test("saveCalendar", () async {
      var ical = ICalendar();
      var url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);
    });

    test("getCalendarFromFile", () async {
      var ical = ICalendar();
      await ical.getCalendarFromFile();
    });

    test("parseCalendar from Login", () async {
      var ical = ICalendar();
      var url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);

      await ical.getCalendarFromFile();
      var parsedCalendar = await ical.parseCalendar();
      print(parsedCalendar.timezone.daylight.toString());
      print(parsedCalendar.events[0]["DTSTART"]);
      print(parsedCalendar.events[0].length);
      print(parsedCalendar.events.length);
      expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
    });

    test("", () async {
      var ical = ICalendar();
      ParsedCalendar parsedCalendar;
      String url;

      // Save before the test
      var url0 = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url0, _calendarUrlAPI);

      // Test
      try {
        url = await _calendarUrlAPI.getCalendarURL(
          username: "",
          password: utf8.decode(base64.decode("")),
        );
        throw "Bad login found a non-expected result";
      } on Exception catch (e) {
        expect(e.toString(), contains("Bad login"));
      }

      if (url != null) {
        await ical.saveCalendar(url, _calendarUrlAPI);
        throw "A bad calendar has been saved";
      } else {
        print("Cannot update calendar. Taking from cache.");
      }

      var ical2 = ICalendar();
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
