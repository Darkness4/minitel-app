import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LogicielsWebView extends StatelessWidget {
  const LogicielsWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Logiciels"),
      ),
      url: 'http://edusoft.emse.fr/',
    );
  }
}
