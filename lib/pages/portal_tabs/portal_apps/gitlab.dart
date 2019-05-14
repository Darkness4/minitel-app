import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class GitlabWebView extends StatelessWidget {
  const GitlabWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Gitlab EMSE"),
      ),
      url: 'https://gitlab.emse.fr/',
    );
  }
}
