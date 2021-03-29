# Tests et Déploiements

Le déploiement est automatisé en utilisant [Fastlane](https://fastlane.tools).

Les fichiers de configurations pour les tests et déploiements sont :

- Github Actions : [`./.github/workflows`](https://github.com/Darkness4/minitel-app/tree/master/.github/workflows)
- Fastlane : [`./android/fastlane`](https://github.com/Darkness4/minitel-app/tree/master/android/fastlane)

## Tests

### Tests unitaires

Les tests unitaires sont stockés dans [`./test`](https://github.com/Darkness4/minitel-app/tree/master/test) et sont basés sur Flutter Test et Mockito.

Pour lancer les tests :

```sh
flutter test
```

Pour lancer les tests avec coverage :

```sh
flutter test --coverage
```

Pour lire les fichiers coverage :

```sh
lcov -r coverage/lcov.info $(cat ./.lcovignore) -o coverage/lcov.info
genhtml -o coverage coverage/lcov.info
```

Les fichiers HTML sont stockés dans le dossier `./coverage`.

### Tests d'intégration

Les tests d'intégrations sont stockés dans [`./test_driver`](https://github.com/Darkness4/minitel-app/tree/master/test_driver) et sont bases sur Flutter Driver et Flutter Test.

Pour lancer les tests d'intégration, il faut utiliser un appareil Android ou émulateur avec ADB connecté puis lancer :

```sh
flutter drive --target=test_driver/app.dart --driver=test_driver/navigation_test.dart
```

Le test navigue sur toute l'application et prend des captures d'écran.

## Déploiements

**Il est impossible pour un contributeur externe de déployer sur le Play Store.**

Les étapes de déploiements précises sont :

1. Installer Flutter Stable.
2. Injecter les Secrets de Github.

   - `ALIAS `: Nom de la clé pour la signature
   - `CI_CONSUMER_KEY `: Clé API Twitter.
   - `CI_CONSUMER_SECRET `: Secret Twitter pour OAuth2.
   - `CI_WEBHOOK_KEY `: Clé API Slack pour le bot de signalement.
   - `KEYSTORE_PASSWORD `: Mot de passe du gestionnaire de clé.
   - `KEY_PASSWORD `: Mot de passe de la clé pour la signature.
   - `RELEASE_KEYSTORE_BASE64 `: Le gestionnaire de clé.
   - `SUPPLY_JSON_KEY_DATA `: La clé pour publier sur le Play Store.

3. Compiler en AAB.
4. Déployer sur le Play Store avec Fastlane.
