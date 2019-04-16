import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrometheeWebView extends StatelessWidget {
  const PrometheeWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Prométhée"),
      ),
      body: const WebView(
        initialUrl: 'https://promethee.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
