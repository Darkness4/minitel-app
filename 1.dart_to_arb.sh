#!/bin/bash

dart_files=(lib/core/constants/localizations.dart lib/core/constants/localizations/agenda.dart  lib/core/constants/localizations/docs.dart)

flutter pub pub run intl_translation:extract_to_arb --output-dir=assets/l10n ${dart_files[*]}