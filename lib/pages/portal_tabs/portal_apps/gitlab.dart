import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitlabWebView extends StatelessWidget {
  const GitlabWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Gitlab EMSE"),
      ),
      body: const WebView(
        initialUrl: 'https://gitlab.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
