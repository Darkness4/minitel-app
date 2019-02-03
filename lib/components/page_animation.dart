// Not used

import 'package:flutter/material.dart';

class CrossFadeRoute extends PageRouteBuilder {
  final Widget widget;

  CrossFadeRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation1,
              Animation<double> animation2) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child) {
            return FadeTransition(
              opacity: animation1,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 2000),
        );
}
