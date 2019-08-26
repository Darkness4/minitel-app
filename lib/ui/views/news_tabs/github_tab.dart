import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/core/services/github_api.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:provider/provider.dart';

class GithubTab extends StatelessWidget {
  static const String repo = "Darkness4/minitel-app";

  const GithubTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: FutureBuilder<List<GithubRelease>>(
          future: Provider.of<GithubAPI>(context).fetchReleases(repo),
          builder: (BuildContext context,
                  AsyncSnapshot<List<GithubRelease>> snapshot) =>
              snapshot.hasData
                  ? ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      key: const Key('github_tab/list'),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GithubCard(
                        release: snapshot.data[index],
                        key: Key('github_tab/gh_item_$index'),
                      ),
                    )
                  : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
