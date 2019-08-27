import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/ui/shared/shared_funcs.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
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
  final PortailAPI _portailAPI = PortailAPI();
  bool _hasTriggeredOnce = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          key: const Key('portail_view/tabs'),
          body: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: <Color>[
                  Color(0xff80e27e),
                  Color(0xff087f23),
                ],
              ),
            ),
            child: Provider<PortailAPI>.value(
              value: _portailAPI,
              child: TabBarView(
                children: const <Widget>[
                  LoginPage(),
                  AppsList(),
                ],
              ),
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
      checkLatestVersion(context, doNotShowIfNoUpdate: true);
      _hasTriggeredOnce = true;
    }
    super.didChangeDependencies();
  }
}
