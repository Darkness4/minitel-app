#!/usr/bin/env sh
rm -rf ./coverage
flutter test --coverage
genhtml -o coverage coverage/lcov.info
