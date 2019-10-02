import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class LoginDoc extends StatelessWidget {
  const LoginDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH(AppLoc.of(context).docs.login.header, 1),
          InkWell(
            onTap: () {},
            child: Image.asset(AssetPaths.DocNetwork),
          ),
          BoxMdH(AppLoc.of(context).portal.domainNameHeader, 2),
          Text.rich(
            TextSpan(
              text: AppLoc.of(context).docs.login.domainNameContent1,
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: AppLoc.of(context).docs.login.domainNameContent2,
                  style: Theme.of(context).textTheme.body1,
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.login.domainNameContent3,
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
