import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SogoWebView extends StatelessWidget {
  const SogoWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return WebviewScaffold(
    //   appBar: AppBar(
    // backgroundColor: Colors.green,
    // title: const Text("Sogo"),
    //   ),
    //   url: 'https://sogo.emse.fr/',
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Sogo"),
      ),
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://sogo.emse.fr/',
        ),
      ),
    );
  }
}
