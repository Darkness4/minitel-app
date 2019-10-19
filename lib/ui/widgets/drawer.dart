import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/provider_setup.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/drawer_styles.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/shared/theme_data.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/toolbox_docs.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/wiki_docs.dart';
import 'package:minitel_toolbox/ui/widgets/page_animation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocsDrawer extends StatelessWidget {
  final DocsPageId _docsPageId;
  final PageController controller;
  const DocsDrawer(this._docsPageId, {Key key, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            SafeArea(
              top: true,
              child: DrawerHeader(
                child: Text(
                  "Documentation",
                  style: MinitelTextStyles.mdH1.apply(color: Colors.white),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Home
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  "Minitel",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/minitel'),
                onTap: () {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Home) {
                    Navigator.pop(context);
                  }
                }, // Do nothing
              ),
            ),
            const Divider(),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Toolbox &&
                        controller.page.round() == 0
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  AppLoc.of(context).docs.login.header,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/authentification'),
                onTap: () {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Toolbox) {
                    final PageController _newController = PageController(
                      initialPage: 0,
                      viewportFraction: .9,
                    );
                    if (_docsPageId == DocsPageId.Home) {
                      Navigator.push<dynamic>(
                        context,
                        SlideRightRoute<dynamic>(
                          builder: (_) =>
                              ToolboxDocs(controller: _newController),
                        ),
                      );
                    } else if (_docsPageId == DocsPageId.Wiki) {
                      Navigator.pushReplacement<dynamic, dynamic>(
                        context,
                        FadeRoute<dynamic>(
                          builder: (_) =>
                              ToolboxDocs(controller: _newController),
                        ),
                      );
                    }
                  } else {
                    controller.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Toolbox &&
                        controller.page.round() == 1
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  AppLoc.of(context).docs.diagnose.header,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/diagnostique'),
                onTap: () async {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Toolbox) {
                    final PageController _newController = PageController(
                      initialPage: 1,
                      viewportFraction: .9,
                    );
                    if (_docsPageId == DocsPageId.Home) {
                      await Navigator.push<dynamic>(
                        context,
                        SlideRightRoute<dynamic>(
                          builder: (_) =>
                              ToolboxDocs(controller: _newController),
                        ),
                      );
                    } else if (_docsPageId == DocsPageId.Wiki) {
                      await Navigator.pushReplacement<dynamic, dynamic>(
                        context,
                        FadeRoute<dynamic>(
                          builder: (_) =>
                              ToolboxDocs(controller: _newController),
                        ),
                      );
                    }
                  } else {
                    await controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
              ),
            ),
            const Divider(),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Wiki &&
                        controller.page.round() == 0
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  AppLoc.of(context).docs.imprimante.header,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/imprimante'),
                onTap: () {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Wiki) {
                    final PageController _newController = PageController(
                      initialPage: 0,
                      viewportFraction: .9,
                    );
                    if (_docsPageId == DocsPageId.Home) {
                      Navigator.push<dynamic>(
                        context,
                        SlideRightRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    } else if (_docsPageId == DocsPageId.Toolbox) {
                      Navigator.pushReplacement<dynamic, dynamic>(
                        context,
                        FadeRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    }
                  } else {
                    controller.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Wiki &&
                        controller.page.round() == 1
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  AppLoc.of(context).docs.mail.header,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/sogo'),
                onTap: () {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Wiki) {
                    final PageController _newController = PageController(
                      initialPage: 1,
                      viewportFraction: .9,
                    );
                    if (_docsPageId == DocsPageId.Home) {
                      Navigator.push<dynamic>(
                        context,
                        SlideRightRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    } else if (_docsPageId == DocsPageId.Toolbox) {
                      Navigator.pushReplacement<dynamic, dynamic>(
                        context,
                        FadeRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    }
                  } else {
                    controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Wiki &&
                        controller.page.round() == 2
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  AppLoc.of(context).docs.dualboot.header,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/dualboot'),
                onTap: () {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Wiki) {
                    final PageController _newController = PageController(
                      initialPage: 2,
                      viewportFraction: .9,
                    );
                    if (_docsPageId == DocsPageId.Home) {
                      Navigator.push<dynamic>(
                        context,
                        SlideRightRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    } else if (_docsPageId == DocsPageId.Toolbox) {
                      Navigator.pushReplacement<dynamic, dynamic>(
                        context,
                        FadeRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    }
                  } else {
                    controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _docsPageId == DocsPageId.Wiki &&
                        controller.page.round() == 3
                    ? MinitelColors.DrawerSelectedColorGrey
                    : Colors.transparent,
              ),
              child: ListTile(
                title: Text(
                  "Virtual Machines",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(color: Colors.white),
                ),
                key: const Key('drawer/vm'),
                onTap: () {
                  Navigator.pop(context);
                  if (_docsPageId != DocsPageId.Wiki) {
                    final PageController _newController = PageController(
                      initialPage: 3,
                      viewportFraction: .9,
                    );
                    if (_docsPageId == DocsPageId.Home) {
                      Navigator.push<dynamic>(
                        context,
                        SlideRightRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    } else if (_docsPageId == DocsPageId.Toolbox) {
                      Navigator.pushReplacement<dynamic, dynamic>(
                        context,
                        FadeRoute<dynamic>(
                          builder: (_) => WikiDocs(controller: _newController),
                        ),
                      );
                    }
                  } else {
                    controller.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<PageController>('controller', controller));
  }
}

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
                  ? MinitelColors.DrawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
                title: Text(AppLoc.of(context).portal.title),
                key: const Key('drawer/authentication'),
                leading: const Icon(Icons.lock_outline),
                selected: currentRoutePaths == RoutePaths.Authentication,
                onTap: () {
                  Navigator.pop(context); // Close Drawer
                  if (ModalRoute.of(context).settings.name !=
                      RoutePaths.Authentication) {
                    Navigator.pushReplacementNamed(
                        context, RoutePaths.Authentication);
                  }
                }),
          ),
          const Divider(),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.News
                  ? MinitelColors.DrawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
                title: Text(AppLoc.of(context).news.title),
                key: const Key('drawer/news'),
                leading: const Icon(Icons.rss_feed),
                selected: currentRoutePaths == RoutePaths.News,
                onTap: () {
                  Navigator.pop(context); // Close Drawer
                  if (ModalRoute.of(context).settings.name != RoutePaths.News) {
                    Navigator.pushReplacementNamed(context, RoutePaths.News);
                  }
                }),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Agenda
                  ? MinitelColors.DrawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
                title: Text(AppLoc.of(context).agenda.title),
                leading: const Icon(Icons.calendar_today),
                key: const Key('drawer/agenda'),
                selected: currentRoutePaths == RoutePaths.Agenda,
                onTap: () {
                  Navigator.pop(context); // Close Drawer
                  if (ModalRoute.of(context).settings.name !=
                      RoutePaths.Agenda) {
                    Navigator.pushReplacementNamed(context, RoutePaths.Agenda);
                  }
                }),
          ),
          const Divider(),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Reporting
                  ? MinitelColors.DrawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
                title: Text(
                  AppLoc.of(context).reporting.title,
                  style: const TextStyle(color: Colors.red),
                ),
                selected: currentRoutePaths == RoutePaths.Reporting,
                key: const Key('drawer/reporting'),
                leading: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.pop(context); // Close Drawer
                  if (ModalRoute.of(context).settings.name !=
                      RoutePaths.Reporting) {
                    Navigator.pushReplacementNamed(
                        context, RoutePaths.Reporting);
                  }
                }),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.Docs
                  ? MinitelColors.DrawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
                title: Text(AppLoc.of(context).docs.title),
                leading: const Icon(Icons.library_books),
                key: const Key('drawer/docs'),
                selected: currentRoutePaths == RoutePaths.Docs,
                onTap: () {
                  Navigator.pop(context); // Close Drawer
                  if (ModalRoute.of(context).settings.name != RoutePaths.Docs) {
                    Navigator.pushNamed(context, RoutePaths.Docs);
                  }
                }),
          ),
          Container(
            margin: DrawerStyle.HightlightMarginRight,
            decoration: BoxDecoration(
              color: currentRoutePaths == RoutePaths.About
                  ? MinitelColors.DrawerSelectedColor
                  : Colors.transparent,
              borderRadius: DrawerStyle.RoundedBorderRight,
            ),
            child: ListTile(
              title: Text(AppLoc.of(context).about.title),
              leading: const Icon(Icons.info),
              key: const Key('drawer/about'),
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
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                if (value) {
                  Provider.of<ThemeChanger>(context).theme =
                      MinitelThemeData.dark;
                  await prefs.setBool('dark', true);
                } else {
                  Provider.of<ThemeChanger>(context).theme =
                      MinitelThemeData.light;
                  await prefs.setBool('dark', false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('currentRoutePaths', currentRoutePaths));
  }
}
