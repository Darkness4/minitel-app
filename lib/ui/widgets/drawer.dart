import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/toolbox_docs.dart';
import 'package:minitel_toolbox/ui/views/docs_pages/wiki_docs.dart';
import 'package:minitel_toolbox/ui/widgets/page_animation.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  child: Image.asset("assets/img/logo_minitel_white.png"),
                  height: 75,
                ),
                const Text(
                  "Minitel Toolbox",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
            decoration: const BoxDecoration(color: MinitelColors.PrimaryColor),
          ),
          ListTile(
              title: const Text("Authentification"),
              leading: const Icon(Icons.apps),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name !=
                    RoutePaths.Authentication)
                  Navigator.pushReplacementNamed(
                      context, RoutePaths.Authentication);
              }),
          const Divider(),
          ListTile(
              title: const Text("Nouveautés"),
              leading: const Icon(Icons.rss_feed),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.News)
                  Navigator.pushReplacementNamed(context, RoutePaths.News);
              }),
          ListTile(
              title: const Text("Agenda"),
              leading: const Icon(Icons.calendar_today),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.Calendar)
                  Navigator.pushReplacementNamed(context, RoutePaths.Calendar);
              }),
          // ListTile(
          //     title: Text("Maps"),
          //     leading: const Icon(Icons.map),
          //     trailing: const Icon(Icons.arrow_forward),
          //     onTap: () {
          //       Navigator.pop(context); // Close Drawer
          //       if (ModalRoute.of(context).settings.name != '/maps')
          //         Navigator.pushReplacementNamed(context, '/maps');
          //     }),
          const Divider(),
          Container(
            color: MinitelColors.ReportPrimaryColor,
            child: ListTile(
                title: const Text(
                  "Signaler Minitel",
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context); // Close Drawer
                  if (ModalRoute.of(context).settings.name !=
                      RoutePaths.Reporting)
                    Navigator.pushReplacementNamed(
                        context, RoutePaths.Reporting);
                }),
          ),
          ListTile(
              title: const Text("Documentation"),
              leading: const Icon(Icons.description),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.Docs)
                  Navigator.pushReplacementNamed(context, RoutePaths.Docs);
              }),
          ListTile(
            title: const Text("A propos..."),
            leading: const Icon(Icons.info),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context); // Close Drawer
              if (ModalRoute.of(context).settings.name != RoutePaths.About)
                Navigator.pushNamed(context, RoutePaths.About);
            },
          ),
          Container(
            color: Colors.lightGreen[100],
            child: ListTile(
              title: const Text("Alpha Feedback"),
              leading: const Icon(Icons.chat),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != RoutePaths.Feedback)
                  Navigator.pushNamed(context, RoutePaths.Feedback);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DocsDrawer extends StatelessWidget {
  final DocsPageId _docsPageId;
  final PageController controller;
  DocsDrawer(this._docsPageId, {Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          SafeArea(
            top: true,
            child: Container(
              height: 90,
              child: const DrawerHeader(
                child: Text(
                  "Documentation",
                  style: MinitelTextStyles.mdH1,
                ),
              ),
            ),
          ),
          ListTile(
              title: const Text("Minitel"),
              onTap: () {
                Navigator.pop(context);
                if (_docsPageId != DocsPageId.Home) Navigator.pop(context);
              } // Do nothing
              ),
          const Divider(),
          ListTile(
            title: const Text("Authentification"),
            onTap: () {
              Navigator.pop(context);
              if (_docsPageId != DocsPageId.Toolbox) {
                final _newController = PageController(
                  initialPage: 0,
                  viewportFraction: .9,
                );
                if (_docsPageId == DocsPageId.Home)
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      widget: ToolboxDocs(controller: _newController),
                    ),
                  );
                else if (_docsPageId == DocsPageId.Wiki)
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      builder: (_) => ToolboxDocs(controller: _newController),
                    ),
                  );
              } else
                controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
            },
          ),
          ListTile(
            title: const Text("Diagnostique"),
            onTap: () async {
              Navigator.pop(context);
              if (_docsPageId != DocsPageId.Toolbox) {
                final _newController = PageController(
                  initialPage: 1,
                  viewportFraction: .9,
                );
                if (_docsPageId == DocsPageId.Home)
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      widget: ToolboxDocs(controller: _newController),
                    ),
                  );
                else if (_docsPageId == DocsPageId.Wiki)
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      builder: (_) => ToolboxDocs(controller: _newController),
                    ),
                  );
              } else
                controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Configuration de l'imprimante"),
            onTap: () {
              Navigator.pop(context);
              if (_docsPageId != DocsPageId.Wiki) {
                final _newController = PageController(
                  initialPage: 0,
                  viewportFraction: .9,
                );
                if (_docsPageId == DocsPageId.Home)
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      widget: WikiDocs(controller: _newController),
                    ),
                  );
                else if (_docsPageId == DocsPageId.Toolbox)
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      builder: (_) => WikiDocs(controller: _newController),
                    ),
                  );
              } else
                controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
            },
          ),
          ListTile(
            title: const Text("Importation des mails SoGo"),
            onTap: () {
              Navigator.pop(context);
              if (_docsPageId != DocsPageId.Wiki) {
                final _newController = PageController(
                  initialPage: 1,
                  viewportFraction: .9,
                );
                if (_docsPageId == DocsPageId.Home)
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      widget: WikiDocs(controller: _newController),
                    ),
                  );
                else if (_docsPageId == DocsPageId.Toolbox)
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      builder: (_) => WikiDocs(controller: _newController),
                    ),
                  );
              } else
                controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
            },
          ),
          ListTile(
            title: const Text("Installer un Dual Boot"),
            onTap: () {
              Navigator.pop(context);
              if (_docsPageId != DocsPageId.Wiki) {
                final _newController = PageController(
                  initialPage: 2,
                  viewportFraction: .9,
                );
                if (_docsPageId == DocsPageId.Home)
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      widget: WikiDocs(controller: _newController),
                    ),
                  );
                else if (_docsPageId == DocsPageId.Toolbox)
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      builder: (_) => WikiDocs(controller: _newController),
                    ),
                  );
              } else
                controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
            },
          ),
          ListTile(
            title: const Text("Jouer avec des VM"),
            onTap: () {
              Navigator.pop(context);
              if (_docsPageId != DocsPageId.Wiki) {
                final _newController = PageController(
                  initialPage: 3,
                  viewportFraction: .9,
                );
                if (_docsPageId == DocsPageId.Home)
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      widget: WikiDocs(controller: _newController),
                    ),
                  );
                else if (_docsPageId == DocsPageId.Toolbox)
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      builder: (_) => WikiDocs(controller: _newController),
                    ),
                  );
              } else
                controller.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
            },
          ),
        ],
      ),
    );
  }
}
