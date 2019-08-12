import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/github_api.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

class PortalView extends StatefulWidget {
  final String title;

  const PortalView({Key key, this.title}) : super(key: key);

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
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color(0xff80e27e),
                  Color(0xff087f23),
                ],
              ),
            ),
            child: TabBarView(
              children: <Widget>[
                const LoginPage(),
                const AppsList(),
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
                    icon: Icon(Icons.vpn_key),
                    text: "Login",
                  ),
                  Tab(
                    icon: Icon(Icons.apps),
                    text: "Apps",
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

  @override
  void didChangeDependencies() {
    if (!_hasTriggeredOnce) {
      _checkVersion(context);
      _hasTriggeredOnce = true;
    }
    super.didChangeDependencies();
  }

  void _checkVersion(BuildContext context) async {
    var packageInfo = PackageInfo.fromPlatform();
    var versionAPI = Provider.of<VersionAPI>(context).getLatestVersion();
    PackageInfo actualRelease = await packageInfo;
    LatestRelease latestRelease = await versionAPI;
    if (actualRelease.version != latestRelease.tagName) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Une nouvelle version est disponible !"),
          content: Text(
              "La version ${latestRelease.tagName} est la dernière version."),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              textColor: Colors.white,
              child: const Text("Update"),
              onPressed: () => LaunchURL.launchURL(latestRelease.htmlUrl),
            )
          ],
        ),
      );
    }
  }
}
