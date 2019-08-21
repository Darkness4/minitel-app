import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/webfeed.dart';

class GithubTab extends StatelessWidget {
  static const url = "https://github.com/Darkness4/minitel-app/releases.atom";

  const GithubTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: FutureBuilder<AtomFeed>(
          future: Provider.of<WebFeedAPI>(context).getAtom(url),
          builder: (BuildContext context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  key: const Key('github_tab/list'),
                  itemCount: snapshot.data.items.length,
                  itemBuilder: (context, index) => NewsCard(
                    item: snapshot.data.items[index],
                    key: Key('github_tab/gh_item_$index'),
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
