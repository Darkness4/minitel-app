import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';
import 'package:minitel_toolbox/funcs/url_launch.dart';
import 'package:package_info/package_info.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

class PortalPage extends StatefulWidget {
  final String title;

  const PortalPage({Key key, this.title}) : super(key: key);

  PortalPageState createState() => PortalPageState();
}

class PortalPageState extends State<PortalPage> {
  final _version = VersionAPI();
  final _portail = PortailAPI();
  final _gateway = GatewayAPI();

  Future<void> _checkVersion(BuildContext context) async {
    var latestVersion = _version.getLatestVersion();
    var actualVersion = PackageInfo.fromPlatform();
    dynamic ensemble = await Future.wait([actualVersion, latestVersion]);
    if (ensemble[0].version != ensemble[1])
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
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
              onPressed: () => _version
                  .getLatestVersionURL()
                  .then((url) => LaunchURL.launchURL(url)),
            )
          ],
        ),
      );
  }

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
                  Color(0xff087f23),
                ],
              ),
            ),
            child: TabBarView(
              children: <Widget>[
                LoginPage(
                  portail: _portail,
                  gateway: _gateway,
                ),
                AppsList(
                  portail: _portail,
                ),
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
