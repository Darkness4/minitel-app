import 'package:intl/intl.dart';

class ReportingLoc {
  final String localeName;
  ReportingLoc(this.localeName);
  String get chamberHint => Intl.message(
        "Numero de chambre",
        name: 'ReportingLoc_chamberHint',
        locale: localeName,
      );

  String get chamberLabel => Intl.message(
        "Chambre",
        name: 'ReportingLoc_chamberLabel',
        locale: localeName,
      );

  String get idHint => Intl.message(
        "Nom Prénom",
        name: 'ReportingLoc_idHint',
        locale: localeName,
      );
  String get idLabel => Intl.message(
        "Identité",
        name: 'ReportingLoc_idLabel',
        locale: localeName,
      );
  String get notEmpty => Intl.message(
        'Ne doit pas être vide',
        name: 'ReportingLoc_notEmpty',
        locale: localeName,
      );
  String get isNotValidUid => Intl.message(
        "Le nom d'utilisateur doit être sous le format 'prénom.nom'.",
        name: 'ReportingLoc_isNotValidUid',
        locale: localeName,
      );
  String get mustOnlyBeNumbers => Intl.message(
        'Ne doit contenir que des chiffres.',
        name: 'ReportingLoc_mustOnlyBeNumbers',
        locale: localeName,
      );
  String get share => Intl.message(
        "Partager",
        name: 'ReportingLoc_share',
        locale: localeName,
      );
  String get slack => Intl.message(
        "Notifier sur Slack",
        name: 'ReportingLoc_slack',
        locale: localeName,
      );
  String get title => Intl.message(
        'Signaler Minitel',
        name: 'ReportingLoc_title',
        locale: localeName,
      );
  String get titleHint => Intl.message(
        "J'ai plus internet !",
        name: 'ReportingLoc_titleHint',
        locale: localeName,
      );

  String get titleLabel => Intl.message(
        "Titre",
        name: 'ReportingLoc_titleLabel',
        locale: localeName,
      );

  TutorialLoc get tutorial => TutorialLoc(localeName);
}

class TutorialLoc {
  final String localeName;
  const TutorialLoc(this.localeName);

  String get content1 => Intl.message(
        "1. Connectez-vous à \'WiFi Minitel\'",
        name: 'TutorialLoc_content1',
        locale: localeName,
      );
  String get content2 => Intl.message(
        "2. Lancez la suite de diagnostique en appuyant sur le bouton, et attendez 1 minute.",
        name: 'TutorialLoc_content2',
        locale: localeName,
      );
  String get content3 => Intl.message(
        "3. Remplissez votre rapport. N'oubliez pas un moyen de communication (chambre, mail, messenger ...)",
        name: 'TutorialLoc_content3',
        locale: localeName,
      );
  String get content4 => Intl.message(
        "4. Connectez-vous sur un réseau où il y a Internet.",
        name: 'TutorialLoc_content4',
        locale: localeName,
      );
  String get content5 => Intl.message(
        "5. Envoyez le rapport.",
        name: 'TutorialLoc_content5',
        locale: localeName,
      );
  String get example => Intl.message(
        "Exemple : \nTitre: Pas Internet depuis Lundi.\nDescription: Je perds fréquemment la connexion lorsque je suis sur Ethernet. Le Wifi, c\'est ok.",
        name: 'TutorialLoc_example',
        locale: localeName,
      );
  String get header => Intl.message(
        "Comment signaler sans internet ?",
        name: 'TutorialLoc_header',
        locale: localeName,
      );
  String get notice => Intl.message(
        "REMARQUE : Il est recommandé d\'installer le Root et Busybox.",
        name: 'TutorialLoc_notice',
        locale: localeName,
      );
}
