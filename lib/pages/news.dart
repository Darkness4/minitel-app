import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';

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
      backgroundColor: Color(0xff087f23),
      body: Center(
        child: Scrollbar(
          child: FutureBuilder(
            future: _generateFeedCard(
                "https://github.com/Darkness4/minitel-app/releases.atom"),
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.hasData
                    ? ListView(children: snapshot.data)
                    : const CircularProgressIndicator(),
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }

  Future<List<Widget>> _generateFeedCard(String url) async {
    var feed = await WebFeedAPI().getAtom(url);
    List<dynamic> _newsCards = feed.items;
    return _newsCards.map((item) => NewsCard(item: item)).toList();
  }
}
