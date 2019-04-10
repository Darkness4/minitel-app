import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LogicielsWebView extends StatelessWidget {
  final Widget child;

  LogicielsWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Logiciels"),
      ),
      body: WebView(
        initialUrl: 'http://edusoft.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
