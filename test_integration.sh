#!/bin/sh

flutter drive --target=test_driver/app.dart --driver=navigation_test.dart
flutter drive --target=test_driver/app.dart --driver=documentation_test.dart
flutter drive --target=test_driver/app.dart --driver=authentication_test.dart
flutter drive --target=test_driver/app.dart --driver=news_test.dart
flutter drive --target=test_driver/app.dart --driver=reporting_test.dart
