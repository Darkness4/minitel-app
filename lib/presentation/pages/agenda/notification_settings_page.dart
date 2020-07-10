import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/cubits/news/notification_settings/notification_settings_cubit.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CubitProvider<NotificationSettingsCubit>(
      create: (context) =>
          sl<NotificationSettingsCubit>()..notificationSettingsLoad(),
      child: const NotificationSettingsScreen(),
    );
  }
}

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key key}) : super(key: key);

  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  TextEditingController _rangeTextController;
  TextEditingController _earlyTextController;
  NotificationSettingsCubit _notificationSettingsCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLoc.of(context).agenda.notificationSettings.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            CubitConsumer<NotificationSettingsCubit, NotificationSettingsState>(
          listener: (context, state) {
            if (state.isSaved) {
              Scaffold.of(context).showSnackBar(const SnackBar(
                content: Text('Data saved.'),
              ));
            } else if (state.isLoaded) {
              _rangeTextController.text =
                  state.notificationSettings.range.inDays.toString();
              _earlyTextController.text =
                  state.notificationSettings.early.inMinutes.toString();
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(AppLoc.of(context)
                        .agenda
                        .notificationSettings
                        .enabled1),
                    Switch(
                      value: state.notificationSettings.enabled,
                      onChanged: _onEnablingChanged,
                    ),
                    Text(AppLoc.of(context)
                        .agenda
                        .notificationSettings
                        .enabled2(state.notificationSettings.enabled)),
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
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: _earlyTextController,
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
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: _rangeTextController,
                      ),
                    ),
                    Text(AppLoc.of(context).agenda.notificationSettings.range2),
                  ],
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  colorBrightness: Brightness.dark,
                  onPressed: _onSave,
                  child:
                      Text(AppLoc.of(context).agenda.notificationSettings.save),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rangeTextController.dispose();
    _earlyTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _notificationSettingsCubit = context.cubit<NotificationSettingsCubit>();

    _rangeTextController = TextEditingController();
    _earlyTextController = TextEditingController();

    _rangeTextController.addListener(_onRangeChanged);
    _earlyTextController.addListener(_onEarlyChanged);
  }

  void _onEarlyChanged() {
    if (_earlyTextController.text.length < 3 &&
        _earlyTextController.text != '') {
      _notificationSettingsCubit.earlyChanged(
          Duration(minutes: int.parse(_earlyTextController.text)));
    }
  }

  void _onRangeChanged() {
    if (_rangeTextController.text.length < 4 &&
        _rangeTextController.text != '') {
      _notificationSettingsCubit
          .rangeChanged(Duration(days: int.parse(_rangeTextController.text)));
    }
  }

  void _onEnablingChanged(bool value) {
    _notificationSettingsCubit.enablingChanged(value);
  }

  void _onSave() {
    _notificationSettingsCubit.saveNotificationSettings(
        _notificationSettingsCubit.state.notificationSettings);
  }
}
