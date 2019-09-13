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
    final double size = MediaQuery.of(context).size.shortestSide;
    return Scrollbar(
      child: Wrap(
        key: const Key('apps_list/list'),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            height: size / 2,
            width: size / 2,
            child: const _PortailCard(),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: size / 2,
            width: size / 2,
            child: const _SogoCard(),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: size / 2,
            width: size / 2,
            child: const _ImprimanteCard(),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: size / 2,
            width: size / 2,
            child: const _WikiMinitelCard(),
          ),
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
          MaterialPageRoute<dynamic>(builder: (_) => const ImprimanteWebView()),
        ),
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraint) => Column(
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
            MaterialPageRoute<dynamic>(builder: (_) => const PortailWebView()),
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
            const FittedBox(
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
          MaterialPageRoute<dynamic>(builder: (_) => const SogoWebView()),
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
          MaterialPageRoute<dynamic>(builder: (_) => const MinitelWebView()),
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.asset(
                AssetPaths.LogoMinitel,
                fit: BoxFit.scaleDown,
              ),
            ),
            const FittedBox(
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
