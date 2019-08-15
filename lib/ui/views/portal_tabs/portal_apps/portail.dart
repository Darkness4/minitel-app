import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/widgets/app_lists_widgets.dart';

class PortailWebView extends StatefulWidget {
  const PortailWebView({Key key}) : super(key: key);

  @override
  _PortailWebViewState createState() => _PortailWebViewState();
}

class _PortailWebViewState extends State<PortailWebView> {
  // Function onWebViewCreated =
  //     (WebViewController _controller, BuildContext context) {

  //   // _portailAPI.catchedCookies["cas.emse.fr"]?.forEach((var cookie) {
  //   //   print("Set cookie : document.cookie = \"${cookie};\"");
  //   //   _controller.evaluateJavascript('document.cookie = "${cookie};"');
  //   // });
  //   // _portailAPI.catchedCookies["portail.emse.fr"].forEach((var cookie) {
  //   //   print("Set cookie : document.cookie = \"${cookie};\"");
  //   //   _controller.evaluateJavascript('document.cookie = "${cookie};"');
  //   // });
  //   // _portailAPI.catchedCookies["portail.emse.fr2"].forEach((var cookie) {
  //   //   print("Set cookie : document.cookie = \"${cookie};\"");
  //   //   _controller.evaluateJavascript('document.cookie = "${cookie};"');
  //   // });
  //   _controller.loadUrl('https://portail.emse.fr/',
  //       headers: {'cookie': _portailAPI.cookie});
  // };

  @override
  Widget build(BuildContext context) {
    // final _portailAPI = Provider.of<PortailAPI>(context);
    // WebView.platform.setCookies(_portailAPI.catchedCookies);
    return ScaffoldWebView(
      backgroundColor: Colors.deepPurple,
      title: const Text("Portail"),
      initialUrl: 'https://portail.emse.fr/',
    );
  }
}
