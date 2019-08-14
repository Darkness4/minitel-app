import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ImprimanteWebView extends StatelessWidget {
  const ImprimanteWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Imprimante EMSE"),
      ),
      body: const SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://vpnssl.emse.fr/watchdoc,DanaInfo=192.168.130.2',
        ),
      ),
    );
  }
}
