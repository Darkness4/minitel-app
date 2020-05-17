import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrometheeWebView extends StatelessWidget {
  final List<Cookie> portailEMSEcookies;

  const PrometheeWebView({@required this.portailEMSEcookies, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CookieManager cookieManager = CookieManager();
    for (final Cookie cookie in portailEMSEcookies) {
      cookieManager.setCookie('https://emse.fr',
          "${cookie.name}=${cookie.value}; secure; domain=${cookie.domain ?? ""}");
      cookieManager.setCookie('https://campus.emse.fr',
          "${cookie.name}=${cookie.value}; secure; domain=${cookie.domain ?? ""}");
      cookieManager.setCookie('https://promethee.emse.fr',
          "${cookie.name}=${cookie.value}; secure; domain=${cookie.domain ?? ""}");
      cookieManager.setCookie('https://portail.emse.fr',
          "${cookie.name}=${cookie.value}; secure; domain=${cookie.domain ?? ""}");
      cookieManager.setCookie('https://cas.emse.fr',
          "${cookie.name}=${cookie.value}; secure; domain=${cookie.domain ?? ""}");
      cookieManager.setCookie("https://shibbo2.emse.fr",
          "${cookie.name}=${cookie.value}; secure; domain=${cookie.domain ?? ""}");
    }
    return const ScaffoldWebView(
      backgroundColor: Colors.deepPurple,
      initialUrl: 'https://promethee.emse.fr/',
    );
  }
}
