#!/bin/bash

arb_files=(assets/l10n/intl_messages.arb assets/l10n/intl_en.arb assets/l10n/intl_fr.arb)
dart_files=(lib/core/constants/localizations.dart lib/core/constants/localizations/agenda.dart  lib/core/constants/localizations/docs.dart)

flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/core/constants/l10n --no-use-deferred-loading ${dart_files[*]} ${arb_files[*]}