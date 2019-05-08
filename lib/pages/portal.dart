import 'package:auto_login_flutter/components/drawer.dart';
import 'package:flutter/material.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

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
            body: const TabBarView(
              children: <Widget>[
                const LoginPage(),
                const AppsList(),
              ],
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
                    ]),
        drawer: const MainDrawer(),
      ),
    );
  }
}
