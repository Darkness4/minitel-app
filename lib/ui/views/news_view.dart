import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/webfeed.dart';

class NewsView extends StatefulWidget {
  final String title;

  const NewsView({Key key, this.title}) : super(key: key);

  @override
  NewsViewState createState() => NewsViewState();
}

class NewsViewState extends State<NewsView> {
  static const url = "https://github.com/Darkness4/minitel-app/releases.atom";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: const Color(0xff087f23),
      body: Center(
        child: Scrollbar(
          child: FutureBuilder<AtomFeed>(
            future: Provider.of<WebFeedAPI>(context).getAtom(url),
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.hasData
                    ? ListView(
                        children: <Widget>[
                          for (AtomItem atomItem in snapshot.data.items)
                            NewsCard(item: atomItem),
                        ],
                      )
                    : const CircularProgressIndicator(),
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
