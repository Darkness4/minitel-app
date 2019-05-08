import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LogicielsWebView extends StatelessWidget {
  const LogicielsWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Logiciels"),
      ),
      body: const WebView(
        initialUrl: 'http://edusoft.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
