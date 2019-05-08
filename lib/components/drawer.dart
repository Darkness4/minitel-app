import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        // fix regression, TODO: Remove when fixed
        children: <Widget>[
          DrawerHeader(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  child: Image.asset("assets/img/logo_minitel.png"),
                  height: 75,
                ),
                Text(
                  "Minitel Toolbox",
                  style: const TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
              title: Text("Authentification"),
              leading: const Icon(Icons.apps),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != '/')
                  Navigator.pushReplacementNamed(context, '/');
              }),
          Divider(),
          ListTile(
              title: Text("Nouveautés"),
              leading: const Icon(Icons.rss_feed),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != '/news')
                  Navigator.pushReplacementNamed(context, '/news');
              }),
          ListTile(
              title: Text("Agenda"),
              leading: const Icon(Icons.calendar_today),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != '/calendar')
                  Navigator.pushReplacementNamed(context, '/calendar');
              }),
          ListTile(
              title: Text("Maps"),
              leading: const Icon(Icons.map),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != '/maps')
                  Navigator.pushReplacementNamed(context, '/maps');
              }),
          Divider(),
          Container(
            color: Colors.red,
            child: ListTile(
                title: Text(
                  "Signaler Minitel",
                  style: const TextStyle(color: Colors.white),
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
                  if (ModalRoute.of(context).settings.name != '/reporting')
                    Navigator.pushReplacementNamed(context, '/reporting');
                }),
          ),
          ListTile(
              title: Text("Documentation"),
              leading: const Icon(Icons.description),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                if (ModalRoute.of(context).settings.name != '/docs')
                  Navigator.pushReplacementNamed(context, '/docs');
              }),
        ],
      ),
    );
  }
}
