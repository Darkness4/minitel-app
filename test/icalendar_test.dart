import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/funcs/http_calendar_url.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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
    test("getCalendar: Empty URL", () async {
      try {
        await ICalendar().getCalendar("");
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });

    test("getCalendar: Wrong URL", () async {
      try {
        await ICalendar().getCalendar("https://portail.emse.fr/ics/1.ics");
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });

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
        await ICalendar().saveCalendar("https://portail.emse.fr/ics/1.ics");
        throw "Fail to fail";
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });
  });

  group("Must WORK", () {
    test("getCalendar", () async {
      var ical = ICalendar();
      var url = await CalendarURL.getCalendarURL(
          username: "marc.nguyen", password: "stickman963");
      await ical.getCalendar(url);
    });

    test("saveCalendar", () async {
      var ical = ICalendar();
      var url = await CalendarURL.getCalendarURL(
          username: "marc.nguyen", password: "stickman963");
      await ical.saveCalendar(url);
    });

    test("getCalendarFromFile", () async {
      var ical = ICalendar();
      await ical.getCalendarFromFile();
    });

    test("parseCalendar from Login", () async {
      var ical = ICalendar();
      var url = await CalendarURL.getCalendarURL(
          username: "marc.nguyen", password: "stickman963");
      await ical.getCalendar(url);
      await ical.parseCalendar();
      print(ical.timezone.daylight.toString());
      print(ical.events[0]["DTSTART"]);
      print(ical.events[0].length);
      print(ical.events.length);
      expect(ical.timezone.tzid, equals("Europe/Paris"));
    });

    test("parseCalendar from cache", () async {
      var ical = ICalendar();
      var url = await CalendarURL.getCalendarURL(
          username: "marc.nguyen", password: "stickman963");
      await ical.saveCalendar(url);
      var ical2 = ICalendar();
      await ical2.getCalendarFromFile();
      await ical2.parseCalendar();
      print(ical2.events.length);
      print(ical2.timezone.daylight.toString());
      print(ical2.events[0]["DTSTART"]);
      print(ical2.events[0].length);
      expect(ical2.timezone.tzid, equals("Europe/Paris"));
    });
  });
}
