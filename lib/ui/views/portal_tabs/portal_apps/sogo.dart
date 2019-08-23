import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';

class SogoWebView extends StatelessWidget {
  const SogoWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWebView(
      backgroundColor: Colors.green,
      title: Text("Sogo"),
      initialUrl: 'https://sogo.emse.fr/',
    );
  }
}
