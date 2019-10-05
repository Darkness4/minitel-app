import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortailWebView extends StatelessWidget {
  const PortailWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PortailAPI _portailAPI = Provider.of<PortailAPI>(context);
    final CookieManager cookieManager = CookieManager();
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
      title: Text(AppLoc.of(context).portal.apps.portal),
      initialUrl: 'https://portail.emse.fr/',
    );
  }
}
