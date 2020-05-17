#!/usr/bin/env sh
flutter test --coverage
lcov -r coverage/lcov.info $(cat ./.lcovignore) -o coverage/lcov.info
genhtml -o coverage coverage/lcov.info
