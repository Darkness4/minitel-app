import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:minitel_toolbox/core/services/imprimante_api.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';
import 'package:minitel_toolbox/core/viewmodels/views/portail_view_model.dart';
import 'package:minitel_toolbox/ui/widgets/backgrounds.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'portal_tabs/apps_list.dart';
import 'portal_tabs/login.dart';

class PortalView extends StatelessWidget {
  final String title;

  const PortalView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseWidget<PortailViewModel>(
        model: PortailViewModel(
          portailAPI: Provider.of<PortailAPI>(context),
          calendarUrlAPI: Provider.of<CalendarUrlAPI>(context),
          imprimanteAPI: Provider.of<ImprimanteAPI>(context),
          stormshieldAPI: Provider.of<StormshieldAPI>(context),
          iCalendar: Provider.of<ICalendarAPI>(context),
        ),
        onModelReady: (PortailViewModel model) => model.rememberLogin(),
        builder: (BuildContext context, PortailViewModel model, _) => Scaffold(
          key: model.scaffoldKey,
          body: CustomPaint(
            painter: PortailBackgroundPainter(
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                foregroundColor: Theme.of(context).accentColor),
            child: NestedScrollView(
              key: const Key('portail_view/tabs'),
              body: TabBarView(
                children: <Widget>[
                  LoginPage(model: model),
                  const AppsList(),
                ],
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                SliverAppBar(
                  title: Text(title),
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
          ),
          drawer: const MainDrawer(
            currentRoutePaths: RoutePaths.Authentication,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return model.portailState == PortailState.Busy
                  ? const CircularProgressIndicator()
                  : FloatingActionButton.extended(
                      key: const Key('login/connect'),
                      onPressed: () => model.login(
                        model.uidController.text,
                        model.pswdController.text,
                      ),
                      label: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                    );
            },
          ),
        ),
      ),
    );
  }
}
