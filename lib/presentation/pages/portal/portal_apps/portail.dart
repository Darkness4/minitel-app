import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortailWebView extends StatelessWidget {
  final List<Cookie> portailEMSEcookies;

  const PortailWebView({@required this.portailEMSEcookies, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CookieManager cookieManager = CookieManager();
    for (final Cookie cookie in portailEMSEcookies) {
      if (cookie.name == "AGIMUS") {
        cookieManager.setCookie('emse.fr', cookie.toString());
      } else {
        cookieManager.setCookie('portail.emse.fr', cookie.toString());
        cookieManager.setCookie('cas.emse.fr', cookie.toString());
      }
    }
    return ScaffoldWebView(
      backgroundColor: Colors.deepPurple,
      title: Text(AppLoc.of(context).portal.apps.portal),
      initialUrl: 'https://portail.emse.fr/',
    );
  }
}
