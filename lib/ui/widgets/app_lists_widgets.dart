import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScaffoldWebView extends StatefulWidget {
  final Widget title;
  final Color backgroundColor;
  final String initialUrl;
  final Function(WebViewController, BuildContext) onWebViewCreated;
  const ScaffoldWebView({
    @required this.title,
    @required this.backgroundColor,
    @required this.initialUrl,
    Key key,
    this.onWebViewCreated,
  }) : super(key: key);

  @override
  _ScaffoldWebViewState createState() => _ScaffoldWebViewState();
}

class _ScaffoldWebViewState extends State<ScaffoldWebView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backgroundColor: widget.backgroundColor,
          title: widget.title,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.public),
              onPressed: () async =>
                  LaunchURL.launchURL(await _controller.currentUrl()),
              tooltip: "Ouvrir dans un navigateur",
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: widget.backgroundColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Spacer(),
              Expanded(
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.refresh),
                  tooltip: "Actualiser",
                  onPressed: () async {
                    await _controller.reload();
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  color: Colors.white,
                  tooltip: "Aller en avant",
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
            initialUrl: widget.initialUrl,
            onWebViewCreated: (WebViewController wvc) {
              _controller = wvc;
              if (widget.onWebViewCreated != null) {
                widget.onWebViewCreated(wvc, context);
              }
            },
          ),
        ),
      ),
    );
  }
}