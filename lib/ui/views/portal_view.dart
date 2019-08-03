import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';
import 'package:minitel_toolbox/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

class PortalView extends StatefulWidget {
  final String title;
  final VersionAPI version;

  const PortalView({Key key, this.title, @required this.version})
      : super(key: key);

  PortalViewState createState() => PortalViewState();
}

class PortalViewState extends State<PortalView> {
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
                LoginPage(
                  portail: Provider.of<PortailAPI>(context),
                  gateway: Provider.of<GatewayAPI>(context),
                ),
                AppsList(
                  portail: Provider.of<PortailAPI>(context),
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
  void initState() {
    _checkVersion(widget.version, context);
    super.initState();
  }

  Future<void> _checkVersion(VersionAPI version, BuildContext context) async {
    var latestVersion = version.getLatestVersion();
    var actualVersion = PackageInfo.fromPlatform();
    List<dynamic> ensemble = await Future.wait([actualVersion, latestVersion]);
    if (ensemble[0].version != ensemble[1])
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Une nouvelle version est disponible !"),
          content: Text("La version ${ensemble[1]} est la dernière version."),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              textColor: Colors.white,
              child: const Text("Update"),
              onPressed: () => version
                  .getLatestVersionURL()
                  .then((url) => LaunchURL.launchURL(url)),
            )
          ],
        ),
      );
  }
}
