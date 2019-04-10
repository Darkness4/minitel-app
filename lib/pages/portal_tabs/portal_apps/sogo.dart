import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SogoWebView extends StatelessWidget {
  final Widget child;

  SogoWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Sogo"),
      ),
      body: WebView(
        initialUrl: 'https://sogo.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
