import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_portail.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';

import 'portal_apps/imprimante.dart';
import 'portal_apps/minitel.dart';
import 'portal_apps/portail.dart';
import 'portal_apps/sogo.dart';

/// Fragment listing in a [GridView] multiple supported Apps.
class AppsList extends StatelessWidget {
  const AppsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.count(
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          const _PortailCard(),
          const _SogoCard(),
          const _ImprimanteCard(),
          const _WikiMinitelCard(),
        ],
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
              FittedBox(
                child: Text(
                  "Imprimante",
                  style: MinitelTextStyles.appTitle,
                ),
              ),
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
          String cookie = await Portail.getSavedCookiePortail();
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
            FittedBox(
              child: Text(
                "Portail",
                style: MinitelTextStyles.appTitle,
              ),
            )
          ],
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
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SogoWebView()),
        ),
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
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MinitelWebView()),
          );
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.asset(
                'assets/img/logo_minitel.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            FittedBox(
              child: Text(
                "Wiki",
                style: MinitelTextStyles.appTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
