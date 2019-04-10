import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CampusWebView extends StatelessWidget {
  final Widget child;

  CampusWebView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Campus EMSE",
        ),
      ),
      body: WebView(
        initialUrl: 'https://campus.emse.fr/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
