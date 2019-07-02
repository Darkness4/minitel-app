import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PortailWebView extends StatelessWidget {
  final String cookie;

  const PortailWebView({Key key, this.cookie: ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Portail"),
      ),
      url: 'http://portail.emse.fr/',
    );
  }
}
