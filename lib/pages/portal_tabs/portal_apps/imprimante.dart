import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ImprimanteWebView extends StatelessWidget {
  const ImprimanteWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Imprimante EMSE"),
      ),
      url:
          'https://vpnssl.emse.fr/dana/home/userpass.cgi?url=%2Fwatchdoc%2F%2CDanaInfo%3D192.168.130.2%2B&domain=EMSE2000&sidebar=off&proxy=0&ssoType=1',
    );
  }
}
