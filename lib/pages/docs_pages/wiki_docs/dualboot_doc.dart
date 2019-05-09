import 'package:minitel_toolbox/components/cards.dart';
import 'package:flutter/material.dart';

class DualBootDoc extends StatelessWidget {
  const DualBootDoc({
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
