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
    await driver.tap(minitelFinders.newsRoute);
    await driver.waitForAbsent(minitelFinders.newsLoading);

    group('News Section', () async {
      test('Scroll Vertically in Facebook', () async {});

      test('PageView Scroll to Github', () async {});

      test('Scroll Vertically in Github', () async {});
    });
  });
}
