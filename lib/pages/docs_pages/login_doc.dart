import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';

class LoginDoc extends StatelessWidget {
  const LoginDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Header(AppLoc.of(context).titleLoginPage),
          Header("${AppLoc.of(context).wordDomain} / IP", level: 2),
          Paragraph(
            AppLoc.of(context).sentenceDocLogin1,
            style: const TextStyle(fontWeight: FontWeight.bold, height: 1.5),
          ),
          Paragraph(AppLoc.of(context).sentenceDocLogin2),
        ],
      ),
    );
  }
}
