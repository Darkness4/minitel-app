// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
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
  String get localeName => 'messages';

  static m0(enabled) => "${Intl.select(enabled, {'true': 'activées.', 'false': 'désactivées.', })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "DiagnoseLoc_arpContent1" : MessageLookupByLibrary.simpleMessage("Affiche les adresses MAC de tous les appareils connectés au téléphone.\n\nLa Passerelle devrait être affiché et l\'adresse MAC doit être 00-0d-b4-10-99-e1.\n\nSi l\'adresse MAC de la passerelle ne correspond pas à celui de la passerelle, on a affaire à une ARP poisonning : \n"),
    "DiagnoseLoc_arpContent2" : MessageLookupByLibrary.simpleMessage("Le voleur d\'IP de la passerelle répond à la réponse ARP envoyé en broadcast par la victime, plus rapidement que la passerelle.\n\n"),
    "DiagnoseLoc_arpContent3" : MessageLookupByLibrary.simpleMessage("Une solution temporaire (uniquement lorsque le WiFi est allumé) est :"),
    "DiagnoseLoc_header" : MessageLookupByLibrary.simpleMessage("Diagnostique"),
    "DiagnoseLoc_httpContent" : MessageLookupByLibrary.simpleMessage("Si une erreur 4xx ou 5xx apparait, veuillez le signaler à Minitel."),
    "DiagnoseLoc_ipaContent" : MessageLookupByLibrary.simpleMessage("Donne des informations utiles sur le matériel.\n\nInformations utiles:\n- Status\n- Adresse IP\n- Adresse MAC"),
    "DiagnoseLoc_nsLookupContent1" : MessageLookupByLibrary.simpleMessage("S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS.\n"),
    "DiagnoseLoc_nsLookupContent2" : MessageLookupByLibrary.simpleMessage("Pour les appareils portable, redémarrez le Wifi.\nVoici des solutions proposées:"),
    "DiagnoseLoc_pingDNSContent" : MessageLookupByLibrary.simpleMessage("Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet."),
    "DiagnoseLoc_pingGatewayContent" : MessageLookupByLibrary.simpleMessage("La passerelle ignore normalement les pings. Cependant, si un ping est reçu, quelqu\'un a probablement pris sont IP. Mais, rien est certain."),
    "DiagnoseLoc_pingLoContent1" : MessageLookupByLibrary.simpleMessage("Vérifie si le logiciel TCP/IP fonctionne.\n"),
    "DiagnoseLoc_pingLoContent2" : MessageLookupByLibrary.simpleMessage("Devrait être toujours positif."),
    "DiagnoseLoc_pingLocalContent1" : MessageLookupByLibrary.simpleMessage("Ping à un ordinateur local (10.163.0.5, qui est le serveur Minitel et devrait être toujours allumé).\n\nSi les paquets sont perdus, ceci sont les scenarios les plus probable:\n    1.  Vous n\'avez pas d\'IP."),
    "DiagnoseLoc_pingLocalContent2" : MessageLookupByLibrary.simpleMessage(" (Voir ip a, et alertez immediatement à Minitel)\n"),
    "DiagnoseLoc_pingLocalContent3" : MessageLookupByLibrary.simpleMessage("    2.  Vous n\'êtes pas connecté au réseau local.\n    3.  Le serveur (10.163.0.5) est déconnecté. (vous pouvez ping 10.163.0.10)\n    4.  Un switch de la Maison des Elèves est déconnecté.\n    5.  Un switch de la résidence est déconnecté."),
    "DiagnoseLoc_reactionContent" : MessageLookupByLibrary.simpleMessage("S\'il n\'y a plus de réseau, contactez Minitel et utilisez la suite diagnostique dans la page \"Signaler Minitel\""),
    "DiagnoseLoc_reactionHeader" : MessageLookupByLibrary.simpleMessage("Comment devrais-je réagir?"),
    "DiagnoseLoc_tracerouteContent" : MessageLookupByLibrary.simpleMessage("Affiche le chemin et les délais des paquets vers un serveur Google.\nUtile pour voir les causes de lag."),
    "NotificationSettingsLoc_early1" : MessageLookupByLibrary.simpleMessage("Notifier "),
    "NotificationSettingsLoc_early2" : MessageLookupByLibrary.simpleMessage(" minutes avant le cours."),
    "NotificationSettingsLoc_enabled1" : MessageLookupByLibrary.simpleMessage("Les notifications sont "),
    "NotificationSettingsLoc_enabled2" : m0,
    "NotificationSettingsLoc_range1" : MessageLookupByLibrary.simpleMessage("Notifier les cours des "),
    "NotificationSettingsLoc_range2" : MessageLookupByLibrary.simpleMessage(" prochains jours."),
    "NotificationSettingsLoc_save" : MessageLookupByLibrary.simpleMessage("Sauvegarder"),
    "NotificationSettingsLoc_title" : MessageLookupByLibrary.simpleMessage("Paramètres de notifications")
  };
}
