import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitlabWebView extends StatelessWidget {
  final Widget child;

  GitlabWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Gitlab EMSE"),
      ),
      body: WebView(
        initialUrl: 'https://gitlab.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
