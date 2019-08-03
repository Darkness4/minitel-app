import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MinitelWebView extends StatelessWidget {
  const MinitelWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return WebviewScaffold(
    //   appBar: AppBar(
    // backgroundColor: Colors.blue,
    // title: const Text("Minitel Wiki"),
    //   ),
    //   url: 'http://minitel.emse.fr/wiki/Wiki-user',
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Minitel Wiki"),
      ),
      body: const SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'http://minitel.emse.fr/wiki/Wiki-user',
        ),
      ),
    );
  }
}
