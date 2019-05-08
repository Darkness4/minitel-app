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
              text: "Choisir entre fw-cgcp.emse.fr et 10.163.0.2\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text:
                      "Si le réseau local est WiFi MINITEL, utiliser 10.163.0.2.\nSinon, vous pouvez essayer fw-cgcp.emse.fr.",
                  style: Theme.of(context).textTheme.body1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
