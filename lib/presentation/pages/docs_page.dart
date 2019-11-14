import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';

class DocumentationPage extends StatelessWidget {
  final String title;
  const DocumentationPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWebView(
      backgroundColor: Colors.green,
      title: Text(title),
      initialUrl: 'http://minitel.emse.fr/wiki/',
    );
  }
}
