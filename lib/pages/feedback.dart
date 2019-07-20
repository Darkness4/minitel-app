import 'dart:io' show Platform;

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_webhook.dart';
import 'package:minitel_toolbox/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:package_info/package_info.dart';

class FeedbackPage extends StatefulWidget {
  final String title;

  FeedbackPage({Key key, this.title}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _titleController;

  FocusNode _titleFocusNode;

  FocusNode _descriptionFocusNode;

  TextEditingController _descriptionController;

  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xff087f23),
      body: Center(
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _titleController,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          focusNode: _titleFocusNode,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: "Titre",
                            hintText: "Ex. : La page X est lente.",
                          ),
                          onSubmitted: (term) {
                            _titleFocusNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(_descriptionFocusNode);
                          },
                        ),
                        TextField(
                          controller: _descriptionController,
                          maxLines: null,
                          focusNode: _descriptionFocusNode,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            labelText: "Description",
                            hintText: "Comment reproduire le bug ?",
                          ),
                          onSubmitted: (term) {
                            _descriptionFocusNode.unfocus();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DocCard(
                elevation: 4,
                children: <Widget>[
                  BoxMdH("Autres Contacts", 1),
                  FlatButton(
                    textColor: Colors.blueAccent,
                    child: Text(
                      "Github Issues",
                      style: MinitelTextStyles.mdH2
                          .apply(color: Colors.blueAccent),
                    ),
                    onPressed: LaunchURL.githubDarkness4Issues,
                    color: Colors.lightBlue[100],
                  ),
                  FlatButton(
                    textColor: Colors.blueAccent,
                    child: Text(
                      "Mail : marc_nguyen@live.fr",
                      style: MinitelTextStyles.mdH4
                          .apply(color: Colors.blueAccent),
                    ),
                    onPressed: LaunchURL.mailToMarcNGUYEN,
                    color: Colors.lightBlue[100],
                  ),
                  Text(
                    "IRL : Marc NGUYEN, Chambre 2012",
                    style: MinitelTextStyles.body1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Image.asset("assets/img/Slack_Mark_Monochrome_White.png"),
            onPressed: () => _send(context),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _titleFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _descriptionController = TextEditingController();
  }

  void _send(BuildContext ctxt) async {
    var packageInfo = await PackageInfo.fromPlatform();
    var description =
        "${_descriptionController.text.replaceAll(RegExp(r'\n'), '\n>')}\n\n";
    IosDeviceInfo iosInfo;
    AndroidDeviceInfo androidInfo;
    if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
      description += "Running on ${iosInfo.utsname.machine}";
    } else if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      description += "Fingerprint: ${androidInfo.fingerprint}\n"
          "Android: ${androidInfo.version.release}\n"
          "SDK: ${androidInfo.version.sdkInt}\n";
    }
    await Webhook.report(">$description\n\n",
        title: "Minitel App v${packageInfo.version} : ${_titleController.text}",
        botName: "Flutter Alpha Feedback Bot");

    Scaffold.of(ctxt).showSnackBar(
      SnackBar(
        content: Text("Envoyé !"),
      ),
    );
  }
}
