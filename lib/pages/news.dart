import 'package:auto_login_flutter/components/drawer.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final String title;

  NewsPage({Key key, this.title}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
