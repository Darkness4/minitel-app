import 'package:intl/intl.dart';

class AboutLoc {
  final String localeName;
  AboutLoc(this.localeName);

  String get title => Intl.message(
        'À propos de Minitel Toolbox',
        name: 'AboutLoc_title',
        locale: localeName,
      );

  String get description => Intl.message(
        "Minitel Toolbox regroupe les outils les plus utiles pour avoir un WiFi sans encombre.",
        name: 'AboutLoc_description',
        locale: localeName,
      );

  String get developper => Intl.message(
        "Développeur",
        name: 'AboutLoc_developper',
        locale: localeName,
      );

  String get lastVestion => Intl.message(
        "Dernière version",
        name: 'AboutLoc_lastVestion',
        locale: localeName,
      );

  String get website => Intl.message(
        "Site Internet",
        name: 'AboutLoc_website',
        locale: localeName,
      );

  String get license => Intl.message(
        "Licence",
        name: 'AboutLoc_license',
        locale: localeName,
      );

  String get privacyPolicyTitle => Intl.message(
        "Politique de confidentalité",
        name: 'AboutLoc_privacyPolicyTitle',
        locale: localeName,
      );

  String get privacyPolicySubtitle => Intl.message(
        "Aucune donnée est partagée et stockée à votre insu. Les données "
        "collectées sont celles que vous nous fournissez (diagnostique) et ne "
        "sont jamais sauvegardées. ",
        name: 'AboutLoc_privacyPolicySubtitle',
        locale: localeName,
      );
}
