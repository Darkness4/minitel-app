import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnuaireWebView extends StatelessWidget {
  final Widget child;

  AnnuaireWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Annuaire"),
      ),
      body: WebView(
        initialUrl: 'http://annuaire.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
