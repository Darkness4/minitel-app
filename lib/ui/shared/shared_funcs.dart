import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/github/asset.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/core/services/github_api.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

Future<void> checkLatestVersion(BuildContext context,
    {bool doNotShowIfNoUpdate = false}) async {
  try {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final GithubRelease githubRelease = await Provider.of<GithubAPI>(context)
        .fetchLatestRelease('Darkness4/minitel-app');

    if (doNotShowIfNoUpdate == false ||
        (doNotShowIfNoUpdate == true &&
            packageInfo.version != githubRelease.tag_name)) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              packageInfo.version != githubRelease.tag_name
                  ? "Une nouvelle version est disponible !"
                  : "Il s'agit de la dernière version.",
            ),
            content: Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                githubRelease.body.substring(
                        0,
                        githubRelease.body.length > 300
                            ? 300
                            : githubRelease.body.length) +
                    (githubRelease.body.length > 300 ? '...' : ''),
                style: TextStyle(color: Colors.black87, fontSize: 11.0),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                key: const Key('portal_view/close_update'),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"),
              ),
              Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<GithubAsset>(
                    isDense: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: githubRelease.assets
                        .map((GithubAsset asset) =>
                            DropdownMenuItem<GithubAsset>(
                              value: asset,
                              child: Text(RegExp(r"minitel-toolbox-(.*)-v")
                                  .firstMatch(asset.name)
                                  .group(1)),
                            ))
                        .toList(),
                    hint: Text(
                      'Télécharger',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    underline: const SizedBox(),
                    onChanged: (GithubAsset asset) =>
                        LaunchURL.launchURL(asset.browser_download_url),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  } on SocketException {
    print("Cannot connect to Github to check version");
  }
}
