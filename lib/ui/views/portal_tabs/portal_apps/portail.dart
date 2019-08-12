import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortailWebView extends StatelessWidget {
  const PortailWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Portail"),
      ),
      body: const SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'http://portail.emse.fr/',
        ),
      ),
    );
  }
}
