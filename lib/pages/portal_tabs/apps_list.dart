import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_campus.dart';
import 'package:minitel_toolbox/funcs/http_portail.dart';

import 'portal_apps/annuaire.dart';
import 'portal_apps/campus.dart';
import 'portal_apps/gitlab.dart';
import 'portal_apps/imprimante.dart';
import 'portal_apps/logiciels.dart';
import 'portal_apps/minitel.dart';
import 'portal_apps/portail.dart';
import 'portal_apps/promethee.dart';
import 'portal_apps/sogo.dart';

/// Fragment listing in a [GridView] multiple supported Apps.
class AppsList extends StatelessWidget {
  const AppsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          colors: [
            const Color(0xff89f7fe),
            const Color(0xff66a6ff)
          ], // whitish to gray
        ),
      ),
      child: Scrollbar(
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            const _SogoCard(),
            const _CampusCard(),
            const _PrometheeCard(),
            const _EduSoftCard(),
            const _GitlabEMSECard(),
            const _AnnuaireCard(),
            const _ImprimanteCard(),
            const _WikiMinitelCard(),
            const _PortailCard(),
          ],
        ),
      ),
    );
  }
}

/// [Card] responsible for the Annuaire App.
class _AnnuaireCard extends StatelessWidget {
  const _AnnuaireCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnnuaireWebView()),
            ),
        // onTap: () => _launchURL('http://annuaire.emse.fr/'),
        child: LayoutBuilder(
          builder: (context, constraint) => Column(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: constraint.biggest.height - 50,
                    color: Colors.blue,
                  ),
                  Text(
                    "Annuaire",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }
}

/// [Card] responsible for the Campus App.
class _CampusCard extends StatelessWidget {
  const _CampusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () async {
          String cookie = await getSavedCookieCampus();
          print(cookie);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CampusWebView(
                    cookie: cookie,
                  ),
            ),
          );
        },
        // onTap: () => _launchURL('https://campus.emse.fr/'),
        child: Image.asset('assets/img/moodle.png'),
      ),
    );
  }
}

/// [Card] responsible for the EduSoft App.
class _EduSoftCard extends StatelessWidget {
  const _EduSoftCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        highlightColor: const Color(0xa0000000),
        splashColor: Colors.black,
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogicielsWebView()),
            ),
        // onTap: () => _launchURL('http://edusoft.emse.fr/'),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.7],
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
                      size: constraint.biggest.height - 50,
                      color: Colors.white,
                    ),
                    const Text(
                      "Logiciels",
                      style: const TextStyle(
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
    );
  }
}

/// [Card] responsible for the GitlabEMSE App.
class _GitlabEMSECard extends StatelessWidget {
  const _GitlabEMSECard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GitlabWebView()),
            ),
        // onTap: () => _launchURL('https://gitlab.emse.fr/'),
        child: Image.asset('assets/img/gitlab.png'),
      ),
    );
  }
}

/// [Card] responsible for the Imprimante App.
class _ImprimanteCard extends StatelessWidget {
  const _ImprimanteCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        // onTap: () => _launchURL(
        //       "http://192.168.130.2/watchdoc",
        //       forceWebView: false,
        //     ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImprimanteWebView()),
            ),
        child: LayoutBuilder(
          builder: (context, constraint) => Column(
                children: <Widget>[
                  Icon(
                    Icons.print,
                    size: constraint.biggest.height - 50,
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
    );
  }
}

class _PortailCard extends StatelessWidget {
  const _PortailCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: () async {
          String cookie = await getSavedCookiePortail();
          print(cookie);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PortailWebView(cookie: cookie)),
          );
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.asset(
                'assets/img/logo_emse.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              "Portail",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// [Card] responsible for the Promethee App.
class _PrometheeCard extends StatelessWidget {
  const _PrometheeCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        highlightColor: Color(0xa0000000),
        splashColor: Colors.black,
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrometheeWebView()),
            ),
        // onTap: () => _launchURL('https://promethee.emse.fr/'),
        child: Opacity(
          opacity: 0.9,
          child: Image.asset(
            'assets/img/promethee.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

/// [Card] responsible for the Sogo App.
class _SogoCard extends StatelessWidget {
  const _SogoCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen[100],
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SogoWebView()),
            ),
        // onTap: () => _launchURL('https://sogo.emse.fr/'),
        child: Image.asset('assets/img/mail.png'),
      ),
    );
  }
}

class _WikiMinitelCard extends StatelessWidget {
  const _WikiMinitelCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MinitelWebView()),
          );
        },
        // onTap: () => _launchURL('http://minitel.emse.fr/wiki/Wiki-user'),
        child: Image.asset(
          'assets/img/logo_minitel.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
