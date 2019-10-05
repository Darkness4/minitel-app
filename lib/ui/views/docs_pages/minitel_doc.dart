import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class MinitelDoc extends StatelessWidget {
  const MinitelDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          const BoxMdH("Minitel", 1),
          Image.asset(AssetPaths.Icon),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLoc.of(context).docs.minitel,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
