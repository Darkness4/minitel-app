import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
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
          const BoxMdH("Configurer l'imprimante", 1),
          const BoxMdH("Windows", 2),
          Image.asset(AssetPaths.DocLecteurReseau),
          const Text(
            """    -  Ouvrir \\\\192.168.130.2 avec l'explorer Windows
    -  Mettre prenom.nom et mot de passe (testez également EMSE2000\\prenom.nom)
    -  Double-cliquer sur \"imprimantes-gpc\"""",
          ),
          const BoxMdH("Ubuntu", 2),
          Image.asset(AssetPaths.DocImprimanteLinux),
          const Text(
            """    -  Ajoutez smb://192.168.130.2/imprimantes-gcp aux imprimantes réseaux
    -  Pilote: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd""",
          ),
          const BoxMdH("Linux: CUPS", 2),
          const Text("    -  Installez cups"),
          const LogCard(
            "sudo apt install cups",
            title: "Shell - Installer CUPS",
          ),
          const LogCard(
            "sudo systemctl start cups.service",
            title: "Shell - Lancer le service CUPS",
          ),
          const LogCard(
            "sudo usermod -aG lpadmin <PSEUDO>",
            title: "Shell - Ajout de l'user chez les lpadmin",
          ),
          const Text(
              "    -  Accedez à http://localhost:631/admin (nom de compte et mot de passe linux)\n"
              "    -  Onglet \"Administration\"\n"
              "    -  \"Add Printer\"\n"
              "    -  Type SMB, addresse smb://192.168.130.2/imprimantes-gcp\n"
              "    -  Utilisez le fichier PPD : https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd\n"
              "    -  Configurez la suite et ça devrait-être ok"),
          BoxMdH("Code PUK", 2),
          const Text("Utilisez l'application de Minitel > Apps > Imprimante"),
        ],
      ),
    );
  }
}
