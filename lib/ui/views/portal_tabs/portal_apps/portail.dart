import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortailWebView extends StatelessWidget {
  final String cookie;

  const PortailWebView({Key key, this.cookie: ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return WebviewScaffold(
    //   appBar: AppBar(
    // backgroundColor: Colors.deepPurple,
    // title: const Text("Portail"),
    //   ),
    //   headers: {"cookie": cookie},
    //   url: 'http://portail.emse.fr/',
    // );
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
