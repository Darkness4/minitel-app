import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:html/parser.dart' show parseFragment;
import 'package:url_launcher/url_launcher.dart';

class DocCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final double extPadding;
  final double intPadding;

  const DocCard(
      {@required this.children,
      this.elevation: 4.0,
      this.extPadding: 10.0,
      this.intPadding: 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(extPadding),
      child: Card(
        elevation: elevation,
        child: Container(
          padding: EdgeInsets.all(intPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

class LogCard extends StatelessWidget {
  final String title;
  final String text;
  final double elevation;

  const LogCard(this.text, {@required this.title, this.elevation: 3});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: elevation,
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: "RobotoMono",
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final dynamic item;
  final double elevation;
  final double extPadding;

  const NewsCard({
    @required this.item,
    this.elevation: 4.0,
    this.extPadding: 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(extPadding),
      child: Card(
        elevation: elevation,
        child: InkWell(
          onTap: () =>
              _launchURL(item.links.map((link) => link.href).toList().first),
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
                          item.media.thumbnails.first.url
                              .toString()
                              .replaceAll("?s=30", "?s=90"),
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
                              item.title.trim(),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(height: 1),
                            ),
                            Text(
                              (item.authors)
                                  .map((author) => author.name)
                                  .toList()
                                  .join(" "),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.0, 0.1, 1.0],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.black,
                          Color(int.parse(item.id.toString().substring(33, 39),
                                  radix: 16) +
                              0xFF000000),
                          Colors.deepPurpleAccent,
                        ],
                      ),
                    ),
                    height: 100,
                    child: Center(
                      child: Text(
                        "Commit #${item.id.toString().substring(33, 41)}",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      parseFragment(item.content).text,
                    ),
                  ),

                  // Paragraph(
                  //   item.summary != null ? item.summary : "",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // Paragraph(item.content.toString()),
                  // Paragraph(item.published.toString()),
                  // Paragraph(item.source.toString()),
                  // Paragraph(
                  //   item.links.map((link) => link.href).toList().join(""),
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // Paragraph(item.categories.map((category) => category.lavel).toList().join(" ")),
                  // Paragraph((item.contributors).map((contributor) => contributor.name).toList().join(" ")),
                  // Paragraph(item.rights.toString()),
                  // Paragraph(item.media.toString()),

                  // Text(item.updated,
                  //     style: TextStyle(
                  //       fontStyle: FontStyle.italic,
                  //       color: Colors.white,
                  //     )),
                ]),
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
