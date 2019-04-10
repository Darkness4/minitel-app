import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrometheeWebView extends StatelessWidget {
  final Widget child;

  PrometheeWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Prométhée"),
      ),
      body: WebView(
        initialUrl: 'https://promethee.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
