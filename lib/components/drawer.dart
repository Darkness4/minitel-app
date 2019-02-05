import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        // fix regression, TODO: Remove when fixed
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Minitel toolbox",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
              title: Text("Gateway Login"),
              leading: Icon(Icons.vpn_key),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              }),
          ListTile(
              title: Text("Internet Diagnosis"),
              leading: Icon(Icons.network_wifi),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/diagnose');
              }),
          ListTile(
              title: Text("Documentation"),
              leading: Icon(FontAwesomeIcons.solidFileAlt),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/docs');
              }),
        ],
      ),
    );
  }
}
