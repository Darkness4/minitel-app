import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SogoWebView extends StatelessWidget {
  const SogoWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Sogo"),
        elevation: 0.0,
      ),
      body: const SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://sogo.emse.fr/',
        ),
      ),
    );
  }
}
