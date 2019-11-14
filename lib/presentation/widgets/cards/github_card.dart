import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:minitel_toolbox/core/utils.dart';
import 'package:minitel_toolbox/domain/entities/github/asset.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';

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
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.shortestSide / 2),
      child: Card(
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
                            .headline5
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
                    .headline4
                    .apply(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MarkdownBody(data: release.body),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FlatButton(
                textColor: Colors.blue,
                onPressed: () => LaunchURLUtils.launchURL(release.html_url),
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
                        LaunchURLUtils.launchURL(asset.browser_download_url),
                    child: Text("${asset.name}"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
