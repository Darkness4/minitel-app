import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/pages/docs_pages/diagnose_doc.dart';
import 'package:auto_login_flutter/pages/docs_pages/login_doc.dart';
import 'package:flutter/material.dart';

class DocumentationPage extends StatefulWidget {
  final String title;

  DocumentationPage({Key key, this.title}) : super(key: key);

  @override
  DocumentationPageState createState() => DocumentationPageState();
}

class DocumentationPageState extends State<DocumentationPage> {
  final _controller = PageController(initialPage: 0);

  @override
  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      drawer: MainDrawer(),
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
                    AppLoc.of(context).titleDocumentationPage,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
            ListTile(
                title: Text(AppLoc.of(context).titleLoginPage),
                onTap: () {
                  Navigator.pop(context);
                  _controller.jumpToPage(0);
                }),
            ListTile(
                title: Text(AppLoc.of(context).titleDiagnosePage),
                onTap: () {
                  Navigator.pop(context);
                  _controller.jumpToPage(1);
                }),
          ],
        ),
      ),
    );
  }
}
