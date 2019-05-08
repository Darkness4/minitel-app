import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/pages/docs_pages/diagnose_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/dualboot_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/imprimante_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/login_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/mail_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/minitel_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/virtual_machines_doc.dart';
import 'package:flutter/material.dart';

class DocumentationPage extends StatefulWidget {
  final String title;

  const DocumentationPage({Key key, this.title}) : super(key: key);

  @override
  DocumentationPageState createState() => DocumentationPageState();
}

class DocumentationPageState extends State<DocumentationPage> {
  final _controller = PageController(initialPage: 0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: PageView(
          controller: _controller,
          children: <Widget>[
            MinitelDoc(),
            LoginDoc(),
            DiagnoseDoc(),
            ImprimanteDoc(),
            MailDoc(),
            DualBootDoc(),
            VirtMachineDoc(),
          ],
        ),
      ),
      drawer: const MainDrawer(),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          // fix regression, TODO: Remove when fixed
          children: <Widget>[
            SafeArea(
              top: true,
              child: Container(
                height: 90,
                child: DrawerHeader(
                  child: Text(
                    "Documentation",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Minitel"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(0);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Authentification"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(1);
              },
            ),
            ListTile(
              title: Text("Diagnostique"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(2);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Configuration de l'imprimante"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(0);
              },
            ),
            ListTile(
              title: Text("Importation des mails SoGo"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(0);
              },
            ),
            ListTile(
              title: Text("Installer un Dual Boot"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(0);
              },
            ),
            ListTile(
              title: Text("Jouer avec des VM"),
              onTap: () {
                Navigator.pop(context);
                _controller.jumpToPage(0);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
