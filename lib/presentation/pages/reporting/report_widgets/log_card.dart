import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';

class LogCard extends StatelessWidget {
  final String title;
  final String text;
  final double elevation;

  const LogCard(
    this.text, {
    required this.title,
    Key? key,
    this.elevation = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: elevation,
        color: MinitelColors.terminalHeaderColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: SelectableText(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: MinitelColors.terminalBgColor,
              ),
              child: SelectableText(
                text,
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'RobotoMono',
                  color: MinitelColors.terminalFgColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
