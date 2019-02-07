import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/components/cards.dart';

import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final String title;

  NewsPage({Key key, this.title}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Widget> _newsCards = [Text("")];

  @override
  void initState() {
    super.initState();
    _generateFeedCard(
            "https://github.com/Darkness4/minitel-app/commits/develop.atom")
        .then((newsCards) => setState(() => _newsCards = newsCards));
  }

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
              children: _newsCards,
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Refresh',
      ),
    );
  }

  Future<List<Widget>> _generateFeedCard(String url) async {
    var feed = await getAtom(url);
    List<dynamic> _newsCards = feed.items;
    return _newsCards.map((myitem) => NewsCard(item: myitem)).toList();
  }
}
