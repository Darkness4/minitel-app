import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';

import 'news_tabs/facebook_tab.dart';
import 'news_tabs/github_tab.dart';

class NewsView extends StatelessWidget {
  final String title;

  const NewsView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff087f23),
        body: NestedScrollView(
          key: const Key('news_view/tabs'),
          body: const TabBarView(
            children: <Widget>[
              FacebookTab(),
              GithubTab(),
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
                      AssetImage(AssetPaths.Facebook),
                      key: Key('news_view/facebook_tab'),
                    ),
                    text: "Facebook",
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage(AssetPaths.Github),
                      key: Key('news_view/github_tab'),
                    ),
                    text: "Github",
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(
          currentRoutePaths: RoutePaths.News,
        ),
      ),
    );
  }
}
