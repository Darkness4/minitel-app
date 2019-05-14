import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PrometheeWebView extends StatelessWidget {
  const PrometheeWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Prométhée"),
      ),
      url: 'https://promethee.emse.fr/',
    );
  }
}
