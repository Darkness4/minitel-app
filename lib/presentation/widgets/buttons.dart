import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';

class AnimatedFloatingButton extends StatelessWidget {
  final String text;
  final double start;
  final double end;
  final Widget child;
  final void Function() onPressed;
  final AnimationController controller;

  const AnimatedFloatingButton(
    this.text, {
    @required this.controller,
    @required this.child,
    @required this.onPressed,
    Key key,
    this.start = 0.0,
    this.end = 1.0,
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
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: CurvedAnimation(
            parent: controller,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
          child: FloatingActionButton(
            heroTag: null,
            backgroundColor: MinitelColors.reportPrimaryColor,
            mini: true,
            tooltip: text,
            onPressed: onPressed,
            child: child,
          ),
        ),
      ],
    );
  }
}
