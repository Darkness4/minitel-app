import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class CampusWebView extends StatelessWidget {
  final List<Cookie> portailEMSEcookies;

  const CampusWebView({required this.portailEMSEcookies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cookieManager = WebviewCookieManager();
    cookieManager.setCookies(portailEMSEcookies);
    return const ScaffoldWebView(
      backgroundColor: Colors.deepPurple,
      initialUrl: 'https://campus.emse.fr',
    );
  }
}
