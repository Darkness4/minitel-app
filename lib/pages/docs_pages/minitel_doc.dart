import 'package:flutter/material.dart';
import 'package:minitel_toolbox/components/cards.dart';

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
