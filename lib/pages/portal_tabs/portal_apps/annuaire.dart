import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AnnuaireWebView extends StatelessWidget {
  const AnnuaireWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Annuaire"),
      ),
      url: 'http://annuaire.emse.fr/',
    );
  }
}
