import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

class LogCard extends StatelessWidget {
  final String title;
  final String text;
  final double elevation;

  const LogCard(
    this.text, {
    @required this.title,
    Key key,
    this.elevation = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: elevation,
        color: MinitelColors.TerminalHeaderColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: MinitelColors.TerminalBgColor,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: "RobotoMono",
                  color: MinitelColors.TerminalFgColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: InkWell(
        onTap: () => LaunchURL.launchURL(release.html_url),
        child: Container(
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
                height: 100,
                child: Center(
                  child: Text(
                    "Version v${release.tag_name}",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Text(
                  release.body,
                  overflow: TextOverflow.fade,
                  maxLines: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    textColor: Colors.blue,
                    onPressed: () => LaunchURL.launchURL(release.html_url),
                    child: const Text(
                      "See More...",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
