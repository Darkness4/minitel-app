import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
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
        key: const Key('app_lists/imprimante'),
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
              const FittedBox(
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
      elevation: 4,
      child: InkWell(
        key: const Key('app_lists/portail'),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PortailWebView()),
          );
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.asset(
                AssetPaths.EMSE,
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
        key: const Key('app_lists/sogo'),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SogoWebView()),
        ),
        child: Image.asset(AssetPaths.Sogo),
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
        key: const Key('app_lists/wiki_minitel'),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MinitelWebView()),
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.asset(
                AssetPaths.LogoMinitel,
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
