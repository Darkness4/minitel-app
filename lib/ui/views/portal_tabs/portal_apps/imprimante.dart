import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';

class ImprimanteWebView extends StatelessWidget {
  const ImprimanteWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWebView(
      backgroundColor: Colors.grey,
      title: const Text("Imprimante EMSE"),
      initialUrl: 'https://vpnssl.emse.fr/watchdoc,DanaInfo=192.168.130.2',
    );
  }
}
