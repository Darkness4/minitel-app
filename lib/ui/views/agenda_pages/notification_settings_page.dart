import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/models/notifications.dart';

class NotificationSettingsPage extends StatefulWidget {
  final NotificationSettings notificationSettings;

  const NotificationSettingsPage({@required this.notificationSettings});

  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final TextEditingController _rangeController = TextEditingController();
  final TextEditingController _earlyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLoc.of(context).agenda.notificationSettings.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(AppLoc.of(context).agenda.notificationSettings.enabled1),
                Switch(
                  value: widget.notificationSettings.enabled,
                  onChanged: (bool value) => setState(() {
                    widget.notificationSettings.enabled = value;
                  }),
                ),
                Text(AppLoc.of(context)
                    .agenda
                    .notificationSettings
                    .enabled2(widget.notificationSettings.enabled)),
              ],
            ),
            Row(
              children: <Widget>[
                Text(AppLoc.of(context).agenda.notificationSettings.early1),
                Expanded(
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                      BlacklistingTextInputFormatter.singleLineFormatter,
                    ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: _earlyController,
                  ),
                ),
                Text(AppLoc.of(context).agenda.notificationSettings.early2),
              ],
            ),
            Row(
              children: <Widget>[
                Text(AppLoc.of(context).agenda.notificationSettings.range1),
                Expanded(
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                      BlacklistingTextInputFormatter.singleLineFormatter,
                    ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: _rangeController,
                  ),
                ),
                Text(AppLoc.of(context).agenda.notificationSettings.range2),
              ],
            ),
            Builder(
              builder: (BuildContext context) => RaisedButton(
                color: Theme.of(context).primaryColor,
                colorBrightness: Brightness.dark,
                onPressed: () async {
                  widget.notificationSettings.early =
                      Duration(minutes: int.parse(_earlyController.text));
                  widget.notificationSettings.range =
                      Duration(days: int.parse(_rangeController.text));
                  await widget.notificationSettings.saveSettings();
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Success."),
                  ));
                },
                child:
                    Text(AppLoc.of(context).agenda.notificationSettings.save),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rangeController.dispose();
    _earlyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _initStateAsync();
    super.initState();
  }

  Future<void> _initStateAsync() async {
    await widget.notificationSettings.loadSettings();
    _rangeController.text = widget.notificationSettings.range.inDays.toString();
    _earlyController.text =
        widget.notificationSettings.early.inMinutes.toString();
  }
}
