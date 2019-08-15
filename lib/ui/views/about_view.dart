import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/github_api.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

/// Page About
class AboutView extends StatelessWidget {
  final String title;
  const AboutView({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              const ListTile(
                title: Text("Minitel Toolbox"),
                isThreeLine: true,
                subtitle: Text(
                    "Minitel Toolbox regroupe les outils les plus utiles pour avoir un WiFi sans encombre."),
              ),
              const Divider(),
              ListTile(
                title: const Text("Développeur"),
                subtitle: const Text("Marc NGUYEN <nguyen_marc@live.fr>"),
                onTap: LaunchURL.mailToMarcNGUYEN,
              ),
              const Divider(),
              ListTile(
                title: const Text("Dernière version"),
                subtitle: const Text(
                    "https://github.com/Darkness4/minitel-app/releases"),
                onTap: LaunchURL.githubDarkness4Releases,
              ),
              const Divider(),
              ListTile(
                title: const Text("Site"), // Minitel
                subtitle: const Text("minitel.emse.fr"),
                onTap: LaunchURL.minitelWebsite,
              ),
              const Divider(),
              ListTile(
                title: const Text("Licence"),
                subtitle: const Text("License MIT"),
                onTap: () async {
                  var packageInfo = await PackageInfo.fromPlatform();
                  showLicensePage(
                    context: context,
                    applicationIcon: ImageIcon(
                      AssetImage(AssetPaths.Icon),
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
              ListTile(
                title: const Text("Politique de confidentalité"),
                subtitle: Text(
                  "Aucune donnée est partagée et stockée à votre insu. Les données collectées sont celles que vous nous fournissez (diagnostique et feedback) et ne sont jamais sauvegardées. ",
                  textAlign: TextAlign.justify,
                ),
                isThreeLine: true,
                onTap: () {}, // TODO: Faire un don (stripe ?, Paypal ? InApp ?)
              ),
              const Divider(),
              ListTile(
                title: const Text("Version"),
                subtitle: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (BuildContext context, packageInfo) {
                    switch (packageInfo.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Text('Awaiting result...');
                      case ConnectionState.done:
                        if (packageInfo.hasError) {
                          return Text('Error: ${packageInfo.error}');
                        }
                        return Text(packageInfo.data.version);
                    }
                    return null; // unreachable
                  },
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Chercher une mise à jour"),
                onTap: () async {
                  var packageInfo = PackageInfo.fromPlatform();
                  var versionAPI =
                      Provider.of<VersionAPI>(context).getLatestVersion();
                  PackageInfo actualRelease = await packageInfo;
                  LatestRelease latestRelease = await versionAPI;
                  if (actualRelease.version != latestRelease.tagName) {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Une nouvelle version est disponible !",
                          ),
                          content: Text(
                              "La version ${latestRelease.tagName} est la dernière version."),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text("Close"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              child: const Text("Update"),
                              onPressed: () =>
                                  LaunchURL.launchURL(latestRelease.htmlUrl),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              const Text("Il s'agit de la dernière version."),
                          content: Text(
                              "La version ${latestRelease.tagName} est la dernière version."),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text("Close"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              child: const Text("Télécharger"),
                              onPressed: () =>
                                  LaunchURL.launchURL(latestRelease.htmlUrl),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              // ListTile(
              //   title: const Text("Faire un don"),
              //   onTap: () {}, // TODO: Faire un don (stripe ?, Paypal ? InApp ?)
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
