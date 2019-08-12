// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    FlutterDriver driver;

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
