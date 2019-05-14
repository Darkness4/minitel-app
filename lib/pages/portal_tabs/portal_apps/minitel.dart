import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MinitelWebView extends StatelessWidget {
  const MinitelWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Minitel Wiki"),
      ),
      url: 'http://minitel.emse.fr/wiki/Wiki-user',
    );
  }
}
