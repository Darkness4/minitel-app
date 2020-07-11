#!/bin/sh

# Check Keystore
if [ -z "${RELEASE_KEYSTORE_BASE64}" ]
then
  echo "RELEASE_KEYSTORE_BASE64 not found."
  exit 1
else
  echo "RELEASE_KEYSTORE_BASE64 found."
  echo "${RELEASE_KEYSTORE_BASE64}" | base64 -d > android/app/keystore.jks
fi

if [ -f "android/app/keystore.jks" ]
then
  echo "android/app/keystore.jks found."
else
  echo "android/app/keystore.jks not found."
  exit 1
fi

# Check key.properties
if [ -z "${KEYSTORE_PASSWORD}" ]
then
  echo "KEYSTORE_PASSWORD not found."
  exit 1
else
  echo "KEYSTORE_PASSWORD found."
  echo "storePassword=${KEYSTORE_PASSWORD}" > android/key.properties
fi

if [ -z "${KEY_PASSWORD}" ]
then
  echo "KEYSTORE_PASSWORD not found."
  exit 1
else
  echo "KEYSTORE_PASSWORD found."
  echo "keyPassword=${KEY_PASSWORD}" >> android/key.properties
fi

if [ -z "${ALIAS}" ]
then
  echo "ALIAS not found."
  exit 1
else
  echo "ALIAS found."
  echo "keyAlias=${ALIAS}" >> android/key.properties
fi

if [ -f "android/key.properties" ]
then
  echo "android/key.properties found."
  echo "storeFile=keystore.jks" >> android/key.properties
else
  echo "android/key.properties not found."
  exit 1
fi

touch .original

# Check api_keys.dart
if [ -z "${CI_WEBHOOK_KEY}" ]
then
  echo "CI_WEBHOOK_KEY not found."
  exit 1
else
  echo "CI_WEBHOOK_KEY found."
  sed -i '.original' -e "s/_webhook = 'ZXhlbXBsZQ=='/_webhook = '${CI_WEBHOOK_KEY}'/g" ./lib/core/constants/api_keys.dart

  if ! grep -q "${CI_WEBHOOK_KEY}" ./lib/core/constants/api_keys.dart;
  then
    echo "api_keys.dart hasn't change for CI_WEBHOOK_KEY"
    exit 1
  else
    echo "api_keys.dart has changed for CI_WEBHOOK_KEY"
  fi
fi

if [ -z "${CI_CONSUMER_KEY}" ]
then
  echo "CI_CONSUMER_KEY not found."
  exit 1
else
  echo "CI_CONSUMER_KEY found."
  sed -i '.original' -e "s/_consumerKey = 'ZXhlbXBsZQ=='/_consumerKey = '${CI_CONSUMER_KEY}'/g" ./lib/core/constants/api_keys.dart

  if ! grep -q "${CI_CONSUMER_KEY}" ./lib/core/constants/api_keys.dart;
  then
    echo "api_keys.dart hasn't change for CI_CONSUMER_KEY"
    exit 1
  else
    echo "api_keys.dart has changed for CI_CONSUMER_KEY"
  fi
fi

if [ -z "${CI_CONSUMER_SECRET}" ]
then
  echo "CI_CONSUMER_SECRET not found."
  exit 1
else
  echo "CI_CONSUMER_SECRET found."
  sed -i '.original' -e "s/_consumerSecret = 'ZXhlbXBsZQ=='/_consumerSecret = '${CI_CONSUMER_SECRET}'/g" ./lib/core/constants/api_keys.dart

  if ! grep -q "${CI_CONSUMER_SECRET}" ./lib/core/constants/api_keys.dart;
  then
    echo "api_keys.dart hasn't change for CI_CONSUMER_SECRET"
    exit 1
  else
    echo "api_keys.dart has changed for CI_CONSUMER_SECRET"
  fi
fi