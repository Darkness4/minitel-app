import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/icalendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final CalendarUrlAPI _calendarUrlAPI = CalendarUrlAPI();
  setUpAll(() async {
    final Directory directory = await Directory.systemTemp.createTemp();

    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });

  SharedPreferences.setMockInitialValues(<String, dynamic>{});

  group('Must FAIL', () {
    test("getParsedCalendarFromFile: Not Existing", () async {
      try {
        await ICalendar().getParsedCalendarFromFile();
        throw Exception("Fail to fail");
      } catch (e) {
        expect(e.toString(), contains("File calendar.ics do not exists"));
      }
    });
    test("saveCalendar: Wrong URL", () async {
      try {
        await ICalendar()
            .saveCalendar("https://portail.emse.fr/ics/1.ics", _calendarUrlAPI);
        throw Exception("Fail to fail");
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });
  });

  group("Must WORK", () {
    test("saveCalendar", () async {
      final ICalendar ical = ICalendar();
      final String url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);
    });

    test("getParsedCalendarFromFile", () async {
      final ICalendar ical = ICalendar();
      final String url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);
      await ical.getParsedCalendarFromFile();
    });

    test("parseCalendar from Login", () async {
      final ICalendar ical = ICalendar();
      final String url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);

      final ParsedCalendar parsedCalendar =
          await ical.getParsedCalendarFromFile();
      expect(parsedCalendar.timezone.daylight.toString(), isNotNull);
      expect(parsedCalendar.events[0].dtstart, isNotNull);
      expect(parsedCalendar.events.length, isNotNull);
      expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
    });

    test("parseCalendar from Cache", () async {
      final ICalendar ical = ICalendar();
      ParsedCalendar parsedCalendar;
      String url;

      // Save before the test
      final String url0 = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url0, _calendarUrlAPI);

      // Test
      try {
        url = await _calendarUrlAPI.getCalendarURL(
          username: "",
          password: utf8.decode(base64.decode("")),
        );
        throw Exception("Found a non-expected result");
      } on Exception catch (e) {
        expect(e.toString(), contains("Bad login"));
      }

      if (url != null) {
        await ical.saveCalendar(url, _calendarUrlAPI);
        throw Exception("A bad calendar has been saved");
      } else {
        print("Cannot update calendar. Taking from cache.");
      }

      final ICalendar ical2 = ICalendar();
      parsedCalendar = await ical2.getParsedCalendarFromFile();
      expect(parsedCalendar.events.length, isNotNull);
      expect(parsedCalendar.timezone.daylight.toString(), isNotNull);
      expect(parsedCalendar.events[0].dtstart, isNotNull);
      expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
    });

    test("parseCalendar export to Json", () async {
      final ICalendar ical = ICalendar();
      final String url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);

      final ParsedCalendar parsedCalendar =
          await ical.getParsedCalendarFromFile();
      print(parsedCalendar.toJson());
    });

    test("parseCalendar import to Json", () async {
      final ICalendar ical = ICalendar();
      final String url = await _calendarUrlAPI.getCalendarURL(
          username: "marc.nguyen",
          password: utf8.decode(base64.decode("b3BzdGU5NjM=")));
      await ical.saveCalendar(url, _calendarUrlAPI);

      final ParsedCalendar parsedCalendar =
          await ical.getParsedCalendarFromFile();
      final ParsedCalendar parsedCalendar2 =
          ParsedCalendar.fromJson(parsedCalendar.toJson());
      expect(parsedCalendar2.toJson(), equals(parsedCalendar.toJson()));
    });
  });
}
