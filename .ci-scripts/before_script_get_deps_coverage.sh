#!/bin/sh
flutter channel master
flutter upgrade
flutter packages get
apt update
apt install -y lcov