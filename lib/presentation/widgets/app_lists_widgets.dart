import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/utils/launch_url_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScaffoldWebView extends StatelessWidget {
  final Color backgroundColor;
  final String initialUrl;
  final Function(WebViewController, BuildContext) onWebViewCreated;

  const ScaffoldWebView({
    @required this.backgroundColor,
    @required this.initialUrl,
    Key key,
    this.onWebViewCreated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;

    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          await _controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: backgroundColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                ),
              ),
              Expanded(
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.public),
                  onPressed: () async =>
                      LaunchURLUtils.launchURL(await _controller.currentUrl()),
                  tooltip: "Open in web browser",
                ),
              ),
              Expanded(
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.refresh),
                  tooltip: "Refresh",
                  onPressed: () async {
                    await _controller.reload();
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  color: Colors.white,
                  tooltip: "Forward",
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () async {
                    if (await _controller.canGoForward()) {
                      await _controller.goForward();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: initialUrl,
            onWebViewCreated: (WebViewController wvc) {
              _controller = wvc;
              if (onWebViewCreated != null) {
                this.onWebViewCreated(wvc, context);
              }
            },
          ),
        ),
      ),
    );
  }
}
