import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'finders.dart';

void main() {
  group('Minitel Toolbox', () async {
    FlutterDriver driver;

    var minitelFinders = MinitelFinders();

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

    await driver.waitFor(minitelFinders.closeUpdateButton);
    await driver.tap(minitelFinders.closeUpdateButton);
    await driver.tap(minitelFinders.drawer);
    await driver.tap(minitelFinders.reportingRoute);

    group('Reporting Section', () async {
      test('Fill report', () async {});

      test('Start Diagnose', () async {});

      test('PageView Scroll to Diagnosis', () async {});

      test('PageView Scroll vertically', () async {});

      test('Send to Slack', () async {});
    });
  });
}
