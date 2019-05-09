import 'package:flutter/material.dart';
import 'package:minitel_toolbox/components/cards.dart';
import 'package:minitel_toolbox/components/drawer.dart';
import 'package:minitel_toolbox/funcs/http_webfeed.dart';

class NewsPage extends StatefulWidget {
  final String title;

  const NewsPage({Key key, this.title}) : super(key: key);

  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: _generateFeedCard(
                  "https://github.com/Darkness4/minitel-app/commits/master.atom"),
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  snapshot.hasData
                      ? Column(children: snapshot.data)
                      : const Text("Loading..."),
            ),
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }

  Future<List<Widget>> _generateFeedCard(String url) async {
    var feed = await getAtom(url);
    List<dynamic> _newsCards = feed.items;
    return _newsCards.map((item) => NewsCard(item: item)).toList();
  }
}
