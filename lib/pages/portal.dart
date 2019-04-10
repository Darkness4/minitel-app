import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:flutter/material.dart';

import 'portal_tabs/login.dart';
import 'portal_tabs/apps_list.dart';
// import 'portal_tabs/portal_apps/sogo.dart';
// import 'portal_tabs/portal_apps/annuaire.dart';
// import 'portal_tabs/portal_apps/campus.dart';
// import 'portal_tabs/portal_apps/logiciels.dart';
// import 'portal_tabs/portal_apps/gitlab.dart';
// import 'portal_tabs/portal_apps/promethee.dart';
// import 'portal_tabs/portal_apps/imprimante.dart';

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
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text(widget.title),
        //   bottom: TabBar(
        //     tabs: <Widget>[
        //       Tab(
        //         icon: Icon(Icons.vpn_key),
        //         text: "Login",
        //       ),
        //       Tab(
        //         icon: Icon(Icons.apps),
        //         text: "Apps",
        //       ),
        //     ],
        //   ),
        // ),
        
        body: NestedScrollView(
          body: TabBarView(
            children: <Widget>[
              LoginPage(title: AppLoc.of(context).titleLoginPage),
              AppsList(),
            ],
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) 
        => <Widget>[
          SliverAppBar(
            title: Text(widget.title),
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
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
        ]
          
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
