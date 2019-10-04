import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/viewmodels/views/agenda_view_model.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';

class ErrorAgendaWidget extends StatefulWidget {
  final String error;
  final AgendaViewModel model;

  const ErrorAgendaWidget(this.error, {@required this.model});

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
              widget.error,
              style: MinitelTextStyles.error,
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
                        key: const Key('agenda_view/uid'),
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
                        key: const Key('agenda_view/pswd'),
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
            key: const Key('agenda_view/connect'),
            backgroundColor: Colors.red,
            elevation: 10.0,
            onPressed: () => widget.model.login(
              context,
              _uidController.text,
              _pswdController.text,
              _formKey.currentState,
            ),
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
