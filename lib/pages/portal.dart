import 'package:flutter/material.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class PortalPage extends StatefulWidget {
  final String title;

  PortalPage({Key key, this.title}) : super(key: key);

  PortalPageState createState() => PortalPageState();
}

class PortalPageState extends State<PortalPage> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.purple,
        child: GridView.count(
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.lightGreen[100],
              elevation: 4,
              child: InkWell(
                onTap: () => _launchURL("https://sogo.emse.fr/"),
                // TODO push Named Sogo WebView
                // WebView(
                //   initialUrl: 'https://flutter.io',
                //   javascriptMode: JavascriptMode.unrestricted,
                // )
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/mail.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () => _launchURL("https://campus.emse.fr/"),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/moodle.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: InkWell(
                highlightColor: Color(0xa0000000),
                splashColor: Colors.black,
                onTap: () => _launchURL("https://promethee.emse.fr/"),
                child: Opacity(
                  opacity: 0.9,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/promethee.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: InkWell(
                highlightColor: Color(0xa0000000),
                splashColor: Colors.black,
                onTap: () => _launchURL("http://edusoft.emse.fr/"),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.7],
                      colors: [
                        Colors.lightBlue[200].withAlpha(240),
                        Colors.blue.withAlpha(240),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder: (context, constraint) => Column(
                          children: <Widget>[
                            Icon(
                              Icons.cloud_download,
                              size: constraint.biggest.height - 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Logiciels",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () => _launchURL("https://gitlab.emse.fr/"),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/gitlab.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () => _launchURL("http://annuaire.emse.fr/"),
                child: LayoutBuilder(
                  builder: (context, constraint) => Column(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: constraint.biggest.height - 40,
                            color: Colors.blue,
                          ),
                          Text(
                            "Annuaire",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          )
                        ],
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
