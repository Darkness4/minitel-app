import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DocCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final double extPadding;
  final double intPadding;

  DocCard(
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
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ),
      ),
    );
  }
}

class LogCard extends StatelessWidget {
  final String title;
  final String text;
  final double elevation;

  LogCard(this.text, {this.title, this.elevation: 3});

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: elevation,
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(title, style: styleLogImportant),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(text, style: styleLog),
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
  final double intPadding;

  NewsCard(
      {this.item,
      this.elevation,
      this.extPadding: 10.0,
      this.intPadding: 15.0});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(extPadding),
      child: Card(
        color: Colors.white,
        elevation: elevation,
        child: InkWell(
          highlightColor: Color(0xa0000000),
          splashColor: Colors.black,
          onTap: () {
            _launchURL(item.links.map((link) => link.href).toList().first);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  const Color(0xef667eea),
                  const Color(0xef764ba2)
                ], // whitish to gray
              ),
            ),
            padding: EdgeInsets.all(intPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Header(
                    RegExp(r'\n\s+([^\\]*)\n').firstMatch(item.title).group(1),
                    level: 2,
                    color: Colors.white,
                  ),
                  // Regex delete \n\s\s\sText with spaces\n
                  Header(
                    (item.authors)
                        .map((author) => author.name)
                        .toList()
                        .join(" "),
                    level: 3,
                    color: Colors.white,
                  ),
                  Paragraph(
                    item.summary != null ? item.summary : "",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  // Paragraph(item.content.toString()),
                  // Paragraph(item.published.toString()),
                  // Paragraph(item.source.toString()),
                  Paragraph(
                    item.links.map((link) => link.href).toList().join(""),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  // Paragraph(item.categories.map((category) => category.lavel).toList().join(" ")),
                  // Paragraph((item.contributors).map((contributor) => contributor.name).toList().join(" ")),
                  // Paragraph(item.rights.toString()),
                  // Paragraph(item.media.toString()),

                  Text(item.updated,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
