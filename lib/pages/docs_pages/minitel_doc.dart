import 'package:auto_login_flutter/components/cards.dart';
import 'package:flutter/material.dart';

class MinitelDoc extends StatelessWidget {
  const MinitelDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Text(
            "Template",
            style: Theme.of(context).textTheme.display2,
          ),
        ],
      ),
    );
  }
}
