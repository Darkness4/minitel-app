import 'dart:io' show Platform;

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/services/http_webhook.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class FeedbackView extends StatefulWidget {
  final String title;

  const FeedbackView({Key key, this.title}) : super(key: key);

  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
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
      backgroundColor: const Color(0xff087f23),
      body: Center(
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Card(
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
                        onSubmitted: (String term) {
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
                        onSubmitted: (String term) {
                          _descriptionFocusNode.unfocus();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              DocCard(
                elevation: 4,
                children: <Widget>[
                  const BoxMdH("Autres Contacts", 1),
                  FlatButton(
                    textColor: Colors.blueAccent,
                    onPressed: LaunchURL.githubDarkness4Issues,
                    color: Colors.lightBlue[100],
                    child: Text(
                      "Github Issues",
                      style: MinitelTextStyles.mdH2
                          .apply(color: Colors.blueAccent),
                    ),
                  ),
                  FlatButton(
                    textColor: Colors.blueAccent,
                    onPressed: LaunchURL.mailToMarcNGUYEN,
                    color: Colors.lightBlue[100],
                    child: Text(
                      "Mail : marc_nguyen@live.fr",
                      style: MinitelTextStyles.mdH4
                          .apply(color: Colors.blueAccent),
                    ),
                  ),
                  const Text(
                    "IRL : Marc NGUYEN, Chambre 2012",
                    style: MinitelTextStyles.body1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: const MainDrawer(
        currentRoutePaths: RoutePaths.Feedback,
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () => _send(context),
            child: const ImageIcon(
              AssetImage(AssetPaths.Slack),
              size: 75.0,
            ),
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

  Future<void> _send(BuildContext ctxt) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String description =
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
    await Provider.of<WebhookAPI>(ctxt).report(
      "*Minitel App v${packageInfo.version} : ${_titleController.text}*\n"
      ">$description\n\n",
      botName: "Flutter Beta Feedback Bot",
    );

    Scaffold.of(ctxt).showSnackBar(
      const SnackBar(
        content: Text("Envoyé !"),
      ),
    );
  }
}
