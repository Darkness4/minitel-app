import 'package:auto_login_flutter/components/cards.dart';
import 'package:flutter/material.dart';

class BridgeDoc extends StatelessWidget {
  const BridgeDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Text(
            "Template", // Parler des dangers des Virtuals network bridge. Noter POSTMORTEM Mars 2018
            style: Theme.of(context).textTheme.display2,
          ),
        ],
      ),
    );
  }
}
