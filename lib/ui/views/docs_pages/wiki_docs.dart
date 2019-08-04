import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/toolbox_docs.dart';
import 'package:minitel_toolbox/ui/widgets/page_animation.dart';

import 'wiki_docs/dualboot_doc.dart';
import 'wiki_docs/imprimante_doc.dart';
import 'wiki_docs/mail_doc.dart';
import 'wiki_docs/virtual_machines_doc.dart';

class WikiDocs extends StatelessWidget {
  final PageController _controller;
  WikiDocs({Key key, PageController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wiki Documentation"),
      ),
      body: Scrollbar(
        child: PageView(
          controller: _controller,
          children: const <Widget>[
            ImprimanteDoc(),
            MailDoc(),
            DualBootDoc(),
            VirtMachineDoc(),
          ],
        ),
      ),
      endDrawer: Drawer(
        // TODO: Drawer builder
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
                final _controller = PageController(
                  initialPage: 0,
                  viewportFraction: .9,
                );
                Navigator.pushReplacement(
                  context,
                  FadeRoute(
                    builder: (BuildContext bldctx) =>
                        ToolboxDocs(controller: _controller),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Diagnostique"),
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
                        ToolboxDocs(controller: _controller),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Configuration de l'imprimante"),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            ListTile(
              title: const Text("Importation des mails SoGo"),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            ListTile(
              title: const Text("Installer un Dual Boot"),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            ListTile(
              title: const Text("Jouer avec des VM"),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
