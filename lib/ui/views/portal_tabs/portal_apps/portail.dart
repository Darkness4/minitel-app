import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortailWebView extends StatefulWidget {
  const PortailWebView({Key key}) : super(key: key);

  @override
  _PortailWebViewState createState() => _PortailWebViewState();
}

class _PortailWebViewState extends State<PortailWebView> {
  final CookieManager cookieManager = CookieManager();

  @override
  Widget build(BuildContext context) {
    final PortailAPI _portailAPI = Provider.of<PortailAPI>(context);
    for (final Cookie cookie in _portailAPI.cookies) {
      if (cookie.name == "AGIMUS") {
        cookieManager.setCookie('emse.fr', cookie.toString());
      } else {
        cookieManager.setCookie('portail.emse.fr', cookie.toString());
        cookieManager.setCookie('cas.emse.fr', cookie.toString());
      }
    }
    return ScaffoldWebView(
      backgroundColor: Colors.deepPurple,
      title: const Text("Portail"),
      initialUrl: 'https://portail.emse.fr/',
    );
  }
}
