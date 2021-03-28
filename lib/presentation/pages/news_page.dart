import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/drawers/main_drawer.dart';

import 'news/github_tab.dart';
import 'news/twitter_tab.dart';

class NewsPage extends StatelessWidget {
  final String title;

  const NewsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xff087f23)
            : Theme.of(context).primaryColor,
        body: NestedScrollView(
          key: const Key(Keys.newsTabs),
          body: const TabBarView(
            children: <Widget>[
              TwitterScreen(),
              GithubScreen(),
            ],
          ),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              title: Text(title),
              pinned: true,
              floating: true,
              forceElevated: true,
              bottom: const TabBar(
                tabs: <Tab>[
                  Tab(
                    icon: ImageIcon(
                      AssetImage(AssetPaths.twitter),
                      key: Key(Keys.twitterTab),
                    ),
                    text: 'Twitter',
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage(AssetPaths.github),
                      key: Key(Keys.githubTab),
                    ),
                    text: 'Github',
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(
          currentRoutePaths: RoutePaths.news,
        ),
      ),
    );
  }
}
