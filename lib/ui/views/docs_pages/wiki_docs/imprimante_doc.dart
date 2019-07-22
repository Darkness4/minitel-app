import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class ImprimanteDoc extends StatelessWidget {
  const ImprimanteDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH("Configurer l'imprimante", 1),
          BoxMdH("Windows", 2),
          Image.asset("assets/img/Lecteur-reseau.png"),
          Text(
            """    -  Ouvrir \\\\192.168.130.2 avec l'explorer Windows
    -  Mettre prenom.nom et mot de passe (testez également EMSE2000\\prenom.nom)
    -  Double-cliquer sur \"imprimantes-gpc\"""",
          ),
          BoxMdH("Ubuntu", 2),
          Image.asset("assets/img/Linux.png"),
          Text(
            """    -  Ajoutez smb://192.168.130.2/imprimantes-gcp aux imprimantes réseaux
    -  Pilote: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd""",
          ),
          BoxMdH("Linux: CUPS", 2),
          Text("    -  Installez cups"),
          LogCard(
            "sudo apt install cups",
            title: "Shell - Installer CUPS",
          ),
          LogCard(
            "sudo systemctl start cups.service",
            title: "Shell - Lancer le service CUPS",
          ),
          LogCard(
            "sudo usermod -aG lpadmin <PSEUDO>",
            title: "Shell - Ajout de l'user chez les lpadmin",
          ),
          Text(
              "    -  Accedez à http://localhost:631/admin (nom de compte et mot de passe linux)"),
          Text("    -  Onglet \"Administration\""),
          Text("    -  \"Add Printer\""),
          Text("    -  Type SMB, addresse smb://192.168.130.2/imprimantes-gcp"),
          Text(
              "    -  Utilisez le fichier PPD : https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd"),
          Text("    -  Configurez la suite et ça devrait-être ok"),
          BoxMdH("Code PUK", 2),
          Text("Utilisez l'application de Minitel > Apps > Imprimante"),
        ],
      ),
    );
  }
}
