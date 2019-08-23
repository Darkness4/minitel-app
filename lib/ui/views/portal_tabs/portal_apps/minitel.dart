import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';

class MinitelWebView extends StatelessWidget {
  const MinitelWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWebView(
      backgroundColor: Colors.blue,
      title: Text("Minitel Wiki"),
      initialUrl: 'http://minitel.emse.fr/wiki/Wiki-user',
    );
  }
}
