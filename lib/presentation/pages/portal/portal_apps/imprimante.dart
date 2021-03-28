import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class ImprimanteWebView extends StatelessWidget {
  final List<Cookie> remoteDataSourceCookies;

  const ImprimanteWebView({
    required this.remoteDataSourceCookies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cookieManager = WebviewCookieManager();

    if (remoteDataSourceCookies.isNotEmpty) {
      cookieManager.setCookies(remoteDataSourceCookies);
    }

    return const ScaffoldWebView(
      backgroundColor: Colors.grey,
      initialUrl:
          'http://${MyIPAdresses.emseImprimanteIP}/watchdoc/jobs.asp?instance=default',
    );
  }
}
