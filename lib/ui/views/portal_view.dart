import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/core/services/github_api.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

class PortalView extends StatefulWidget {
  final String title;

  const PortalView({Key key, this.title}) : super(key: key);

  @override
  PortalViewState createState() => PortalViewState();
}

class PortalViewState extends State<PortalView> {
  bool _hasTriggeredOnce = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          key: const Key('portail_view/tabs'),
          body: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: <Color>[
                  Color(0xff80e27e),
                  Color(0xff087f23),
                ],
              ),
            ),
            child: TabBarView(
              children: <Widget>[
                LoginPage(),
                AppsList(),
              ],
            ),
          ),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              title: Text(widget.title),
              pinned: true,
              floating: true,
              forceElevated: true,
              bottom: const TabBar(
                tabs: <Tab>[
                  Tab(
                    icon: Icon(
                      Icons.vpn_key,
                      key: Key('portal_view/login_tab'),
                    ),
                    text: "Login",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.apps,
                      key: Key('portal_view/apps_tab'),
                    ),
                    text: "Apps",
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(
          currentRoutePaths: RoutePaths.Authentication,
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (!_hasTriggeredOnce) {
      _checkVersion(context);
      _hasTriggeredOnce = true;
    }
    super.didChangeDependencies();
  }

  Future<void> _checkVersion(BuildContext context) async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final GithubRelease githubRelease = await Provider.of<GithubAPI>(context)
          .fetchLatestRelease('Darkness4/minitel-app');
      if (packageInfo.version != githubRelease.tag_name) {
        await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Une nouvelle version est disponible !"),
            content: Text(
                "La version ${githubRelease.tag_name} est la dernière version."),
            actions: <Widget>[
              FlatButton(
                key: const Key('portal_view/close_update'),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"),
              ),
              RaisedButton(
                colorBrightness: Brightness.dark,
                color: Theme.of(context).primaryColor,
                onPressed: () => LaunchURL.launchURL(githubRelease.html_url),
                child: const Text("Update"),
              )
            ],
          ),
        );
      }
    } on SocketException {
      print("Cannot connect to Github to check version");
    }
  }
}
