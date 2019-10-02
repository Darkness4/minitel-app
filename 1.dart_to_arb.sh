#!/bin/bash

localizations=lib/core/constants/localizations

dart_files=(
  "$localizations.dart"
  "$localizations/about.dart"
  "$localizations/agenda.dart"
  "$localizations/docs.dart"
  "$localizations/news.dart"
  "$localizations/portal.dart"
  "$localizations/reporting.dart"
)

flutter pub pub run intl_translation:extract_to_arb --output-dir=assets/l10n ${dart_files[*]}