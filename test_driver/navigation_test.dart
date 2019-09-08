// Imports the Flutter Driver API.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'finders.dart';

void main() {
  group('Minitel Toolbox', () {
    FlutterDriver driver;

    final MinitelFinders minitelFinders = MinitelFinders();

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Check flutter driver health', () async {
      final Health health = await driver.checkHealth();
      print(health.status);
      expect(health.status, equals(HealthStatus.ok));
    });

    group('Automated screenshot', () {
      test('Screenshot login', () async {
        await takeScreenshot(driver, ScreenshotsPaths.login);
      });

      test('Screenshot apps', () async {
        await driver.tap(minitelFinders.appsTab);
        await takeScreenshot(driver, ScreenshotsPaths.apps);
      });

      test('Screenshot sogo', () async {
        await driver.tap(minitelFinders.sogo);
        await Future<dynamic>.delayed(const Duration(seconds: 5));
        await takeScreenshot(driver, ScreenshotsPaths.sogo);
        await driver.tap(minitelFinders.goBack);
      });

      test('Screenshot news', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.newsRoute);
        await Future<dynamic>.delayed(const Duration(seconds: 5));
        await takeScreenshot(driver, ScreenshotsPaths.news);
      });

      test('Screenshot agenda', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.agendaRoute);
        await driver.tap(minitelFinders.agendaUid);
        await driver.enterText("marc.nguyen");
        await driver.tap(minitelFinders.agendaPswd);
        await driver.enterText(utf8.decode(base64.decode("b3BzdGU5NjM=")));
        await driver.tap(minitelFinders.agendaConnect);
        print("Trying to login");
        await Future<dynamic>.delayed(const Duration(seconds: 5));
        await takeScreenshot(driver, ScreenshotsPaths.agenda);
      });

      test('Screenshot reporting', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.reportingRoute);
        await takeScreenshot(driver, ScreenshotsPaths.reporting);
      });

      test('Screenshot diagnosis', () async {
        await driver.tap(minitelFinders.diagnosisTab);
        await driver.tap(minitelFinders.reportingFAB);
        await driver.waitFor(minitelFinders.reportingFABDone,
            timeout: const Duration(minutes: 2));

        await takeScreenshot(driver, ScreenshotsPaths.diagnosis);
      }, timeout: const Timeout(Duration(minutes: 3)));

      test('Screenshot docs', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.docsRoute);
        await takeScreenshot(driver, ScreenshotsPaths.docs);
      });
    });
  });
}

Future<void> takeScreenshot(FlutterDriver driver, String path) async {
  await driver.waitUntilNoTransientCallbacks();
  final List<int> pixels = await driver.screenshot();
  final File file = File(path);
  await file.writeAsBytes(pixels);
  print(path);
}

class ScreenshotsPaths {
  static const String login = "test_driver/screenshots/login.png";
  static const String apps = "test_driver/screenshots/apps.png";
  static const String news = "test_driver/screenshots/news.png";
  static const String agenda = "test_driver/screenshots/agenda.png";
  static const String reporting = "test_driver/screenshots/reporting.png";
  static const String diagnosis = "test_driver/screenshots/diagnosis.png";
  static const String docs = "test_driver/screenshots/docs.png";
  static const String sogo = "test_driver/screenshots/sogo.png";
}
