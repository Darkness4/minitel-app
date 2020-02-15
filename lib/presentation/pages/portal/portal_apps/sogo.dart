import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';

class SogoWebView extends StatelessWidget {
  const SogoWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWebView(
      backgroundColor: Colors.green,
      initialUrl: 'https://sogo.emse.fr/',
    );
  }
}
