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

    test('Move to Documentation Section', () async {
      await driver.tap(minitelFinders.drawer);

      await driver.tap(minitelFinders.docsRoute);
    });

    group('Documentation Section', () {
      test('Drawer Minitel to Minitel', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.toDocsHome);
      });

      test('Drawer Minitel to Authentification', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.toDocsAuthentification);
      });

      test('PageView Scroll to Diagnostique', () async {
        await driver.scrollUntilVisible(
          minitelFinders.toolboxPages,
          minitelFinders.diagnosePage,
          dxScroll: -500.0,
        );
      });

      test('Drawer Diagnostique to Configuration de l\'imprimante', () async {
        await driver.tap(minitelFinders.drawer);
        await driver.tap(minitelFinders.toDocsImprimante);
      });

      test('PageView Scroll to Jouer avec des VM', () async {
        await driver.scrollUntilVisible(
          minitelFinders.wikiPages,
          minitelFinders.vmPage,
          dxScroll: -500.0,
        );
      });

      test('Close Documentations', () async {
        await driver.tap(minitelFinders.goBack);
        await driver.tap(minitelFinders.goBack);
      });
    });
  });
}
