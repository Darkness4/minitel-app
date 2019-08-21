import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

class AnimatedFloatingButton extends StatelessWidget {
  final String text;
  final double start;
  final double end;
  final Widget child;
  final Function onPressed;
  final AnimationController controller;

  const AnimatedFloatingButton(
    this.text, {
    Key key,
    this.start = 0.0,
    this.end = 1.0,
    @required this.controller,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ScaleTransition(
          scale: CurvedAnimation(
            parent: controller,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            elevation: 4,
          ),
        ),
        ScaleTransition(
          scale: CurvedAnimation(
            parent: controller,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
          child: FloatingActionButton(
            heroTag: null,
            backgroundColor: MinitelColors.ReportPrimaryColor,
            child: child,
            mini: true,
            tooltip: text,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
