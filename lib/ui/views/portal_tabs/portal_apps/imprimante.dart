import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/imprimante_api.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ImprimanteWebView extends StatelessWidget {
  const ImprimanteWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImprimanteAPI _imprimanteAPI = Provider.of<ImprimanteAPI>(context);
    final CookieManager cookieManager = CookieManager();

    if (_imprimanteAPI.cookie != null) {
      cookieManager.setCookie('192.168.130.2', _imprimanteAPI.cookie);
    }

    return ScaffoldWebView(
      backgroundColor: Colors.grey,
      title: const Text("Imprimante EMSE"),
      initialUrl: 'http://192.168.130.2/watchdoc/jobs.asp?instance=default',
    );
  }
}
