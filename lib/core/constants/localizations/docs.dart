import 'package:intl/intl.dart';

class DocsLoc {
  final String localeName;
  final DiagnoseLoc diagnose;
  DocsLoc(this.localeName) : diagnose = DiagnoseLoc(localeName);
}

class DiagnoseLoc {
  final String localeName;
  const DiagnoseLoc(this.localeName);

  String get header => Intl.message(
        "Diagnostique",
        name: 'DiagnoseLoc_header',
        locale: localeName,
      );

  String get ipaContent => Intl.message(
        "Donne des informations utiles sur le matériel.\n\n"
        "Informations utiles:\n"
        "- Status\n"
        "- Adresse IP\n"
        "- Adresse MAC",
        name: 'DiagnoseLoc_ipaContent',
        locale: localeName,
      );

  String get arpContent1 => Intl.message(
        "Affiche les adresses MAC de tous les appareils "
        "connectés au téléphone.\n\n"
        "La Passerelle devrait être affiché et l\'adresse"
        " MAC doit être 00-0d-b4-10-99-e1.\n\n"
        "Si l'adresse MAC de la passerelle ne correspond pas "
        "à celui de la passerelle, on a affaire à une ARP "
        "poisonning : \n",
        name: 'DiagnoseLoc_arpContent1',
        locale: localeName,
      );

  String get arpContent2 => Intl.message(
        "Le voleur d'IP de la passerelle répond à la réponse "
        "ARP envoyé en broadcast par la victime, plus "
        "rapidement que la passerelle.\n\n",
        name: 'DiagnoseLoc_arpContent2',
        locale: localeName,
      );

  String get arpContent3 => Intl.message(
        "Une solution temporaire (uniquement lorsque le "
        "WiFi est allumé) est :",
        name: 'DiagnoseLoc_arpContent3',
        locale: localeName,
      );

  String get tracerouteContent => Intl.message(
        "Affiche le chemin et les délais des paquets vers un serveur Google.\n"
        "Utile pour voir les causes de lag.",
        name: 'DiagnoseLoc_tracerouteContent',
        locale: localeName,
      );

  String get pingLoContent1 => Intl.message(
        "Vérifie si le logiciel TCP/IP fonctionne.\n",
        name: 'DiagnoseLoc_pingLoContent1',
        locale: localeName,
      );

  String get pingLoContent2 => Intl.message(
        "Devrait être toujours positif.",
        name: 'DiagnoseLoc_pingLoContent2',
        desc: "Le ping loopback devrait être toujours positif.",
        locale: localeName,
      );

  String get pingLocalContent1 => Intl.message(
        "Ping à un ordinateur local (10.163.0.5, qui est le "
        "serveur Minitel et devrait être toujours allumé).\n\n"
        "Si les paquets sont perdus, ceci sont les scenarios les plus probable:\n"
        "    1.  Vous n\'avez pas d\'IP.",
        name: 'DiagnoseLoc_pingLocalContent1',
        locale: localeName,
      );

  String get pingLocalContent2 => Intl.message(
        " (Voir ip a, et alertez immediatement à Minitel)\n",
        name: 'DiagnoseLoc_pingLocalContent2',
        locale: localeName,
      );

  String get pingLocalContent3 => Intl.message(
        "    2.  Vous n\'êtes pas connecté au réseau local.\n"
        "    3.  Le serveur (10.163.0.5) est déconnecté. (vous pouvez ping 10.163.0.10)\n"
        "    4.  Un switch de la Maison des Elèves est déconnecté.\n"
        "    5.  Un switch de la résidence est déconnecté.",
        name: 'DiagnoseLoc_pingLocalContent3',
        locale: localeName,
      );

  String get httpContent => Intl.message(
        "Si une erreur 4xx ou 5xx apparait, veuillez le signaler à Minitel.",
        name: 'DiagnoseLoc_httpContent',
        locale: localeName,
      );

  String get reactionHeader => Intl.message(
        "Comment devrais-je réagir?",
        name: 'DiagnoseLoc_reactionHeader',
        locale: localeName,
      );

  String get reactionContent => Intl.message(
        "S'il n'y a plus de réseau, contactez Minitel et "
        "utilisez la suite diagnostique dans la page"
        " \"Signaler Minitel\"",
        name: 'DiagnoseLoc_reactionContent',
        locale: localeName,
      );

  String get pingGatewayContent => Intl.message(
        "La passerelle ignore normalement les pings."
        " Cependant, si un ping est reçu, quelqu\'un a probablement"
        " pris sont IP. Mais, rien est certain.",
        name: 'DiagnoseLoc_pingGatewayContent',
        locale: localeName,
      );

  String get pingDNSContent => Intl.message(
        "Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet.",
        name: 'DiagnoseLoc_pingDNSContent',
        locale: localeName,
      );

  String get nsLookupContent1 => Intl.message(
        "S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS.\n",
        name: 'DiagnoseLoc_nsLookupContent1',
        locale: localeName,
      );

  String get nsLookupContent2 => Intl.message(
        "Pour les appareils portable, redémarrez le Wifi.\n"
        "Voici des solutions proposées:",
        name: 'DiagnoseLoc_nsLookupContent2',
        locale: localeName,
      );
}
