import 'package:auto_login_flutter/components/cards.dart';
import 'package:flutter/material.dart';

class LoginDoc extends StatelessWidget {
  const LoginDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Text(
            "Authentification",
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
            "Nom de domaine / IP",
            style: Theme.of(context).textTheme.headline,
          ),
          Text.rich(
            TextSpan(
              text:
                  "Choisir entre fw-cgcp.emse.fr, 10.163.0.2 et 195.83.139.7\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "Si le réseau local supporte un DNS, tel que "
                      "192.168.130.33 (DSI) ou 10.163.0.6 (Minitel), vous "
                      "pouvez tenter fw-cgcp.emse.fr.\n",
                  style: Theme.of(context).textTheme.body1,
                ),
                TextSpan(
                  text: "Si le réseau est celui de Minitel (WiFi Minitel), "
                      "utilisez 10.163.0.2\n",
                  style: Theme.of(context).textTheme.body1,
                ),
                TextSpan(
                  text:
                      "Généralement, 195.83.139.7 convient dans 90 % des cas.\n"
                      "Il s'agit de l'addresse IP publique du portail, et est "
                      "autorisé par la passerelle.\n",
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
