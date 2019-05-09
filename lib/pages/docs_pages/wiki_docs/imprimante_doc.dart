import 'package:minitel_toolbox/components/cards.dart';
import 'package:flutter/material.dart';

class ImprimanteDoc extends StatelessWidget {
  const ImprimanteDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Text(
            "Configurer l'imprimante",
            style: Theme.of(context).textTheme.display1,
          ),
          Text(
            "Windows",
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            """    -  Ouvrir \\\\192.168.130.2 avec l'explorer Windows
    -  Mettre prenom.nom et mot de passe (testez également EMSE2000\\prenom.nom)
    -  Double-cliquer sur \"imprimantes-gpc\"""",
          ),
          Text(
            "Ubuntu",
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            """    -  Ajoutez smb://192.168.130.2/imprimantes-gcp aux imprimantes réseaux
    -  Pilote: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd""",
          ),
          Text(
            "Linux: CUPS",
            style: Theme.of(context).textTheme.title,
          ),
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
          Text("   -  Configurez la suite et ça devrait-être ok"),
          Text(
            "Code PUK",
            style: Theme.of(context).textTheme.title,
          ),
          Text("Utilisez l'application svp 😄"),
        ],
      ),
    );
  }
}
