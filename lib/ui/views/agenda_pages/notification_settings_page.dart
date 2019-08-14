import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minitel_toolbox/core/models/notifications.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres de notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Notifier "),
                Expanded(
                  child: TextField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                      BlacklistingTextInputFormatter.singleLineFormatter,
                    ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: _earlyController,
                  ),
                ),
                Text(" minutes avant le cours."),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Notifier les cours des "),
                Expanded(
                  child: TextField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                      BlacklistingTextInputFormatter.singleLineFormatter,
                    ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: _rangeController,
                  ),
                ),
                Text(" prochains jours."),
              ],
            ),
            Builder(
              builder: (context) => RaisedButton(
                color: MinitelColors.PrimaryColor,
                textColor: Colors.white,
                child: Text("Sauvegarder"),
                onPressed: () async {
                  widget.notificationSettings.early =
                      Duration(minutes: int.parse(_earlyController.text));
                  widget.notificationSettings.range =
                      Duration(days: int.parse(_rangeController.text));
                  await widget.notificationSettings.saveSettings();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Success."),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
