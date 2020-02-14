import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/utils/launch_url_utils.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/pages/portal/portal_apps/campus.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/animations/page_animation.dart';

import 'portal_apps/imprimante.dart';
import 'portal_apps/minitel.dart';
import 'portal_apps/portail.dart';
import 'portal_apps/sogo.dart';

/// Fragment listing in a [GridView] multiple supported Apps.
class AppsScreen extends StatelessWidget {
  const AppsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.shortestSide;
    return Scrollbar(
      child: Wrap(
        key: const Key(Keys.appsList),
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
            child: const _PrometheeCard(),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: size / 2,
            width: size / 2,
            child: const _CampusCard(),
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
        key: const Key(Keys.imprimante),
        onTap: () => Navigator.push<dynamic>(
          context,
          FadeRoute<dynamic>(
            builder: (context) => ImprimanteWebView(
              remoteDataSourceCookies: sl<ImprimanteRemoteDataSource>().cookies,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraint) => Column(
            children: <Widget>[
              Expanded(
                child: FittedBox(
                  child: Icon(
                    Icons.print,
                    color: Colors.blue,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  AppLoc.of(context).portal.apps.printer,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .apply(fontWeightDelta: 4),
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
        key: const Key(Keys.portail),
        onTap: () async {
          await Navigator.push<dynamic>(
            context,
            FadeRoute<dynamic>(
              builder: (_) => PortailWebView(
                portailEMSEcookies: sl<PortailEMSERemoteDataSource>().cookies,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                AssetPaths.EMSE,
                fit: BoxFit.scaleDown,
              ),
            ),
            FittedBox(
              child: Text(
                AppLoc.of(context).portal.apps.portal,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .apply(fontWeightDelta: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CampusCard extends StatelessWidget {
  const _CampusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        key: const Key(Keys.portail),
        onTap: () async {
          await Navigator.push<dynamic>(
            context,
            FadeRoute<dynamic>(
              builder: (_) => CampusWebView(
                portailEMSEcookies: sl<PortailEMSERemoteDataSource>().cookies,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                AssetPaths.Campus,
                fit: BoxFit.scaleDown,
              ),
            ),
            FittedBox(
              child: Text(
                "Campus",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .apply(fontWeightDelta: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrometheeCard extends StatelessWidget {
  const _PrometheeCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        key: const Key(Keys.portail),
        onTap: () async {
          // await Navigator.push<dynamic>(
          //   context,
          //   FadeRoute<dynamic>(
          //     builder: (_) => PrometheeWebView(
          //       portailEMSEcookies: sl<PortailEMSERemoteDataSource>().cookies,
          //     ),
          //   ),
          // );
          await LaunchURLUtils.launchURL("https://promethee.emse.fr");
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                AssetPaths.Promethee,
                fit: BoxFit.scaleDown,
              ),
            ),
            FittedBox(
              child: Text(
                "Promethee",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .apply(fontWeightDelta: 4),
              ),
            ),
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
        key: const Key(Keys.sogo),
        onTap: () => Navigator.push<dynamic>(
          context,
          FadeRoute<dynamic>(builder: (_) => const SogoWebView()),
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
        key: const Key(Keys.wikiMinitel),
        onTap: () => Navigator.push<dynamic>(
          context,
          FadeRoute<dynamic>(builder: (_) => const MinitelWebView()),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                AssetPaths.LogoMinitel,
                fit: BoxFit.scaleDown,
              ),
            ),
            FittedBox(
              child: Text(
                "Wiki",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .apply(fontWeightDelta: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
