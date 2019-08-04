import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class DiagnoseDoc extends StatelessWidget {
  const DiagnoseDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const BoxMdH("Diagnostique", 1),
              const BoxMdH("Permission Location", 2),
              const Text(
                "Indique si vous avez authorisé le GPS pour déterminer le SSID (identifiant du réseau).",
                style: MinitelTextStyles.body1,
              ),
              const BoxMdH("ip a", 2),
              const Text.rich(
                TextSpan(
                    text: "Donne des informations utiles sur le matériel.\n\n"
                        "Informations utiles:\n"
                        "- Status\n"
                        "- Addresse IP\n"
                        "- Addresse MAC",
                    style: MinitelTextStyles.body1),
              ),
              const BoxMdH("Address Resolution Protocol", 2),
              const Text.rich(
                TextSpan(
                  text: "Affiche les adresses MAC de tous les appareils "
                      "connectés au téléphone.\n\n"
                      "La Passerelle devrait être affiché et l\'addresse"
                      " MAC doit être 00-0d-b4-10-99-e1.\n\n"
                      "Si l'addresse MAC de la passerelle ne correspond pas "
                      "à celui de la passerelle, on a affaire à une ARP "
                      "poisonning : \n",
                  style: MinitelTextStyles.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Le voleur d'IP de la passerelle répond à la réponse "
                          "ARP envoyé en broadcast par la victime, plus "
                          "rapidement que la passerelle.\n\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "Une solution temporaire (uniquement lorsque le "
                          "WiFi est allumé) est :",
                      style: MinitelTextStyles.mdH5,
                    ),
                  ],
                ),
              ),
              const LogCard("arp -s 10.163.0.2 00-0d-b4-10-99-e1",
                  title: "cmd.exe (Admin)    (Windows)"),
              const LogCard("arp -s 10.163.0.2 00:0d:b4:10:99:e1",
                  title: "Shell    (Linux)"),
              const BoxMdH("Traceroute", 2),
              const Text(
                "Affiche le chemin et les délais des paquets vers un serveur Google.\n"
                "Utile pour voir les causes de lag.",
                style: MinitelTextStyles.body1,
              ),
              const BoxMdH("Ping Loopback", 2),
              const Text.rich(TextSpan(
                text: "Vérifie si le logiciel TCP/IP fonctionne.\n",
                style: MinitelTextStyles.body1,
                children: <TextSpan>[
                  TextSpan(
                    text: "Devrait être toujours positif.",
                    style: MinitelTextStyles.mdH5,
                  ),
                ],
              )),
              const BoxMdH("Ping Local", 2),
              const Text.rich(
                TextSpan(
                  text: "Ping à un ordinateur local (10.163.0.5, qui est le "
                      "serveur Minitel et devrait être toujours allumé).\n\n"
                      "Si les paquets sont perdus, ceci sont les scenarios les plus probable:\n"
                      "    1.  Vous n\'avez pas d\'IP.",
                  style: MinitelTextStyles.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          " (Voir ip a, et alertez immediatement à Minitel)\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text:
                          "    2.  Vous n\'êtes pas connecté au réseau local.\n"
                          "    3.  Le serveur (10.163.0.5) est déconnecté. (vous pouvez ping 10.163.0.10)\n"
                          "    4.  Un switch de la Maison des Elèves est déconnecté.\n"
                          "    5.  Un switch de la résidence est déconnecté.",
                      style: MinitelTextStyles.body1,
                    )
                  ],
                ),
              ),
              const BoxMdH("HTTP Gateway Response", 2),
              Text(
                "Si une erreur 4xx ou 5xx apparait, veuillez le signaler à Minitel.",
                style: MinitelTextStyles.mdH5.apply(color: Colors.red),
              ),
              const BoxMdH("HTTP Codes", 3),
              const Text.rich(
                TextSpan(
                  text: "1xx Informational response\n",
                  style: MinitelTextStyles.mdH4,
                  children: <TextSpan>[
                    TextSpan(
                      text: "2xx Success\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "3xx Redirection\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "    301 Moved Permanently\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "4xx Client errors\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "    400 Bad Request\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    401 Unauthorized\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    403 Forbidden\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "5xx Server errors\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "    500 Internal Server Error\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    502 Bad Gateway\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    503 Service Unavailable\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    504 Gateway Timeout",
                      style: MinitelTextStyles.mdH5,
                    ),
                  ],
                ),
              ),
              const BoxMdH("Comment devrais-je réagir?", 2),
              const Text(
                "S'il n'y a plus de réseau, contactez Minitel et "
                "utilisez la suite diagnostique dans la page"
                " \"Signaler Minitel\"",
                style: MinitelTextStyles.mdH5,
              ),
              const BoxMdH("Ping Gateway", 2),
              const Text(
                "La passerelle ignore normalement les pings."
                " Cependant, si un ping est reçu, quelqu\'un a probablement"
                " pris sont IP. Mais, rien est certain.",
                style: MinitelTextStyles.body1,
              ),
              const BoxMdH("Ping DNS", 2),
              const Text.rich(
                TextSpan(
                  text: "DNS 1: 192.168.130.33\n"
                      "DNS 2: 192.168.130.3\n"
                      "DNS 3: 8.8.8.8\n"
                      "DNS 4: 1.1.1.1\n"
                      "DNS 5: 10.163.0.6",
                  style: MinitelTextStyles.mdH5,
                ),
              ),
              const Text(
                "Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet.",
                style: MinitelTextStyles.body1,
              ),
              const BoxMdH("NSLookup", 2),
              const Text.rich(
                TextSpan(
                  text:
                      "S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS.\n",
                  style: MinitelTextStyles.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Pour les appareils portable, redémarrez le Wifi.\n"
                          "Voici des solutions proposées:",
                      style: MinitelTextStyles.mdH5,
                    ),
                  ],
                ),
              ),
              const LogCard("ipconfig /flushdns",
                  title: "cmd.exe (Admin)    (Windows)"),
              const LogCard("sudo systemd-resolve --flush-caches",
                  title: "Shell    (Ubuntu and Debian-based)"),
              const LogCard("sudo systemctl restart nscd",
                  title: "Shell    (Arch Linux)"),
              const LogCard("sudo systemctl restart dnsmasq",
                  title: "Shell    (Linux in general)"),
              const LogCard("sudo systemctl restart named",
                  title: "Shell    (Linux Traditional)"),
              const LogCard("sudo killall -HUP mDNSResponder",
                  title:
                      "Terminal    (OSX Yosemite and later, Mavericks, Mountain Lion and Lion)"),
              const LogCard("sudo discoveryutil mdnsflushcache",
                  title: "Terminal    (OSX Yosemite v10.10 through v10.10.3)"),
              const LogCard("sudo dscacheutil -flushcache",
                  title: "Terminal    (OSX Snow Leopard)"),
            ],
          ),
        ),
      ),
    );
  }
}
