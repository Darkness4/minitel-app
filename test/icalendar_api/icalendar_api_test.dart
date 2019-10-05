import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';

import '../mock_http_client.dart';
import 'template.ics.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final Uint8List encodedICalendar = CalendarTemplate.iCalendarTemplate;

  const String url =
      "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
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
        await ParsedCalendar.parse(await ICalendarAPI.calendarPATH);
        throw Exception("Fail to fail");
      } on FileSystemException catch (e) {
        expect(e.toString(), contains("Cannot open file"));
      }
    });
    test("saveCalendar: Wrong URL", () async {
      try {
        await ICalendarAPI()
            .downloadCalendar("https://portail.emse.fr/ics/1.ics");
        throw Exception("Fail to fail");
      } catch (e) {
        expect(e.toString(), isNot(contains("Fail to fail")));
      }
    });
  });

  group("Must WORK", () {
    test("downloadCalendar", () async {
      await HttpOverrides.runZoned(
        () async {
          final ICalendarAPI ical = ICalendarAPI();
          await ical.downloadCalendar(url);
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): encodedICalendar,
          },
        ),
      );
    });

    test("ParsedCalendar parse", () async {
      await HttpOverrides.runZoned(
        () async {
          final ICalendarAPI ical = ICalendarAPI();

          await ical.downloadCalendar(url);

          final ParsedCalendar parsedCalendar =
              await ParsedCalendar.parse(await ICalendarAPI.calendarPATH);
          expect(parsedCalendar.timezone.daylight, isNotNull);
          expect(parsedCalendar.events[0].dtstart, isNotNull);
          expect(parsedCalendar.events.length, isNotNull);
          expect(parsedCalendar.timezone.tzid, equals("Europe/Paris"));
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(url): encodedICalendar,
          },
        ),
      );
    });
  });
}
