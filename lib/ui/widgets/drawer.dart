import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

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
