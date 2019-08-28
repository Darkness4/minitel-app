#!/bin/sh
flutter channel stable
flutter upgrade
flutter packages get
apt update
apt install -y sed