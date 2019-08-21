import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/minitel_doc.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';

class DocumentationView extends StatelessWidget {
  final String title;
  const DocumentationView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Scrollbar(
        child: SingleChildScrollView(
          child: MinitelDoc(),
        ),
      ),
      drawer: const MainDrawer(currentRoutePaths: RoutePaths.Docs),
      endDrawer: const DocsDrawer(DocsPageId.Home),
    );
  }
}
