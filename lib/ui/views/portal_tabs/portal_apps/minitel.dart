import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';

class MinitelWebView extends StatelessWidget {
  const MinitelWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWebView(
      backgroundColor: Colors.blue,
      title: const Text("Minitel Wiki"),
      initialUrl: 'http://minitel.emse.fr/wiki/Wiki-user',
    );
  }
}
