// Imports the Flutter Driver API.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'finders.dart';

void main() {
  group('Minitel Toolbox', () {
    FlutterDriver driver;

    final minitelFinders = MinitelFinders();

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
        await driver.waitFor(minitelFinders.closeUpdateButton);
        await driver.tap(minitelFinders.closeUpdateButton);
        await takeScreenshot(driver, ScreenshotsPaths.login);
      });

      test('Screenshot apps', () async {
        await driver.tap(minitelFinders.appsTab);
        await takeScreenshot(driver, ScreenshotsPaths.apps);
      });

      test('Screenshot sogo', () async {
        await driver.tap(minitelFinders.sogo);
        await Future.delayed(const Duration(seconds: 5));
        await takeScreenshot(driver, ScreenshotsPaths.sogo);
        await driver.tap(minitelFinders.goBack);
      });

      test('Screenshot news', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.newsRoute);
        await driver.waitForAbsent(minitelFinders.newsLoading);
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

  // TODO List
  // Authentication
  // - Domain Name Dropmenu
  // --- Value Change
  // --- Login test (public should work)
  // - Time Dropmenu
  // --- Value Change
  // --- Login test (check if second superior)
  // - TextFields
  // - Login button
  // - App push
  //
  // News
  // - Github
  // - Facebook
  //
  // Agenda
  // - Notifications parameters
  // - Textfields
  // - Save test
  //
  // Reporting
  // - Textfields
  // - Diagnose test
  // - All send test
  // - Test texts log
  //
  // Documentation
  // - Drawer
  // - Images
  // - All send test
  // - Test texts log
  // - Navigation test
  //
  // About
  // - Test launcher
}

Future<void> takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = File(path);
  await file.writeAsBytes(pixels);
  print(path);
}

class ScreenshotsPaths {
  static const login = "test_driver/screenshots/login.png";
  static const apps = "test_driver/screenshots/apps.png";
  static const news = "test_driver/screenshots/news.png";
  static const agenda = "test_driver/screenshots/agenda.png";
  static const reporting = "test_driver/screenshots/reporting.png";
  static const diagnosis = "test_driver/screenshots/diagnosis.png";
  static const docs = "test_driver/screenshots/docs.png";
  static const sogo = "test_driver/screenshots/sogo.png";
}
