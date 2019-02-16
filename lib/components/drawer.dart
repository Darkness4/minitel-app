import 'package:auto_login_flutter/localizations.dart';
import 'package:flutter/material.dart';

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
              AppLoc
                  .of(context)
                  .title,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
              title: Text(AppLoc
                  .of(context)
                  .titleLoginPage),
              leading: Icon(Icons.vpn_key),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              }),
          ListTile(
              title: Text(AppLoc
                  .of(context)
                  .titleDiagnosePage),
              leading: Icon(Icons.zoom_in),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/diagnose');
              }),
          ListTile(
              title: Text(AppLoc
                  .of(context)
                  .titleDocumentationPage),
              leading: Icon(Icons.description),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/docs');
              }),
          ListTile(
              title: Text(AppLoc
                  .of(context)
                  .titleNewsPage),
              leading: Icon(Icons.rss_feed),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/news');
              }),
          ListTile(
              title: Text(AppLoc
                  .of(context)
                  .titleCalendarPage),
              leading: Icon(Icons.calendar_today),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/calendar');
              }),
          ListTile(
              title: Text(AppLoc
                  .of(context)
                  .titleMapsPage),
              leading: Icon(Icons.map),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/maps');
              }),
        ],
      ),
    );
  }
}
