import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/widgets/app_lists_widgets.dart';

class DocumentationPage extends StatelessWidget {
  const DocumentationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWebView(
      backgroundColor: Colors.green,
      initialUrl: 'http://minitel.emse.fr/wiki/',
    );
  }
}
