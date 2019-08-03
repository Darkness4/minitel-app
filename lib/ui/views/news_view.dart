import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  final String title;

  const NewsView({Key key, this.title}) : super(key: key);

  @override
  NewsViewState createState() => NewsViewState();
}

class NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: const Color(0xff087f23),
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
    var feed = await Provider.of<WebFeedAPI>(context).getAtom(url);
    List<dynamic> _newsCards = feed.items;
    return _newsCards.map((item) => NewsCard(item: item)).toList();
  }
}
