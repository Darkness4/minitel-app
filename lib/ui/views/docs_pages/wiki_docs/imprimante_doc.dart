import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class ImprimanteDoc extends StatelessWidget {
  const ImprimanteDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH(AppLoc.of(context).docs.imprimante.header, 1),
          const BoxMdH("Windows", 2),
          Image.asset(AssetPaths.DocLecteurReseau),
          Text(AppLoc.of(context).docs.imprimante.windowsContent),
          const BoxMdH("Ubuntu", 2),
          Image.asset(AssetPaths.DocImprimanteLinux),
          Text(
            AppLoc.of(context).docs.imprimante.linuxContent1,
          ),
          const BoxMdH("Linux: CUPS", 2),
          const Text("    -  Install cups"),
          const LogCard(
            "sudo apt install cups",
            title: "Shell - Install CUPS",
          ),
          const LogCard(
            "sudo systemctl start cups.service",
            title: "Shell - Start CUPS",
          ),
          const LogCard(
            "sudo usermod -aG lpadmin <PSEUDO>",
            title: "Shell - Add user to lpadmin",
          ),
          Text(AppLoc.of(context).docs.imprimante.linuxContent2),
          const BoxMdH("PUK", 2),
          Text(AppLoc.of(context).docs.imprimante.pukContent),
        ],
      ),
    );
  }
}
