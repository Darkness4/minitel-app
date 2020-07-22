import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/presentation/cubits/theme/theme_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/drawer_styles.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

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
                  child: Image.asset(AssetPaths.logoMinitelWhite),
                ),
                const Text(
                  'Minitel Toolbox',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.authentication
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).portal.title),
              key: const Key(Keys.authenticationRoute),
              leading: const Icon(Icons.lock_outline),
              selected: currentRoutePaths == RoutePaths.authentication,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name !=
                    RoutePaths.authentication) {
                  Navigator.of(context)
                      .pushReplacementNamed(RoutePaths.authentication);
                }
              },
            ),
          ),
          const Divider(),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.news
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).news.title),
              key: const Key(Keys.newsRoute),
              leading: const Icon(Icons.rss_feed),
              selected: currentRoutePaths == RoutePaths.news,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.news) {
                  Navigator.of(context).pushReplacementNamed(RoutePaths.news);
                }
              },
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.agenda
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).agenda.title),
              leading: const Icon(Icons.calendar_today),
              key: const Key(Keys.agendaRoute),
              selected: currentRoutePaths == RoutePaths.agenda,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.agenda) {
                  Navigator.of(context).pushReplacementNamed(RoutePaths.agenda);
                }
              },
            ),
          ),
          const Divider(),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.reporting
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(
                AppLoc.of(context).reporting.title,
                style: const TextStyle(color: Colors.red),
              ),
              selected: currentRoutePaths == RoutePaths.reporting,
              key: const Key(Keys.reportingRoute),
              leading: const Icon(
                Icons.error,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name !=
                    RoutePaths.reporting) {
                  Navigator.of(context)
                      .pushReplacementNamed(RoutePaths.reporting);
                }
              },
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.docs
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: const Text('Documentation'),
              leading: const Icon(Icons.library_books),
              key: const Key(Keys.docsRoute),
              selected: currentRoutePaths == RoutePaths.docs,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.docs) {
                  Navigator.of(context).pushNamed(RoutePaths.docs);
                }
              },
            ),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.about
                  ? MinitelColors.drawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).about.title),
              leading: const Icon(Icons.info),
              key: const Key(Keys.aboutRoute),
              selected: currentRoutePaths == RoutePaths.about,
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.about) {
                  Navigator.of(context).pushNamed(RoutePaths.about);
                }
              },
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Theme'),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Radio(
                    value: 'Dark',
                    groupValue: state.value,
                    onChanged: (String _) {
                      context.bloc<ThemeCubit>().toDark();
                    },
                  ),
                  Radio(
                    value: 'Adaptive',
                    groupValue: state.value,
                    onChanged: (String _) {
                      context.bloc<ThemeCubit>().toAdaptive();
                    },
                  ),
                  Radio(
                    value: 'Light',
                    groupValue: state.value,
                    onChanged: (String _) {
                      context.bloc<ThemeCubit>().toLight();
                    },
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text('Dark'),
              Text('Adaptive'),
              Text('Light'),
            ],
          )
        ],
      ),
    );
  }
}
