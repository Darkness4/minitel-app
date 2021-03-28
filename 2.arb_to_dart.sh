#!/bin/bash

echo "intl_translation might be deprecated (< Flutter v2). This could fail."

arb_files=(
  assets/l10n/intl_messages.arb
  assets/l10n/intl_en.arb
  assets/l10n/intl_fr.arb
  assets/l10n/intl_it.arb
)
localizations=lib/core/constants/localizations

dart_files=(
  "$localizations.dart"
  "$localizations/agenda.dart"
  "$localizations/news.dart"
  "$localizations/portal.dart"
  "$localizations/reporting.dart"
  "$localizations/about.dart"
)

flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/core/constants/l10n --no-use-deferred-loading ${dart_files[*]} ${arb_files[*]}