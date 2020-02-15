import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/presentation/blocs/agenda/agenda_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/notification_settings/notification_settings_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

class ErrorAgendaWidget extends StatefulWidget {
  final dynamic error;

  const ErrorAgendaWidget(this.error);

  @override
  _ErrorAgendaWidgetState createState() => _ErrorAgendaWidgetState();
}

class _ErrorAgendaWidgetState extends State<ErrorAgendaWidget> {
  final TextEditingController _uidController = TextEditingController();

  final TextEditingController _pswdController = TextEditingController();

  final FocusScopeNode _formNode = FocusScopeNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.error is FileSystemException
                  ? "File calendar.ics not found. Please log in."
                  : widget.error.toString(),
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: FocusScope(
                node: _formNode,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        key: const Key(Keys.agendaUid),
                        controller: _uidController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: AppLoc.of(context).portal.usernameHint,
                          labelText: AppLoc.of(context).portal.usernameLabel,
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLoc.of(context).reporting.notEmpty;
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          _formNode.nextFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        key: const Key(Keys.agendaPswd),
                        controller: _pswdController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key),
                          labelText: AppLoc.of(context).portal.password,
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLoc.of(context).reporting.notEmpty;
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          _formNode.unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton.extended(
            key: const Key(Keys.agendaConnect),
            backgroundColor: Colors.red,
            elevation: 10.0,
            onPressed: () {
              final notifState = context.bloc<NotificationSettingsBloc>().state;

              final notificationSettings = notifState.notificationSettings;

              context.bloc<AgendaBloc>().add(AgendaDownload(
                    uid: _uidController.text,
                    pswd: _pswdController.text,
                    notificationSettings: notificationSettings,
                  ));
            },
            label: Text(
              AppLoc.of(context).portal.login,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }
}
