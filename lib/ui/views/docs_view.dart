import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/minitel_doc.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/toolbox_docs.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/wiki_docs.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:minitel_toolbox/ui/widgets/page_animation.dart';

class DocumentationView extends StatelessWidget {
  final String title;
  const DocumentationView({Key key, this.title}) : super(key: key);

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
      drawer: const MainDrawer(),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            SafeArea(
              top: true,
              child: Container(
                height: 90,
                child: const DrawerHeader(
                  child: Text(
                    "Documentation",
                    style: MinitelTextStyles.mdH1,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Minitel"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Authentification"),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                final _controller = PageController(
                  initialPage: 0,
                  viewportFraction: .9,
                );
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: ToolboxDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Diagnostique"),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                final _controller = PageController(
                  initialPage: 1,
                  viewportFraction: .9,
                );
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: ToolboxDocs(controller: _controller),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Configuration de l'imprimante"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(
                  initialPage: 0,
                  viewportFraction: .9,
                );
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Importation des mails SoGo"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(
                  initialPage: 1,
                  viewportFraction: .9,
                );
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Installer un Dual Boot"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(
                  initialPage: 2,
                  viewportFraction: .9,
                );
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: WikiDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Jouer avec des VM"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(
                  initialPage: 3,
                  viewportFraction: .9,
                );
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
