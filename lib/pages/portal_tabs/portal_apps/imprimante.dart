import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ImprimanteWebView extends StatelessWidget {
  final Widget child;

  ImprimanteWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Imprimante EMSE"),
      ),
      body: WebView(
        initialUrl: 'http://192.168.130.2/watchdoc',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
