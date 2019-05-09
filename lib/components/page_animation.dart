import 'package:flutter/material.dart';

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

// class SlideRightRoute<T> extends MaterialPageRoute<T> {
//   SlideRightRoute({WidgetBuilder builder, RouteSettings settings})
//       : super(builder: builder, settings: settings);

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     if (settings.isInitialRoute) return child;
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: const Offset(1.0, 0.0),
//         end: Offset.zero,
//       ).animate(
// CurvedAnimation(
//   parent: animation,
//   curve: Curves.fastOutSlowIn,
// ),
//       ),
//       child: child,
//     );
//   }
// }

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) =>
              widget,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation1,
                  Animation<double> animation2,
                  Widget child) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              ),
        );
}
