# Documentations Minitel Toolbox

## Quickstart

1. Installer [Flutter](https://flutter.dev/docs/get-started/install)

2. Brancher un smartphone Android ou émulateur avec [ADB](https://developer.android.com/studio/command-line/adb).
3. 

```sh
flutter pub get # Récupérer les dépendances
flutter run # Lancer en déboggage
```

## Unit Tests

```sh
flutter tests
```

## Project Layout

Seulement les fichiers nécessaires au développeurs sont affichés :

```sh
toolbox/
├── .ci-scripts/  # Script pour CI/CD
├── .github/      # Github-Related
├── android/
│   ├── app/
│   │   ├── src/  # Android-specific source code
│   │   ├── build.gradle  # Config Android Compilation + Android Dependencies
│   │   └── keystore.jks  # [MISSING FOR DEVELOPPERS] Keystore Android
│   ├── fastlane/  # Fastlane-Related
│   └── build.gradle  #
├── assets        # Static Assets
├── docs          # Documentation
├── ios           # [OBSOLETE] iOS-specific source code
├── lib           # [IMPORANT] Main Source Code Directory
├── test          # Unit tests
├── test_driver   # Integration tests
├── web           # [UNUSED] Web-specific source code
├── .coveralls.yml  # Unit tests coveralls
├── .gitignore
├── .lcovignore   # Ignore files from coverage
├── 1.dart_to_arb.sh  # [UNSTABLE] Export .dart translation to .arb
├── 2.arb_to_dart.sh  # Convert .arb to .dart
├── AUTHORS       # [IMPORTANT] 
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE
├── PRIVACY_POLICY.md
├── README.md
├── analysis_options.yaml  # Linter configuration
├── mkdocs.yml  # Configuration of this docs
├── pubspec.yaml  # [IMPORTANT] Project configuration + dependencies
├── resize_test_integration.sh  # Resize screenshots from test_integration.sh
├── test_coverage.sh  # Run unit tests with coverage
└── test_integration.sh  # Run integration tests
```
