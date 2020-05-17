// Imports the Flutter Driver API.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:test/test.dart';

void main() {
  group('Minitel Toolbox', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      var connected = false;
      while (!connected) {
        try {
          await driver.waitUntilFirstFrameRasterized();
          connected = true;
        } catch (error) {
          continue;
        }
      }
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      await driver?.close();
    });

    test('Check flutter driver health', () async {
      final Health health = await driver.checkHealth();
      print(health.status);
      expect(health.status, equals(HealthStatus.ok));
    });

    group('Automated screenshot', () {
      test('Screenshot login', () async {
        await driver.tap(find.byValueKey(Keys.uidLoginTextField));
        await driver.enterText("marc.nguyen");
        await driver.tap(find.byValueKey(Keys.pswdLoginTextField));
        await driver.enterText(utf8.decode(base64.decode("b3BzdGU5NjM=")));
        await driver.tap(find.byValueKey(Keys.loginButton));
        await takeScreenshot(driver, ScreenshotsPaths.login);
      });

      test('Screenshot apps', () async {
        await driver.tap(find.byValueKey(Keys.appsTab));
        await takeScreenshot(driver, ScreenshotsPaths.apps);
      });

      test('Screenshot sogo', () async {
        await driver.tap(find.byValueKey(Keys.sogo));
        await Future<dynamic>.delayed(const Duration(seconds: 30));
        await takeScreenshot(driver, ScreenshotsPaths.sogo);
        await driver.tap(find.pageBack());
      }, timeout: const Timeout(Duration(minutes: 1)));

      test('Screenshot news', () async {
        await driver.tap(find.byTooltip("Open navigation menu"));
        await driver.tap(find.byValueKey(Keys.newsRoute));
        await Future<dynamic>.delayed(const Duration(seconds: 10));
        await takeScreenshot(driver, ScreenshotsPaths.news);
      });

      test('Screenshot agenda', () async {
        await driver.tap(find.byTooltip("Open navigation menu"));
        await driver.tap(find.byValueKey(Keys.agendaRoute));
        await Future<dynamic>.delayed(const Duration(seconds: 10));
        await takeScreenshot(driver, ScreenshotsPaths.agenda);
      }, timeout: const Timeout(Duration(minutes: 1)));

      test('Screenshot reporting', () async {
        await driver.tap(find.byTooltip("Open navigation menu"));
        await driver.tap(find.byValueKey(Keys.reportingRoute));
        await takeScreenshot(driver, ScreenshotsPaths.reporting);
      });

      test('Screenshot diagnosis', () async {
        await driver.tap(find.byValueKey(Keys.diagnosisTab));
        await driver.tap(find.byValueKey(Keys.reportingFAB));
        await driver
            .waitFor(
          find.byValueKey(Keys.reportingFABDone),
        )
            .timeout(const Duration(minutes: 2), onTimeout: () {
          print("find.byValueKey(Keys.reportingFABDone) timed out.");
        });

        await takeScreenshot(driver, ScreenshotsPaths.diagnosis);
      }, timeout: const Timeout(Duration(minutes: 3)));

      test('Screenshot docs', () async {
        await driver.tap(find.byTooltip("Open navigation menu"));
        await driver.tap(find.byValueKey(Keys.docsRoute));
        await Future<dynamic>.delayed(const Duration(seconds: 30));
        await takeScreenshot(driver, ScreenshotsPaths.docs);
      }, timeout: const Timeout(Duration(minutes: 1)));
    });
  });
}

Future<void> takeScreenshot(FlutterDriver driver, String path) async {
  try {
    await driver
        .waitUntilNoTransientCallbacks()
        .timeout(const Duration(seconds: 5), onTimeout: () {
      print("waitUntilNoTransientCallbacks timed out.");
    });
    final List<int> pixels = await driver.screenshot();
    final File file = File(path);
    file.createSync(recursive: true);
    file.writeAsBytesSync(pixels);
    print(path);
  } catch (e) {
    print(e);
  }
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
