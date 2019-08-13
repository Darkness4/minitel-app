// Imports the Flutter Driver API.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Minitel Toolbox', () {
    FlutterDriver driver;

    // Navigation
    final drawer = find.byTooltip('Ouvrir le menu de navigation');
    final authenticationRoute = find.byValueKey('drawer/authentication');
    final newsRoute = find.byValueKey('drawer/news');
    final agendaRoute = find.byValueKey('drawer/agenda');
    final reportingRoute = find.byValueKey('drawer/reporting');
    final docsRoute = find.byValueKey('drawer/docs');
    final aboutRoute = find.byValueKey('drawer/about');

    // Precise widget
    final closeUpdateButton = find.byValueKey('portal_view/closeUpdateButton');
    final appsTab = find.byValueKey('portal_view/apps_tab');
    final sogo = find.byValueKey('app_lists/sogo');

    final newsLoading = find.byValueKey('facebook_tab/loading');

    final agendaUid = find.byValueKey('agenda_view/uid');
    final agendaPswd = find.byValueKey('agenda_view/pswd');
    final agendaConnect = find.byValueKey('agenda_view/connect');

    final reportingTab = find.byValueKey('reporting_view/diagnosis_tab');
    final reportingFAB = find.byValueKey('reporting_view/diagnose');
    final reportingFABDone = find.byValueKey('reporting_view/diagnose_done');

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
      Health health = await driver.checkHealth();
      print(health.status);
    });

    group('Automated screenshot', () {
      test('Screenshot login', () async {
        await driver.waitFor(closeUpdateButton);
        await driver.tap(closeUpdateButton);
        await takeScreenshot(driver, ScreenshotsPaths.login);
      });

      test('Screenshot apps', () async {
        await driver.tap(appsTab);
        await takeScreenshot(driver, ScreenshotsPaths.apps);
      });

      test('Screenshot sogo', () async {
        await driver.tap(sogo);
        await Future.delayed(const Duration(seconds: 5));
        await takeScreenshot(driver, ScreenshotsPaths.sogo);
        await driver.tap(find.byTooltip('Retour'));
      });

      test('Screenshot news', () async {
        await driver.tap(drawer);
        await driver.tap(newsRoute);
        await driver.waitForAbsent(newsLoading);
        await takeScreenshot(driver, ScreenshotsPaths.news);
      });

      test('Screenshot agenda', () async {
        await driver.tap(drawer);
        await driver.tap(agendaRoute);
        await driver.tap(agendaUid);
        await driver.enterText("marc.nguyen");
        await driver.tap(agendaPswd);
        await driver.enterText(utf8.decode(base64.decode("b3BzdGU5NjM=")));
        await driver.tap(agendaConnect);
        await takeScreenshot(driver, ScreenshotsPaths.agenda);
      });

      test('Screenshot reporting', () async {
        await driver.tap(drawer);
        await driver.tap(reportingRoute);
        await takeScreenshot(driver, ScreenshotsPaths.reporting);
      });

      test('Screenshot diagnosis', () async {
        await driver.tap(reportingFAB);
        await driver.tap(reportingTab);
        await driver.waitFor(reportingFABDone,
            timeout: const Duration(seconds: 90));

        await takeScreenshot(driver, ScreenshotsPaths.diagnosis);
      }, timeout: const Timeout(Duration(minutes: 2)));

      test('Screenshot docs', () async {
        await driver.tap(drawer);
        await driver.tap(docsRoute);
        await takeScreenshot(driver, ScreenshotsPaths.docs);
      });
    });
  });

  // TODO List
  // Authentication
  // - Screenshot this
  // - Domain Name Dropmenu
  // --- Value Change
  // --- Login test (public should work)
  // - Time Dropmenu
  // --- Value Change
  // --- Login test (check if second superior)
  // - TextFields
  // - Login button
  // - TabView to App
  // - App push
  //
  // Drawer test
  //
  // News
  // - Github
  // - Screenshot this
  // - Facebook (shouldn't work)
  //
  // Agenda
  // - Screenshot this
  // - Notifications parameters
  // - Textfields
  // - Save test
  //
  // Reporting
  // - Screenshot this
  // - Textfields
  // - Diagnose test
  // - All send test
  // - TabView
  // - Test texts log
  //
  // Documentation
  // - Screenshot this
  // - Drawer
  // - Images
  // - All send test
  // - TabView
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
  static const login = "screenshots/login.png";
  static const apps = "screenshots/apps.png";
  static const news = "screenshots/news.png";
  static const agenda = "screenshots/agenda.png";
  static const reporting = "screenshots/reporting.png";
  static const diagnosis = "screenshots/diagnosis.png";
  static const docs = "screenshots/docs.png";
  static const sogo = "screenshots/sogo.png";
}
