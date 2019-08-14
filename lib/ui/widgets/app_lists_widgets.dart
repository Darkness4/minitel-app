import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScaffoldWebView extends StatefulWidget {
  final Widget title;
  final Color backgroundColor;
  final String initialUrl;
  final Function(WebViewController, BuildContext) onWebViewCreated;
  const ScaffoldWebView(
      {Key key,
      @required this.title,
      @required this.backgroundColor,
      @required this.initialUrl,
      this.onWebViewCreated})
      : super(key: key);

  @override
  _ScaffoldWebViewState createState() => _ScaffoldWebViewState();
}

class _ScaffoldWebViewState extends State<ScaffoldWebView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.backgroundColor,
        title: widget.title,
        elevation: 0.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                if (await _controller.canGoBack()) {
                  await _controller.goBack();
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                await _controller.reload();
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () async {
                if (await _controller.canGoForward()) {
                  await _controller.goForward();
                }
              },
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
    );
  }
}
