import 'package:auto_login_flutter/components/drawer.dart';
import 'package:flutter/material.dart';

class DocumentationPage extends StatefulWidget {
  final String title;

  DocumentationPage({Key key, this.title}) : super(key: key);

  @override
  _DocumentationPageState createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
