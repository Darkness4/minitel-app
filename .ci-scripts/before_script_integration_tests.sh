#!/bin/sh
SCRIPTPATH=$(dirname "$(realpath "$0")")
sdkmanager "system-images;android-28;default;x86"
echo no | avdmanager create avd --force -n test -k "system-images;android-28;default;x86" --abi "x86" --device "Galaxy Nexus" 
emulator -avd test -no-window -no-audio &
/bin/bash "$SCRIPTPATH/android-wait-for-emulator"
adb shell input keyevent 82 &
adb devices
