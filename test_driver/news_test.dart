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

    test('Move to News section', () async {
      await driver.waitFor(minitelFinders.closeUpdateButton);
      await driver.tap(minitelFinders.closeUpdateButton);
      await driver.tap(minitelFinders.drawer);
      await driver.tap(minitelFinders.newsRoute);
      await driver.waitForAbsent(minitelFinders.newsLoading);
    });

    group('News Section', () {
      test('Scroll Vertically in Facebook', () async {
        await driver.waitFor(minitelFinders.facebookList);
        await driver.scrollUntilVisible(
          minitelFinders.facebookList,
          find.byValueKey('facebook_tab/fb_item_2'),
          dyScroll: -500.0,
        );
      });

      test('PageView Scroll to Github', () async {
        await driver.scrollUntilVisible(
          minitelFinders.newsTabs,
          minitelFinders.githubList,
          dxScroll: -500.0,
        );
      });

      test('Scroll Vertically in Github', () async {
        await driver.waitFor(minitelFinders.githubList);
        await driver.scrollUntilVisible(
          minitelFinders.githubList,
          find.byValueKey('github_tab/gh_item_4'),
          dyScroll: -500.0,
        );
      });

      test('PageView Go to Facebook', () async {
        await driver.tap(minitelFinders.facebookTab);
      });
    });
  });
}
