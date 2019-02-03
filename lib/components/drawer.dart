import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),  // fix regression, TODO: Remove when fixed
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Minitel toolbox",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
              title: Text("fw-cgcp.emse.fr Login"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              }),
          ListTile(
              title: Text("Diagnose internet"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/diagnose');
              }),
        ],
      ),
    );
  }
}
