import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class MailDoc extends StatelessWidget {
  const MailDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH(AppLoc.of(context).docs.mail.header, 1),
          Text(AppLoc.of(context).docs.mail.mailContent1),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(AppLoc.of(context).docs.mail.mailContent2),
            ),
          ),
        ],
      ),
    );
  }
}
