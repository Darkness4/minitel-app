import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/github/asset.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';

class GithubCard extends StatelessWidget {
  final GithubRelease release;
  final double elevation;

  const GithubCard({
    @required this.release,
    Key key,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                  release.author.avatar_url,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      release.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(height: 1),
                    ),
                    Text(release.author.login),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: <double>[0.0, 0.1, 1.0],
                colors: <Color>[
                  Colors.black,
                  Color(release.id ~/ 100 + 0xFF000000),
                  Colors.deepPurpleAccent,
                ],
              ),
            ),
            alignment: Alignment.center,
            height: 100,
            child: Text(
              "Version v${release.tag_name}",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .apply(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              release.body,
              overflow: TextOverflow.fade,
              maxLines: 10,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FlatButton(
              textColor: Colors.blue,
              onPressed: () => LaunchURL.launchURL(release.html_url),
              child: const Text(
                "See More...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              for (final GithubAsset asset in release.assets)
                OutlineButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () =>
                      LaunchURL.launchURL(asset.browser_download_url),
                  child: Text("${asset.name}"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}