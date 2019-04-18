import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CampusWebView extends StatelessWidget {

  const CampusWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Campus EMSE"),
      ),
      body: const WebView(
        initialUrl: 'https://campus.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
