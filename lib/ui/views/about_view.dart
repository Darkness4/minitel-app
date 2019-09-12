import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:package_info/package_info.dart';

/// Page About
class AboutView extends StatelessWidget {
  final String title;
  const AboutView({
    @required this.title,
    Key key,
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
                  final PackageInfo packageInfo =
                      await PackageInfo.fromPlatform();
                  showLicensePage(
                    context: context,
                    applicationIcon: const ImageIcon(
                      AssetImage(AssetPaths.Icon),
                    ),
                    applicationLegalese: """MIT License

Copyright (c) 2019 NGUYEN Marc et Minitel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.""",
                    applicationVersion: packageInfo.version,
                  );
                },
              ),
              ListTile(
                title: const Text("Politique de confidentalité"),
                subtitle: const Text(
                  "Aucune donnée est partagée et stockée à votre insu. Les données collectées sont "
                  "celles que vous nous fournissez (diagnostique) et ne sont jamais "
                  "sauvegardées. ",
                  textAlign: TextAlign.justify,
                ),
                isThreeLine: true,
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text("Version"),
                subtitle: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (BuildContext context,
                      AsyncSnapshot<PackageInfo> packageInfo) {
                    if (packageInfo.hasError) {
                      return Text('Error: ${packageInfo.error}');
                    }
                    switch (packageInfo.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const Text('Awaiting result...');
                      case ConnectionState.done:
                        return Text(packageInfo.data.version);
                    }
                    return null; // unreachable
                  },
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
