import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class MailDoc extends StatelessWidget {
  const MailDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH("Importation des mails Sogo", 1),
          Text(
              "Avec votre application mail préférée, utilisez la configuration "
              "manuelle et remplissez les champs correspondant."),
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("""Email : prenom.nom@etu.emse.fr
Mot de passe : ton mot de passe école

Serveur entrant : IMAP
Nom d'hote : messel.emse.fr
Port : 993
Sécurité : ssl/tls
Méthode d'authentification : mot de passe normal
Identifiant : prenom.nom (⚠️ sans le @etu.emse.fr)

Serveur sortant :
Nom d'hôte : messel.emse.fr
Port : 465
Sécurité : ssl/tls
Méthode d'authentification : mot de passe normal
Identifiant : prenom.nom (⚠️ sans le @etu.emse.fr)"""),
            ),
          ),
        ],
      ),
    );
  }
}
