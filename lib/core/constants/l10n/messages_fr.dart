// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static m0(enabled) => "${Intl.select(enabled, {
        'true': 'activées.',
        'false': 'désactivées.',
      })}";

  static m1(hours, minutes) =>
      "${hours} heures and ${minutes} minutes restantes";

  static m2(minutes) => "${minutes} minutes restantes";

  static m3(seconds) => "${seconds} secondes restantes";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "AboutLoc_description": MessageLookupByLibrary.simpleMessage(
            "Minitel Toolbox regroupe les outils les plus utiles pour avoir un WiFi sans encombre."),
        "AboutLoc_developper":
            MessageLookupByLibrary.simpleMessage("Développeur"),
        "AboutLoc_lastVestion":
            MessageLookupByLibrary.simpleMessage("Dernière version"),
        "AboutLoc_license": MessageLookupByLibrary.simpleMessage("Licence"),
        "AboutLoc_privacyPolicySubtitle": MessageLookupByLibrary.simpleMessage(
            "Aucune donnée est partagée et stockée à votre insu. Les données collectées sont celles que vous nous fournissez (diagnostique) et ne sont jamais sauvegardées. "),
        "AboutLoc_privacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Politique de confidentalité"),
        "AboutLoc_title":
            MessageLookupByLibrary.simpleMessage("À propos de Minitel Toolbox"),
        "AboutLoc_website":
            MessageLookupByLibrary.simpleMessage("Site Internet"),
        "AgendaLoc_emptyAgenda0": MessageLookupByLibrary.simpleMessage(
            "Ben alors ? On n\'a pas cours ?"),
        "AgendaLoc_emptyAgenda1":
            MessageLookupByLibrary.simpleMessage("Ça sent le barbecue...."),
        "AgendaLoc_emptyAgenda2":
            MessageLookupByLibrary.simpleMessage("Libeeeeertééé !"),
        "AgendaLoc_emptyAgenda3":
            MessageLookupByLibrary.simpleMessage("Chatteux va !"),
        "AgendaLoc_emptyAgenda4": MessageLookupByLibrary.simpleMessage(
            "Passe plus de temps avec la famille !\n(au lieu de regarder les prochains cours)"),
        "AgendaLoc_emptyAgenda5": MessageLookupByLibrary.simpleMessage(
            "L\'application compte plus de 10 000 lignes de codes...\n\n(avec 30 000 additions et 20 000 délétions)"),
        "AgendaLoc_emptyAgenda6": MessageLookupByLibrary.simpleMessage(
            "L\'application est développé avec Flutter et avec ❤️"),
        "AgendaLoc_emptyAgenda7":
            MessageLookupByLibrary.simpleMessage("Minitel gère !"),
        "AgendaLoc_emptyAgenda8":
            MessageLookupByLibrary.simpleMessage("Freeeeeeedom !"),
        "AgendaLoc_emptyAgenda9":
            MessageLookupByLibrary.simpleMessage("The sad panda sit alone."),
        "AgendaLoc_title": MessageLookupByLibrary.simpleMessage("Agenda"),
        "AppListLoc_portal": MessageLookupByLibrary.simpleMessage("Portail"),
        "AppListLoc_printer":
            MessageLookupByLibrary.simpleMessage("Imprimante"),
        "NewsLoc_seeTwitter":
            MessageLookupByLibrary.simpleMessage("Voir sur Twitter ..."),
        "NewsLoc_title": MessageLookupByLibrary.simpleMessage("Nouveautés"),
        "NotificationSettingsLoc_early1":
            MessageLookupByLibrary.simpleMessage("Notifier "),
        "NotificationSettingsLoc_early2":
            MessageLookupByLibrary.simpleMessage(" minutes avant le cours."),
        "NotificationSettingsLoc_enabled1":
            MessageLookupByLibrary.simpleMessage("Les notifications sont "),
        "NotificationSettingsLoc_enabled2": m0,
        "NotificationSettingsLoc_range1":
            MessageLookupByLibrary.simpleMessage("Notifier les cours des "),
        "NotificationSettingsLoc_range2":
            MessageLookupByLibrary.simpleMessage(" prochains jours."),
        "NotificationSettingsLoc_save":
            MessageLookupByLibrary.simpleMessage("Sauvegarder"),
        "NotificationSettingsLoc_title":
            MessageLookupByLibrary.simpleMessage("Paramètres de notifications"),
        "PortalLoc_authTime":
            MessageLookupByLibrary.simpleMessage("Durée d\'authentification "),
        "PortalLoc_autoLogin": MessageLookupByLibrary.simpleMessage(
            "Se connecter automatiquement"),
        "PortalLoc_domainNameHeader":
            MessageLookupByLibrary.simpleMessage("Nom de domaine / IP"),
        "PortalLoc_login": MessageLookupByLibrary.simpleMessage("Se connecter"),
        "PortalLoc_password":
            MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "PortalLoc_rememberMe":
            MessageLookupByLibrary.simpleMessage("Se souvenir "),
        "PortalLoc_statusInHM": m1,
        "PortalLoc_statusInMinutes": m2,
        "PortalLoc_statusInSeconds": m3,
        "PortalLoc_title":
            MessageLookupByLibrary.simpleMessage("Authentification"),
        "PortalLoc_usernameHint":
            MessageLookupByLibrary.simpleMessage("prenom.nom"),
        "PortalLoc_usernameLabel":
            MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
        "ReportingLoc_chamberHint":
            MessageLookupByLibrary.simpleMessage("Numero de chambre"),
        "ReportingLoc_chamberLabel":
            MessageLookupByLibrary.simpleMessage("Chambre"),
        "ReportingLoc_idHint":
            MessageLookupByLibrary.simpleMessage("Nom Prénom"),
        "ReportingLoc_idLabel":
            MessageLookupByLibrary.simpleMessage("Identité"),
        "ReportingLoc_isNotValidUid": MessageLookupByLibrary.simpleMessage(
            "Le nom d\'utilisateur doit être sous le format \'prénom.nom\'."),
        "ReportingLoc_mustOnlyBeNumbers": MessageLookupByLibrary.simpleMessage(
            "Ne doit contenir que des chiffres."),
        "ReportingLoc_notEmpty":
            MessageLookupByLibrary.simpleMessage("Ne doit pas être vide"),
        "ReportingLoc_share": MessageLookupByLibrary.simpleMessage("Partager"),
        "ReportingLoc_slack":
            MessageLookupByLibrary.simpleMessage("Notifier sur Slack"),
        "ReportingLoc_title":
            MessageLookupByLibrary.simpleMessage("Signaler Minitel"),
        "ReportingLoc_titleHint":
            MessageLookupByLibrary.simpleMessage("J\'ai plus internet !"),
        "ReportingLoc_titleLabel":
            MessageLookupByLibrary.simpleMessage("Titre"),
        "TutorialLoc_content1": MessageLookupByLibrary.simpleMessage(
            "1. Connectez-vous à \'WiFi Minitel\'"),
        "TutorialLoc_content2": MessageLookupByLibrary.simpleMessage(
            "2. Lancez la suite de diagnostique en appuyant sur le bouton, et attendez 1 minute."),
        "TutorialLoc_content3": MessageLookupByLibrary.simpleMessage(
            "3. Remplissez votre rapport. N\'oubliez pas un moyen de communication (chambre, mail, messenger ...)"),
        "TutorialLoc_content4": MessageLookupByLibrary.simpleMessage(
            "4. Connectez-vous sur un réseau où il y a Internet."),
        "TutorialLoc_content5":
            MessageLookupByLibrary.simpleMessage("5. Envoyez le rapport."),
        "TutorialLoc_example": MessageLookupByLibrary.simpleMessage(
            "Exemple : \nTitre: Pas Internet depuis Lundi.\nDescription: Je perds fréquemment la connexion lorsque je suis sur Ethernet. Le Wifi, c\'est ok."),
        "TutorialLoc_header": MessageLookupByLibrary.simpleMessage(
            "Comment signaler sans internet ?"),
        "TutorialLoc_notice": MessageLookupByLibrary.simpleMessage(
            "REMARQUE : Il est recommandé d\'installer le Root et Busybox."),
        "forceDark":
            MessageLookupByLibrary.simpleMessage("Forcer le thème sombre")
      };
}
