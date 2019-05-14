import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CampusWebView extends StatelessWidget {
  final String cookie;
  const CampusWebView({Key key, this.cookie = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      headers: <String, String>{'cookie': cookie},
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Campus EMSE"),
      ),
      url: 'https://campus.emse.fr/',
    );
  }
}
