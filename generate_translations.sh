#!/usr/bin/env bash
flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/localizations.dart assets/l10n/intl_en.arb assets/l10n/intl_fr.arb