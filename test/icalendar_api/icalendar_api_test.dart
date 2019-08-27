import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';

import '../mock_http_client.dart';
import 'template.ics.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const String url =
      "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
  final CalendarUrlAPI _calendarUrlAPI = CalendarUrlAPI();
  final Directory directory = Directory.systemTemp.createTempSync();

  const MethodChannel('plugins.flutter.io/path_provider')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getApplicationDocumentsDirectory') {
      return directory.path;
    }
    return null;
  });
  const MethodChannel('plugins.flutter.io/shared_preferences')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return <String, dynamic>{}; // set initial values here if desired
    }
    return null;
  });

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
      await HttpOverrides.runZoned(
        () async {
          final ICalendar ical = ICalendar();
          await ical.saveCalendar(url, _calendarUrlAPI);
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): utf8.encode(iCalendarTemplate),
          },
        ),
      );
    });

    test("getParsedCalendarFromFile", () async {
      await HttpOverrides.runZoned(
        () async {
          final ICalendar ical = ICalendar();

          await ical.saveCalendar(url, _calendarUrlAPI);
          await ical.getParsedCalendarFromFile();
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): utf8.encode(iCalendarTemplate),
          },
        ),
      );
    });

    test("parseCalendar from Login", () async {
      await HttpOverrides.runZoned(
        () async {
          final ICalendar ical = ICalendar();

          await ical.saveCalendar(url, _calendarUrlAPI);

          final ParsedCalendar parsedCalendar =
              await ical.getParsedCalendarFromFile();
          expect(parsedCalendar.timezone.daylight.toString(), isNotNull);
          expect(parsedCalendar.events[0].dtstart, isNotNull);
          expect(parsedCalendar.events.length, isNotNull);
          expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): utf8.encode(iCalendarTemplate),
          },
        ),
      );
    });

    test("parseCalendar from Cache", () async {
      final ICalendar ical = ICalendar();
      ParsedCalendar parsedCalendar;

      // Save before the test
      await HttpOverrides.runZoned(
        () async {
          await ical.saveCalendar(url, _calendarUrlAPI);
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): utf8.encode(iCalendarTemplate),
          },
        ),
      );

      final ICalendar ical2 = ICalendar();
      parsedCalendar = await ical2.getParsedCalendarFromFile();
      expect(parsedCalendar.events.length, isNotNull);
      expect(parsedCalendar.timezone.daylight.toString(), isNotNull);
      expect(parsedCalendar.events[0].dtstart, isNotNull);
      expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
    });

    test("parseCalendar export to Json", () async {
      final ICalendar ical = ICalendar();

      await HttpOverrides.runZoned(
        () async {
          await ical.saveCalendar(url, _calendarUrlAPI);
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): utf8.encode(iCalendarTemplate),
          },
        ),
      );

      final ParsedCalendar parsedCalendar =
          await ical.getParsedCalendarFromFile();
      print(parsedCalendar.toJson());
    });

    test("parseCalendar import to Json", () async {
      final ICalendar ical = ICalendar();

      await HttpOverrides.runZoned(
        () async {
          await ical.saveCalendar(url, _calendarUrlAPI);
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): utf8.encode(iCalendarTemplate),
          },
        ),
      );

      final ParsedCalendar parsedCalendar =
          await ical.getParsedCalendarFromFile();
      final ParsedCalendar parsedCalendar2 =
          ParsedCalendar.fromJson(parsedCalendar.toJson());
      expect(parsedCalendar2.toJson(), equals(parsedCalendar.toJson()));
    });
  });
}
