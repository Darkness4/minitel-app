import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/notification_settings/notification_settings_bloc.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationSettingsBloc>(
      create: (context) =>
          sl<NotificationSettingsBloc>()..add(const NotificationSettingsLoad()),
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
  final TextEditingController _rangeController = TextEditingController();
  final TextEditingController _earlyController = TextEditingController();
  NotificationSettingsBloc _notificationSettingsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLoc.of(context).agenda.notificationSettings.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            BlocConsumer<NotificationSettingsBloc, NotificationSettingsState>(
          listener: (context, state) {
            if (state.isSaved) {
              Scaffold.of(context).showSnackBar(const SnackBar(
                content: Text("Data saved."),
              ));
            } else if (state.isLoaded) {
              _rangeController.text =
                  state.notificationSettings.range.inDays.toString();
              _earlyController.text =
                  state.notificationSettings.early.inMinutes.toString();
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          LengthLimitingTextInputFormatter(3),
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
    _rangeController.dispose();
    _earlyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _notificationSettingsBloc = context.bloc<NotificationSettingsBloc>();

    _rangeController.addListener(_onRangeChanged);
    _earlyController.addListener(_onEarlyChanged);
  }

  void _onEarlyChanged() {
    if (_earlyController.text.length < 3 && _earlyController.text != "") {
      _notificationSettingsBloc.add(
          EarlyChanged(Duration(minutes: int.parse(_earlyController.text))));
    } else {
      print("_earlyController.text.length: Illegal range or character");
    }
  }

  void _onRangeChanged() {
    if (_rangeController.text.length < 4 && _rangeController.text != "") {
      _notificationSettingsBloc
          .add(RangeChanged(Duration(days: int.parse(_rangeController.text))));
    } else {
      print("_rangeController.text.length: Illegal range  or character");
    }
  }

  void _onEnablingChanged(bool value) {
    _notificationSettingsBloc.add(EnablingChanged(value));
  }

  void _onSave() {
    _notificationSettingsBloc.add(SaveNotificationSettings(
        _notificationSettingsBloc.state.notificationSettings));
  }
}
