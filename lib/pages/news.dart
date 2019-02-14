import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              const Color(0xfffdfcfb),
              const Color(0xffe2d1c3),
            ], // whitish to gray
          ),
        ),
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
                child: FutureBuilder(
                    future: _generateFeedCard(
                        "https://github.com/Darkness4/minitel-app/commits/develop.atom"),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data,
                        );
                      } else {
                        return Text("Loading...");
                      }
                    })),
          ),
        ),
      ),
      drawer: MainDrawer(),
    );
  }

  Future<List<Widget>> _generateFeedCard(String url) async {
    var feed = await getAtom(url);
    List<dynamic> _newsCards = feed.items;
    return _newsCards.map((item) => NewsCard(item: item)).toList();
  }
}
