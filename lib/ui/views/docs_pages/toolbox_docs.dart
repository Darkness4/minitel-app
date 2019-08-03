import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/wiki_docs.dart';
import 'package:minitel_toolbox/ui/widgets/page_animation.dart';

import 'toolbox_docs/diagnose_doc.dart';
import 'toolbox_docs/login_doc.dart';

class ToolboxDocs extends StatelessWidget {
  final PageController _controller;
  ToolboxDocs({Key key, PageController controller})
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
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Authentification"),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                _controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            ListTile(
              title: const Text("Diagnostique"),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
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
                Navigator.pushReplacement(
                  context,
                  FadeRoute(
                    builder: (BuildContext bldctx) =>
                        WikiDocs(controller: _controller),
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
                Navigator.pushReplacement(
                  context,
                  FadeRoute(
                    builder: (BuildContext bldctx) =>
                        WikiDocs(controller: _controller),
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
                Navigator.pushReplacement(
                  context,
                  FadeRoute(
                    builder: (BuildContext bldctx) =>
                        WikiDocs(controller: _controller),
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
                Navigator.pushReplacement(
                  context,
                  FadeRoute(
                    builder: (BuildContext bldctx) =>
                        WikiDocs(controller: _controller),
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
