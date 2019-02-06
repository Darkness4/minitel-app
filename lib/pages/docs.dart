import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
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
      body: Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SuperCard(
              children: <Widget>[
              ],
            ),
            SuperCard(
              children: <Widget>[
                Header(
                  "H1",
                ),
                Header("H1", level: 2),
                Header("H1", level: 3),
                Header("H1", level: 4),
                Header("H1", level: 5),
                Header("H1", level: 6),
              ],
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
