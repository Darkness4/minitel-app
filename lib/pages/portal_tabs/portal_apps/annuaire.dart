import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnuaireWebView extends StatelessWidget {

  const AnnuaireWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Annuaire"),
      ),
      body: const WebView(
        initialUrl: 'http://annuaire.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
