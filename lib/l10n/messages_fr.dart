// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "sentenceDocDiagnoseARP" : MessageLookupByLibrary.simpleMessage("    Affiche les adresses MAC de tous les appareils connectés au téléphone.\n    La Passerelle devrait être affiché et l\'addresse MAC doit être 00-0d-b4-10-99-e1. Sinon, signalez-le à Minitel."),
    "sentenceDocDiagnoseHTTP1" : MessageLookupByLibrary.simpleMessage("HTTP GET https://10.163.0.2/auth/\nIl devrait afficher le même résultat que \"Connexion à la Passerelle Status\".\n\n    OS Error sont généralement causées si le téléphone ne peut pas se connecter à la passerelle 10.163.0.2."),
    "sentenceDocDiagnoseHTTP2" : MessageLookupByLibrary.simpleMessage("    Si une erreur 4xx apparait, veuillez le signaler aux developeurs."),
    "sentenceDocDiagnoseHTTP3" : MessageLookupByLibrary.simpleMessage("    Si vous avez une erreur OS, la passerelle a un problème, et vous drvriez le signaler à la DSI."),
    "sentenceDocDiagnoseHTTP4" : MessageLookupByLibrary.simpleMessage("    Si vous avez une erreur HTTP 4xx, l\'outil de diagnostique a un problème, et vous drvriez le signaler aux developeurs."),
    "sentenceDocDiagnoseHTTP5" : MessageLookupByLibrary.simpleMessage("    Si vous avez une erreur HTTP 5xx, la passerelle a un problème, et vous drvriez le signaler à la DSI."),
    "sentenceDocDiagnoseHTTP6" : MessageLookupByLibrary.simpleMessage("    Un bouton Partage a été mis en place pour envoyer 90% des informations nécessaire pour une réparation complète.\n    Sur 10.163.0.10, vous pouvez signaler aux administrateurs."),
    "sentenceDocDiagnoseNSLookup1" : MessageLookupByLibrary.simpleMessage("    S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS."),
    "sentenceDocDiagnoseNSLookup2" : MessageLookupByLibrary.simpleMessage("    Voici les meilleures solutions:"),
    "sentenceDocDiagnoseNSLookup3" : MessageLookupByLibrary.simpleMessage("    Pour les appareils portable, redémarrez le Wifi."),
    "sentenceDocDiagnoseNetstat" : MessageLookupByLibrary.simpleMessage("    Affiche des statistiques sur les connexions TCP."),
    "sentenceDocDiagnosePerm" : MessageLookupByLibrary.simpleMessage("    Indique si vous avez authorisé le GPS pour déterminer le SSID."),
    "sentenceDocDiagnosePingDNS" : MessageLookupByLibrary.simpleMessage("    Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet."),
    "sentenceDocDiagnosePingGateway" : MessageLookupByLibrary.simpleMessage("    Cette information ne sert à rien. La passerelle ignore les pings. Cependant, si un ping est reçu, quelqu\'un a probablement pris sont IP. Mais, rien est certain."),
    "sentenceDocDiagnosePingLo" : MessageLookupByLibrary.simpleMessage("    Vérifie si le logiciel TCP/IP fonctionne. Devrait être toujours positif."),
    "sentenceDocDiagnosePingLocal1" : MessageLookupByLibrary.simpleMessage("    Ping à un ordinateur local (10.163.0.5, qui est le serveur Minitel et devrait être toujours allumé).\n\nSi les paquets sont perdus, ceci sont les scenarios les plus probable:\n"),
    "sentenceDocDiagnosePingLocal2" : MessageLookupByLibrary.simpleMessage("    1.  Vous n\'avez pas d\'IP."),
    "sentenceDocDiagnosePingLocal3" : MessageLookupByLibrary.simpleMessage(" (Alertez immediatement à Minitel)\n"),
    "sentenceDocDiagnosePingLocal4" : MessageLookupByLibrary.simpleMessage("    2.  Vous n\'êtes pas connecté au réseau local.\n    3.  Le serveur (10.163.0.5) est éteint. (vous pouvez ping 10.163.0.10)\n"),
    "sentenceDocDiagnoseTraceroute" : MessageLookupByLibrary.simpleMessage("    Affiche le chemin et les délais des paquets vers un serveur Google."),
    "sentenceDocDiagnoseifconfig" : MessageLookupByLibrary.simpleMessage("    Donne des informations utiles sur le matériel.\n\n    Informations utiles:\n      - Status\n      - Addresse IP\n      - Addresse MAC\n"),
    "sentenceDocLogin1" : MessageLookupByLibrary.simpleMessage("Choisir entre fw-cgcp.emse.fr et 10.163.0.2\n"),
    "sentenceDocLogin2" : MessageLookupByLibrary.simpleMessage("Si le réseau local est WiFi MINITEL, utiliser 10.163.0.2.\nSinon, vous pouvez essayer fw-cgcp.emse.fr."),
    "sentenceNotConnected" : MessageLookupByLibrary.simpleMessage("Non connecté au Wifi ni au Mobile."),
    "sentenceReportingNOTE" : MessageLookupByLibrary.simpleMessage("REMARQUE : Il est recommandé d\'installer le Root et Busybox."),
    "sentenceReportingParagraph" : MessageLookupByLibrary.simpleMessage("Exemple : \nTitre: 2012, pas Internet depuis Lundi.\nDescription: Je perds fréquemment la connexion lorsque je suis sur Ethernet. Le Wifi, c\'est ok."),
    "sentenceReportingSubTitle1" : MessageLookupByLibrary.simpleMessage("1. Connectez-vous à \'WiFi Minitel\'"),
    "sentenceReportingSubtitle2" : MessageLookupByLibrary.simpleMessage("2. Lancez la suite de diagnostique en appuyant sur le bouton, et attendez 1 minute."),
    "sentenceReportingSubtitle3" : MessageLookupByLibrary.simpleMessage("3. Remplissez votre rapport."),
    "sentenceReportingSubtitle4" : MessageLookupByLibrary.simpleMessage("4. Connectez-vous sur un réseau où il y a Internet."),
    "sentenceReportingSubtitle5" : MessageLookupByLibrary.simpleMessage("5. Envoyez le rapport."),
    "sentenceReportingTitle" : MessageLookupByLibrary.simpleMessage("Comment signaler sans internet ?"),
    "title" : MessageLookupByLibrary.simpleMessage("Boîte à outils Minitel"),
    "titleCalendarPage" : MessageLookupByLibrary.simpleMessage("Calendrier"),
    "titleDiagnosePage" : MessageLookupByLibrary.simpleMessage("Diagnostique"),
    "titleDocumentationPage" : MessageLookupByLibrary.simpleMessage("Documentation"),
    "titleHowShouldIReact" : MessageLookupByLibrary.simpleMessage("Comment devrais-je réagir?"),
    "titleLoginPage" : MessageLookupByLibrary.simpleMessage("Connexion à la Passerelle"),
    "titleMapsPage" : MessageLookupByLibrary.simpleMessage("Map"),
    "titleNewsPage" : MessageLookupByLibrary.simpleMessage("News"),
    "titleReportingPage" : MessageLookupByLibrary.simpleMessage("Signaler Minitel"),
    "verbDiagnose" : MessageLookupByLibrary.simpleMessage("Diagnostiquer"),
    "wordDomain" : MessageLookupByLibrary.simpleMessage("Nom de domaine"),
    "wordHour" : MessageLookupByLibrary.simpleMessage("heure"),
    "wordPassword" : MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "wordSurnameName" : MessageLookupByLibrary.simpleMessage("Prénom.Nom"),
    "wordUsername" : MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
    "wordsAuthDuration" : MessageLookupByLibrary.simpleMessage("Durée d\'authentification ")
  };
}
