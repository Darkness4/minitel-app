import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/core/services/github_api.dart';
import 'package:minitel_toolbox/ui/widgets/github_widgets.dart';
import 'package:provider/provider.dart';

class GithubTab extends StatelessWidget {
  const GithubTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: FutureBuilder<List<GithubRelease>>(
          future: Provider.of<GithubAPI>(context)
              .fetchReleases(ApiConstants.githubRepo),
          builder: (BuildContext context,
              AsyncSnapshot<List<GithubRelease>> snapshot) {
            if (snapshot.hasError) {
              return const Icon(
                Icons.error,
                color: Colors.white,
                size: 40.0,
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                return OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                    if (MediaQuery.of(context).size.shortestSide < 600 &&
                        orientation == Orientation.portrait) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        key: const Key('github_tab/list'),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GithubCard(
                          release: snapshot.data[index],
                          key: Key('github_tab/gh_item_$index'),
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Wrap(
                          key: const Key('github_tab/list'),
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            for (final GithubRelease release in snapshot.data)
                              GithubCard(release: release),
                          ],
                        ),
                      );
                    }
                  },
                );
            }
            return null;
          },
        ),
      ),
    );
  }
}
