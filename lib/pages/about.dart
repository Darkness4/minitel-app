import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_version_checker.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_pages/licence_page.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AboutPage extends StatelessWidget {
  final String title;
  AboutPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Minitel Toolbox"),
                subtitle: Text(
                    "Minitel Toolbox regroupe les outils les plus utiles pour avoir un WiFi sans encombre"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text("Développeur"),
                subtitle: Text("Marc NGUYEN <nguyen_marc@live.fr>"),
                onTap: () => _launchURL("mailto:nguyen_marc@live.fr"),
              ),
              Divider(),
              ListTile(
                title: Text("Dernière version"),
                subtitle:
                    Text("https://github.com/Darkness4/minitel-app/releases"),
                onTap: () => _launchURL(
                    "https://github.com/Darkness4/minitel-app/releases"),
              ),
              Divider(),
              ListTile(
                title: Text("Site"), // Minitel
                subtitle: Text(""),
                onTap: () {}, // TODO: Launch url
              ),
              Divider(),
              ListTile(
                title: Text("Licence"),
                subtitle: Text("License MIT"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LicencePage()),
                    ),
              ),
              Divider(),
              ListTile(
                title: Text("Version"),
                subtitle: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (BuildContext context,
                      AsyncSnapshot<PackageInfo> packageInfo) {
                    switch (packageInfo.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Text('Awaiting result...');
                      case ConnectionState.done:
                        if (packageInfo.hasError)
                          return Text('Error: ${packageInfo.error}');
                        return Text(packageInfo.data.version);
                    }
                    return null; // unreachable
                  },
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text("Chercher une mise à jour"),
                onTap: () async {
                  var latestVersion = getLatestVersion();
                  var actualVersion = PackageInfo.fromPlatform();
                  dynamic ensemble =
                      await Future.wait([actualVersion, latestVersion]);
                  if (ensemble[0].version != ensemble[1]) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Une nouvelle version est disponible !",
                          ),
                          content: Text(
                              "La version ${ensemble[1]} est la dernière version."),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Close"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              child: Text("Update"),
                              onPressed: () => getLatestVersionURL()
                                  .then((url) => _launchURL(url)),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              // ListTile(
              //   title: Text("Faire un don"),
              //   onTap: () {}, // TODO: Faire un don (stripe ?, Paypal ? InApp ?)
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
