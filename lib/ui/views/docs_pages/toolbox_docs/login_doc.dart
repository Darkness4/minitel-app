import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class LoginDoc extends StatelessWidget {
  const LoginDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH("Authentification", 1),
          InkWell(
            child: Image.asset("assets/img/network.jpg"),
            onTap: () {},
          ),
          BoxMdH("Nom de domaine / IP", 2),
          Text.rich(
            TextSpan(
              text:
                  "Choisir entre fw-cgcp.emse.fr, 10.163.0.2 et 195.83.139.7\n",
              style: MinitelTextStyles.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "Si le réseau local supporte un DNS, tel que "
                      "192.168.130.33 (DSI) ou 10.163.0.6 (Minitel), vous "
                      "pouvez tenter fw-cgcp.emse.fr.\n",
                  style: MinitelTextStyles.body1,
                ),
                TextSpan(
                  text: "Si le réseau est celui de Minitel (WiFi Minitel), "
                      "utilisez 10.163.0.2\n",
                  style: MinitelTextStyles.body1,
                ),
                TextSpan(
                  text:
                      "Généralement, 195.83.139.7 convient dans 90 % des cas.\n"
                      "Il s'agit de l'addresse IP publique du portail, et est "
                      "autorisé par la passerelle.\n",
                  style: MinitelTextStyles.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
