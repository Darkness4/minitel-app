import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';

import '../mock_http_client.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const String referee = "https://portail.emse.fr/ics/";

  const MethodChannel('plugins.flutter.io/shared_preferences')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return <String, dynamic>{}; // set initial values here if desired
    }
    return null;
  });

  group("Must FAIL", () {
    test("savedCalendarURL: not existing", () async {
      final String output = await CalendarUrlAPI.fetchSaved();
      expect(output, equals(""));
    });

    test("getCalendarURL: No wifi", () async {
      final CalendarUrlAPI _calendarURL = CalendarUrlAPI();
      try {
        await _calendarURL.getCalendarURL(
          username: "",
          password: "",
        );
        throw Exception("getCalendarURL shouldn't work here");
      } on Exception catch (e) {
        expect(e.toString(), contains("HTTP Error"));
      }
    });

    test("getCalendarURL: bad credentials", () async {
      await HttpOverrides.runZoned(
        () async {
          final CalendarUrlAPI _calendarURL = CalendarUrlAPI();
          try {
            await _calendarURL.getCalendarURL(
              username: "",
              password: "",
            );
            throw Exception("getCalendarURL shouldn't work here");
          } on Exception catch (e) {
            expect(e.toString(), contains("Bad login"));
          }
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(referee): utf8.encode('https://thisisafake.ics'),
            Uri.parse(
                    "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"):
                utf8.encode('name="lt" value="value2"'),
            Uri.parse(
                    "https://cas.emse.fr/login;jsessionid=?service=${Uri.encodeComponent(referee)}"):
                utf8.encode(''),
            Uri.parse("https//cas.emse.fr/customendpoint"): utf8.encode(''),
          },
          cookies: <Cookie>[
            Cookie("JSESSIONID", ""), // Dependent with 3rd url (jsessionid="")
          ],
        ),
      );
    });
  });

  group("Must WORK", () {
    test("saveCalendarURL", () async {
      const String url =
          "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
      await CalendarUrlAPI.saveCalendarURL(url);
    });

    test("savedCalendarURL existing", () async {
      const String url =
          "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics";
      await CalendarUrlAPI.saveCalendarURL(url);
      final String output = await CalendarUrlAPI.fetchSaved();
      print(RegExp(r'https(.*)\.ics').stringMatch(output));
      expect(output, equals(RegExp(r'https(.*)\.ics').stringMatch(output)));
    });

    test("getCalendarURL", () async {
      await HttpOverrides.runZoned(
        () async {
          final CalendarUrlAPI _calendarURL = CalendarUrlAPI();
          final String output = await _calendarURL.getCalendarURL(
            username: "marc.nguyen",
            password: utf8.decode(base64.decode("b3BzdGU5NjM=")),
          );
          print(RegExp(r'https(.*)\.ics').stringMatch(output));
          expect(output, equals(RegExp(r'https(.*)\.ics').stringMatch(output)));
        },
        createHttpClient: (SecurityContext context) => createMockHttpClient(
          context,
          <Uri, Uint8List>{
            Uri.parse(referee): utf8.encode('https://thisisafake.ics'),
            Uri.parse(
                    "https://cas.emse.fr/login?service=${Uri.encodeComponent(referee)}"):
                utf8.encode('name="lt" value="value2"'),
            Uri.parse(
                    "https://cas.emse.fr/login;jsessionid=?service=${Uri.encodeComponent(referee)}"):
                utf8.encode(''),
            Uri.parse("https//cas.emse.fr/customendpoint"): utf8.encode(''),
          },
          cookies: <Cookie>[
            Cookie("PHPSESSID", ""),
            Cookie("JSESSIONID", ""), // Dependent with 3rd url (jsessionid="")
          ],
          customHeaders: <String, String>{
            HttpHeaders.locationHeader: 'https//cas.emse.fr/customendpoint'
          },
        ),
      );
    });
  });
}
