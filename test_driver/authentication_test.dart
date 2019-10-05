import 'dart:convert';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart'
    show MyIPAdresses;
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

    group('Authentication Section', () {
      test('Dropdown Nameserver', () async {
        await driver.tap(minitelFinders.nameServerDropdown);
        await driver.tap(find.text(MyIPAdresses.stormshieldIP));
      });

      test('Dropdown Time', () async {
        await driver.tap(minitelFinders.timeDropdown);
        await driver.tap(find.text('15 minutes'));
      });

      test('TextFields', () async {
        await driver.tap(minitelFinders.uidLoginTextField);
        await driver.enterText("marc.nguyen");
        await driver.tap(minitelFinders.pswdLoginTextField);
        await driver.enterText(utf8.decode(base64.decode("b3BzdGU5NjM=")));
      });

      test('Remember Me', () async {
        await driver.scrollUntilVisible(
          minitelFinders.loginList,
          minitelFinders.autoLoginButton,
          dyScroll: -200.0,
        );
        await driver.tap(minitelFinders.rememberMeButton);
      });

      test('Login Automatically', () async {
        await driver.tap(minitelFinders.autoLoginButton);
      });

      test('Login', () async {
        await driver.tap(minitelFinders.loginButton);
        await Future<dynamic>.delayed(const Duration(seconds: 5));
        final String output = await driver.getText(minitelFinders.gatewayText);
        await driver.waitFor(minitelFinders.agendaSuccess);
        await driver.waitFor(minitelFinders.portailSuccess);

        expect(output, contains('second'));
      });
    });

    group('Apps Section', () {
      test('Move to Apps Tab', () async {
        await driver.tap(minitelFinders.appsTab);
        await driver.scrollUntilVisible(
          minitelFinders.appsList,
          minitelFinders.portail,
          dyScroll: 200.0,
        );
      });

      test('Portail', () async {
        await driver.tap(minitelFinders.portail);
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        await driver.tap(minitelFinders.goBack);
      });

      test('Sogo', () async {
        await driver.tap(minitelFinders.sogo);
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        await driver.tap(minitelFinders.goBack);
      });

      test('Imprimante', () async {
        await driver.tap(minitelFinders.imprimante);
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        await driver.tap(minitelFinders.goBack);
      });

      test('Wiki', () async {
        await driver.tap(minitelFinders.wikiMinitel);
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        await driver.tap(minitelFinders.goBack);
      });

      test('Go to Login', () async {
        await driver.tap(minitelFinders.loginTab);
        await Future<dynamic>.delayed(const Duration(seconds: 5));
        final String output = await driver.getText(minitelFinders.gatewayText);
        await driver.waitFor(minitelFinders.agendaSuccess);
        await driver.waitFor(minitelFinders.portailSuccess);

        expect(output, contains('second'));
      });
    });
  });
}
