import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ImprimanteWebView extends StatelessWidget {
  final List<Cookie> remoteDataSourceCookies;

  const ImprimanteWebView({
    @required this.remoteDataSourceCookies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cookieManager = CookieManager();

    if (remoteDataSourceCookies != null && remoteDataSourceCookies.isNotEmpty) {
      for (final cookie in remoteDataSourceCookies) {
        cookieManager.setCookie(
          MyIPAdresses.emseImprimanteIP,
          cookie.toString(),
        );
      }
    }

    return const ScaffoldWebView(
      backgroundColor: Colors.grey,
      initialUrl:
          'http://${MyIPAdresses.emseImprimanteIP}/watchdoc/jobs.asp?instance=default',
    );
  }
}
