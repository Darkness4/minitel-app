import 'package:auto_login_flutter/components/drawer.dart';
import 'package:flutter/material.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

class PortalPage extends StatefulWidget {
  final String title;

  PortalPage({Key key, this.title}) : super(key: key);

  PortalPageState createState() => PortalPageState();
}

class PortalPageState extends State<PortalPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
            body: TabBarView(
              children: <Widget>[
                LoginPage(),
                AppsList(),
              ],
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                      SliverAppBar(
                        title: Text(widget.title),
                        pinned: true,
                        floating: true,
                        forceElevated: true,
                        bottom: TabBar(
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
                    ]),
        drawer: MainDrawer(),
      ),
    );
  }
}
