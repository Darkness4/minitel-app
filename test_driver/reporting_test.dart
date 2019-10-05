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
      await driver?.close();
    });

    test('Check flutter driver health', () async {
      final Health health = await driver.checkHealth();
      print(health.status);
      expect(health.status, equals(HealthStatus.ok));
    });

    test('Go to Reporting', () async {
      await driver.tap(minitelFinders.drawer);
      await driver.tap(minitelFinders.reportingRoute);
    });

    group('Reporting Section', () {
      test('Start Diagnose', () async {
        await driver.tap(minitelFinders.reportingFAB);
      });

      test('Fill report', () async {
        await driver.tap(minitelFinders.reportName);
        await driver.enterText('Integration Test');
        await driver.tap(minitelFinders.reportRoom);
        await driver.enterText('6666');
        await driver.tap(minitelFinders.reportTitle);
        await driver.enterText('Integration Test Title');
        await driver.tap(minitelFinders.reportDescription);
        await driver.enterText('Integration Test Description');
      });

      test('PageView Scroll to Diagnosis', () async {
        await driver.scrollUntilVisible(
          minitelFinders.reportingTabs,
          minitelFinders.diagnosisList,
          dxScroll: -500.0,
        );
      });

      test('PageView Scroll vertically', () async {
        await driver.scrollUntilVisible(
          minitelFinders.diagnosisList,
          find.byValueKey('diagnose_tab/HTTP Portal Response Gateway'),
          dyScroll: -500.0,
        );
      }, timeout: const Timeout(Duration(minutes: 5)));

      test('PageView Go to Report', () async {
        await driver.tap(minitelFinders.reportingTab);
      });

      test('Send to Slack', () async {
        await driver.waitFor(minitelFinders.reportingFABDone);
        await driver.tap(minitelFinders.sendToSlack);
        await driver.waitFor(find.text('ok'));
      }, timeout: const Timeout(Duration(minutes: 2)));
    }, timeout: const Timeout(Duration(minutes: 2)));
  }, timeout: const Timeout(Duration(minutes: 5)));
}
