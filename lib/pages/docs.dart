import 'package:flutter/material.dart';
import 'package:minitel_toolbox/pages/docs_pages/minitel_doc.dart';
import 'package:minitel_toolbox/pages/docs_pages/toolbox_docs.dart';
import 'package:minitel_toolbox/pages/docs_pages/wiki_docs.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:minitel_toolbox/ui/widgets/page_animation.dart';

class DocumentationPage extends StatelessWidget {
  final String title;
  const DocumentationPage({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MinitelDoc(),
            ],
          ),
        ),
      ),
      drawer: const MainDrawer(),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            SafeArea(
              top: true,
              child: Container(
                height: 90,
                child: DrawerHeader(
                  child: Text(
                    "Documentation",
                    style: MinitelTextStyles.display1,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Minitel"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Authentification"),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                final _controller = PageController(initialPage: 0);
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: ToolboxDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Diagnostique"),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                final _controller = PageController(initialPage: 1);
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: ToolboxDocs(controller: _controller),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Configuration de l'imprimante"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 0);
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Importation des mails SoGo"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 1);
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Installer un Dual Boot"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 2);
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Jouer avec des VM"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 3);
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
