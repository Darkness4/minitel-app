import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/webfeed.dart';

class GithubTab extends StatelessWidget {
  const GithubTab({
    Key key,
  }) : super(key: key);

  static const url = "https://github.com/Darkness4/minitel-app/releases.atom";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: FutureBuilder<AtomFeed>(
          future: Provider.of<WebFeedAPI>(context).getAtom(url),
          builder: (BuildContext context, snapshot) => snapshot.hasData
              ? ListView(
                  children: <Widget>[
                    for (AtomItem atomItem in snapshot.data.items)
                      NewsCard(item: atomItem),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
