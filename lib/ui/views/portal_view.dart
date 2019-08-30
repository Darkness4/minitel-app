import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';
import 'package:minitel_toolbox/core/viewmodels/views/portail_view_model.dart';
import 'package:minitel_toolbox/ui/shared/shared_funcs.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
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
            child: Builder(
              builder: (BuildContext context) => BaseWidget<PortailViewModel>(
                model: PortailViewModel(
                  portailAPI: Provider.of<PortailAPI>(context),
                  calendarUrlAPI: Provider.of<CalendarUrlAPI>(context),
                  stormshieldAPI: Provider.of<StormshieldAPI>(context),
                  iCalendar: Provider.of<ICalendarAPI>(context),
                ),
                onModelReady: (PortailViewModel model) =>
                    model.rememberLogin(context),
                builder: (BuildContext context, PortailViewModel model, _) =>
                    TabBarView(
                  children: <Widget>[
                    LoginPage(model: model),
                    const AppsList(),
                  ],
                ),
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
