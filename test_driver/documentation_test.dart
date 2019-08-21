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

    test('Move to Documentation Section', () async {
      await driver.waitFor(minitelFinders.closeUpdateButton);
      await driver.tap(minitelFinders.closeUpdateButton);
      await driver.tap(minitelFinders.drawer);

      await driver.tap(minitelFinders.docsRoute);
    });

    group('Documentation Section', () {
      test('Drawer Minitel to Minitel', () async {});

      test('Drawer Minitel to Authentification', () async {});

      test('PageView Scroll to Diagnostique', () async {});

      test(
          'Drawer Diagnostique to Configuration de l\'imprimante', () async {});

      test('PageView Scroll to Jouer avec des VM', () async {});

      test('Close Documentations', () async {});
    });
  });
}
