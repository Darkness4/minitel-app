import 'package:flutter/material.dart';

class SuperCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final double extPadding;
  final double intPadding;

  SuperCard(
      {@required this.children,
      this.elevation: 3.0,
      this.extPadding: 10.0,
      this.intPadding: 10.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(extPadding),
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(4),
        type: MaterialType.card,
        child: Container(
          padding: EdgeInsets.all(intPadding),
          child: Column(children: children),
        ),
      ),
    );
  }
}
