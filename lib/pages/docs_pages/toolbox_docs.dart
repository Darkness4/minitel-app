import 'package:auto_login_flutter/components/page_animation.dart';
import 'package:auto_login_flutter/pages/docs_pages/wiki_docs.dart';
import 'package:flutter/material.dart';

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
        title: Text("Toolbox Documentation"),
      ),
      body: Scrollbar(
        child: PageView(
          controller: _controller,
          children: <Widget>[
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
                child: DrawerHeader(
                  child: Text(
                    "Documentation",
                    style: Theme.of(context).textTheme.display1,
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
                _controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            ListTile(
              title: Text("Diagnostique"),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Configuration de l'imprimante"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 0);
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
              title: Text("Importation des mails SoGo"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 1);
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
              title: Text("Installer un Dual Boot"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 2);
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
              title: Text("Jouer avec des VM"),
              onTap: () {
                Navigator.pop(context);
                final _controller = PageController(initialPage: 3);
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
