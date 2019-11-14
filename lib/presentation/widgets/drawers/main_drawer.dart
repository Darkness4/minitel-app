import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/theme/theme_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/drawer_styles.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  final String currentRoutePaths;
  const MainDrawer({@required this.currentRoutePaths});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 75,
                  child: Image.asset(AssetPaths.LogoMinitelWhite),
                ),
                const Text(
                  "Minitel Toolbox",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Authentication
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).portal.title),
              key: const Key(Keys.authenticationRoute),
              leading: const Icon(Icons.lock_outline),
              selected: currentRoutePaths == RoutePaths.Authentication,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name !=
                    RoutePaths.Authentication) {
                  Navigator.pushReplacementNamed(
                      context, RoutePaths.Authentication);
                }
              },
            ),
          ),
          const Divider(),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.News
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).news.title),
              key: const Key(Keys.newsRoute),
              leading: const Icon(Icons.rss_feed),
              selected: currentRoutePaths == RoutePaths.News,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.News) {
                  Navigator.pushReplacementNamed(context, RoutePaths.News);
                }
              },
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Agenda
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).agenda.title),
              leading: const Icon(Icons.calendar_today),
              key: const Key(Keys.agendaRoute),
              selected: currentRoutePaths == RoutePaths.Agenda,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.Agenda) {
                  Navigator.pushReplacementNamed(context, RoutePaths.Agenda);
                }
              },
            ),
          ),
          const Divider(),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Reporting
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(
                AppLoc.of(context).reporting.title,
                style: const TextStyle(color: Colors.red),
              ),
              selected: currentRoutePaths == RoutePaths.Reporting,
              key: const Key(Keys.reportingRoute),
              leading: const Icon(
                Icons.error,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name !=
                    RoutePaths.Reporting) {
                  Navigator.pushReplacementNamed(context, RoutePaths.Reporting);
                }
              },
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Docs
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).docs.title),
              leading: const Icon(Icons.library_books),
              key: const Key(Keys.docsRoute),
              selected: currentRoutePaths == RoutePaths.Docs,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.Docs) {
                  Navigator.pushNamed(context, RoutePaths.Docs);
                }
              },
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.About
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).about.title),
              leading: const Icon(Icons.info),
              key: const Key(Keys.aboutRoute),
              selected: currentRoutePaths == RoutePaths.About,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.About) {
                  Navigator.pushNamed(context, RoutePaths.About);
                }
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(AppLoc.of(context).forceDark),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (bool value) async {
                final prefs = sl<SharedPreferences>();
                if (value) {
                  context.bloc<ThemeBloc>().add(const ThemeToDark());
                  await prefs.setBool('dark', true);
                } else {
                  context.bloc<ThemeBloc>().add(const ThemeToLight());
                  await prefs.setBool('dark', false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
