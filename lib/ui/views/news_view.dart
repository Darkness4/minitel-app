import 'package:flutter/material.dart';
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
          body: TabBarView(
            children: <Widget>[
              const FacebookTab(),
              const GithubTab(),
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
                    icon: ImageIcon(AssetImage("assets/icon/f_logo.png")),
                    text: "Facebook",
                  ),
                  Tab(
                    icon: ImageIcon(AssetImage("assets/icon/GitHub-Mark.png")),
                    text: "Github",
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
