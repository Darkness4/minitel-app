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
      body: const WebView(
        initialUrl: 'http://192.168.130.2/watchdoc',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
