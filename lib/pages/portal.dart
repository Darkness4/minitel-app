import 'package:flutter/material.dart';
import 'package:minitel_toolbox/components/drawer.dart';
import 'package:minitel_toolbox/funcs/http_version_checker.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

_checkVersion(BuildContext context) async {
  var latestVersion = getLatestVersion();
  var actualVersion = PackageInfo.fromPlatform();
  dynamic ensemble = await Future.wait([actualVersion, latestVersion]);
  if (ensemble[0].version != ensemble[1]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Une nouvelle version est disponible !",
          ),
          content: Text("La version ${ensemble[1]} est la dernière version."),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              textColor: Colors.white,
              child: Text("Update"),
              onPressed: () =>
                  getLatestVersionURL().then((url) => _launchURL(url)),
            )
          ],
        );
      },
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class PortalPage extends StatefulWidget {
  final String title;

  const PortalPage({Key key, this.title}) : super(key: key);

  PortalPageState createState() => PortalPageState();
}

class PortalPageState extends State<PortalPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color(0xff80e27e),
                  Colors.green,
                ],
              ),
            ),
            child: const TabBarView(
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
                        tabs: const <Tab>[
                          const Tab(
                            icon: const Icon(Icons.vpn_key),
                            text: "Login",
                          ),
                          const Tab(
                            icon: const Icon(Icons.apps),
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
  void initState() {
    _checkVersion(context);
    super.initState();
  }
}
