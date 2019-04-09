import 'package:flutter/material.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'portal_apps/sogo.dart';
import 'portal_apps/annuaire.dart';
import 'portal_apps/campus.dart';
import 'portal_apps/logiciels.dart';
import 'portal_apps/gitlab.dart';
import 'portal_apps/promethee.dart';
import 'portal_apps/imprimante.dart';

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
                // onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => SogoWebView()),
                //     ),
                onTap: _launchURL('https://sogo.emse.fr/'),
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
                // onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => CampusWebView()),
                //     ),
                onTap: _launchURL('https://campus.emse.fr/'),
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
                // onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => PrometheeWebView()),
                //     ),
                onTap: _launchURL('https://promethee.emse.fr/'),
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
                // onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => LogicielsWebView()),
                //     ),
                onTap: _launchURL('http://edusoft.emse.fr/'),
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
                // onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => GitlabWebView()),
                //     ),
                onTap: _launchURL('https://gitlab.emse.fr/'),
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
                // onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AnnuaireWebView()),
                //     ),
                onTap: _launchURL('http://annuaire.emse.fr/'),
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
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () => _launchURL("http://192.168.130.2/watchdoc"),
                child: LayoutBuilder(
                  builder: (context, constraint) => Column(
                        children: <Widget>[
                          Icon(
                            Icons.print,
                            size: constraint.biggest.height - 40,
                            color: Colors.blue,
                          ),
                          Text(
                            "Imprimante",
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
