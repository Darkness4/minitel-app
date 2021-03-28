import 'package:flutter/material.dart';

class DocCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final double intPadding;

  const DocCard({
    required this.children,
    this.elevation = 4.0,
    this.intPadding = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.all(intPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
