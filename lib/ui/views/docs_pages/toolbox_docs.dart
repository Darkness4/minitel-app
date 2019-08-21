import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';

import 'toolbox_docs/diagnose_doc.dart';
import 'toolbox_docs/login_doc.dart';

class ToolboxDocs extends StatelessWidget {
  final PageController _controller;
  const ToolboxDocs({Key key, PageController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toolbox Documentation"),
      ),
      body: Scrollbar(
        child: PageView(
          controller: _controller,
          children: const <Widget>[
            LoginDoc(),
            DiagnoseDoc(),
          ],
        ),
      ),
      endDrawer: DocsDrawer(DocsPageId.Toolbox, controller: _controller),
    );
  }
}
