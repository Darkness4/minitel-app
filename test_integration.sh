#!/bin/sh
flutter build apk --debug
flutter drive --target=test_driver/app.dart --driver=test_driver/navigation_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/documentation_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/authentication_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/news_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/reporting_test.dart
