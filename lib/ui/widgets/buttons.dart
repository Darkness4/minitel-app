import 'package:flutter/material.dart';

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
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            elevation: 4,
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(context).primaryColor,
            child: child,
            mini: true,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
