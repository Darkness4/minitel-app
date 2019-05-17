import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_version_checker.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

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
                onTap: () async {
                  var packageInfo = await PackageInfo.fromPlatform();
                  showLicensePage(
                    context: context,
                    applicationIcon: Flexible(
                      child: Image.asset('assets/icon/icon.png'),
                    ),
                    applicationLegalese: "MIT License\n\n"
                        "Copyright (c) 2019 NGUYEN Marc\n\n"
                        "Permission is hereby granted, free of charge, to any person obtaining a copy "
                        "of this software and associated documentation files (the \"Software\"), to deal "
                        "in the Software without restriction, including without limitation the rights "
                        "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell "
                        "copies of the Software, and to permit persons to whom the Software is "
                        "furnished to do so, subject to the following conditions:\n\n"
                        "The above copyright notice and this permission notice shall be included in all "
                        "copies or substantial portions of the Software.\n\n"
                        "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR "
                        "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, "
                        "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE "
                        "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER "
                        "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, "
                        "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE "
                        "SOFTWARE.",
                    applicationVersion: packageInfo.version,
                  );
                },
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
                  if (ensemble[0].version != ensemble[1])
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
                  else
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Il s'agit de la dernière version.",
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
                              child: Text("Télécharger"),
                              onPressed: () => getLatestVersionURL()
                                  .then((url) => _launchURL(url)),
                            )
                          ],
                        );
                      },
                    );
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
