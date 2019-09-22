import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: const Text("Paramètres de notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text("Les notifications sont "),
                Switch(
                  value: widget.notificationSettings.enabled,
                  onChanged: (bool value) => setState(() {
                    widget.notificationSettings.enabled = value;
                  }),
                ),
                Text(widget.notificationSettings.enabled
                    ? 'activées'
                    : 'désactivées'),
              ],
            ),
            Row(
              children: <Widget>[
                const Text("Notifier "),
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
                const Text(" minutes avant le cours."),
              ],
            ),
            Row(
              children: <Widget>[
                const Text("Notifier les cours des "),
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
                const Text(" prochains jours."),
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
                child: const Text("Sauvegarder"),
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
    await widget.notificationSettings.loadSavedSettings();
    _rangeController.text = widget.notificationSettings.range.inDays.toString();
    _earlyController.text =
        widget.notificationSettings.early.inMinutes.toString();
  }
}
