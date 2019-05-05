import 'package:auto_login_flutter/components/cards.dart';
import 'package:flutter/material.dart';

class DiagnoseDoc extends StatelessWidget {
  const DiagnoseDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Diagnostique",
                  style: Theme.of(context).textTheme.display2,
                ),
                Text(
                  "Permission Location",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  "Indique si vous avez authorisé le GPS pour déterminer le SSID.",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "ifconfig all/ip a",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text.rich(
                  TextSpan(
                      text: "Donne des informations utiles sur le matériel.\n\n"
                          "Informations utiles:\n"
                          "- Status\n"
                          "- Addresse IP\n"
                          "- Addresse MAC",
                      style: Theme.of(context).textTheme.body1),
                ),
                Text(
                  "Address Resolution Protocol",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text.rich(
                  TextSpan(
                      text:
                          "Affiche les adresses MAC de tous les appareils connectés au téléphone.\n\n"
                          "La Passerelle devrait être affiché et l\'addresse MAC doit être 00-0d-b4-10-99-e1. Sinon, signalez-le à Minitel.",
                      style: Theme.of(context).textTheme.body1),
                ),
                Text(
                  "Traceroute",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  "Affiche le chemin et les délais des paquets vers un serveur Google.",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "NetStat",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  "Affiche des statistiques sur les connexions TCP.",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "Ping Loopback",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  "Vérifie si le logiciel TCP/IP fonctionne. Devrait être toujours positif.",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "Ping Local",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text.rich(
                  TextSpan(
                    text:
                        "Ping à un ordinateur local (10.163.0.5, qui est le serveur Minitel et devrait être toujours allumé).\n\n"
                        "Si les paquets sont perdus, ceci sont les scenarios les plus probable:\n"
                        "    1.  Vous n\'avez pas d\'IP.",
                    style: Theme.of(context).textTheme.body1,
                    children: <TextSpan>[
                      TextSpan(
                        text: " (Alertez immediatement à Minitel)\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text:
                            "    2.  Vous n\'êtes pas connecté au réseau local.\n"
                            "    3.  Le serveur (10.163.0.5) est éteint. (vous pouvez ping 10.163.0.10)",
                        style: Theme.of(context).textTheme.body1,
                      )
                    ],
                  ),
                ),
                Text(
                  "HTTP Gateway Response",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  "Si une erreur 4xx apparait, veuillez le signaler aux developeurs.",
                  style: Theme.of(context).textTheme.body2,
                ),
                Text.rich(
                  TextSpan(
                    text: "HTTP Codes\n",
                    style: Theme.of(context).textTheme.title,
                    children: <TextSpan>[
                      TextSpan(
                        text: "1xx Informational response\n",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextSpan(
                        text: "2xx Success\n",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextSpan(
                        text: "3xx Redirection\n",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextSpan(
                        text: "    301 Moved Permanently\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "4xx Client errors\n",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextSpan(
                        text:
                            "    Si vous avez une erreur OS, la passerelle a un problème, et vous devriez le signaler à la DSI.\n",
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: Colors.red),
                      ),
                      TextSpan(
                        text: "    400 Bad Request\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "    401 Unauthorized\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "    403 Forbidden\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "5xx Server errors\n",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextSpan(
                        text: "    500 Internal Server Error\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "    502 Bad Gateway\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "    503 Service Unavailable\n",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      TextSpan(
                        text: "    504 Gateway Timeout",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Comment devrais-je réagir?",
                  style: Theme.of(context).textTheme.title,
                ),
                Text.rich(
                  TextSpan(
                    text:
                        "Si vous avez une erreur OS, la passerelle a un problème, et vous devriez le signaler à la DSI.\n"
                        "Si vous avez une erreur HTTP 4xx, l\'outil de diagnostique a un problème, et vous devriez le signaler aux developeurs.\n"
                        "Si vous avez une erreur HTTP 5xx, la passerelle a un problème, et vous devriez le signaler à la DSI.\n",
                    style: Theme.of(context).textTheme.body1,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Un bouton Partage a été mis en place pour envoyer 90% des informations nécessaire pour une réparation complète.\n"
                            "Sur 10.163.0.10, vous pouvez signaler aux administrateurs.",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Ping Gateway",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  "La passerelle ignore les pings. Cependant, si un ping est reçu, quelqu\'un a probablement pris sont IP. Mais, rien est certain.",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "Ping DNS",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text.rich(
                  TextSpan(
                    text: "DNS 1: 192.168.130.33\n"
                        "DNS 2: 192.168.130.3\n"
                        "DNS 3: 8.8.8.8\n"
                        "DNS 4: 1.1.1.1\n"
                        "DNS 5: 10.163.0.6",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                Text(
                  "Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet.",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "NSLookup",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text.rich(
                  TextSpan(
                    text:
                        "S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS.\n",
                    style: Theme.of(context).textTheme.body1,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Pour les appareils portable, redémarrez le Wifi.\n"
                            "Voici les meilleures solutions:",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ],
                  ),
                ),
                LogCard("ipconfig /flushdns",
                    title: "cmd.exe (Admin)    (Windows)"),
                LogCard("sudo systemd-resolve --flush-caches",
                    title: "bash    (Ubuntu and Debian-based)"),
                LogCard("sudo systemctl restart nscd",
                    title: "bash    (Arch Linux)"),
                LogCard("sudo systemctl restart dnsmasq",
                    title: "bash    (Linux in general)"),
                LogCard("sudo systemctl restart named",
                    title: "bash    (Linux Traditional)"),
                LogCard("sudo killall -HUP mDNSResponder",
                    title:
                        "Terminal    (OSX Yosemite and later, Mavericks, Mountain Lion and Lion)"),
                LogCard("sudo discoveryutil mdnsflushcache",
                    title:
                        "Terminal    (OSX Yosemite v10.10 through v10.10.3)"),
                LogCard("sudo dscacheutil -flushcache",
                    title: "Terminal    (OSX Snow Leopard)"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
