import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portal_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_status/portal_status_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/cards/portal_status_card.dart';

class LoginScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginScreen({@required this.formKey, Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final FocusScopeNode formFocusScopeNode = FocusScopeNode();

  PortalBloc _portalBloc;
  PortalStatusBloc _portalStatusBloc;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          _portalStatusBloc.add(RefreshEvent(_portalBloc.state.selectedUrl)),
      child: ListView(
        key: const Key(Keys.loginList),
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const StatusCard(),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const UrlSelectorWidget(),
                  const TimeSelectorWidget(),
                  Form(
                    key: widget.formKey,
                    child: FocusScope(
                      node: formFocusScopeNode,
                      child: BlocListener<PortalBloc, PortalState>(
                        listener: (context, state) {
                          if (state.isLoaded) {
                            _uidController.text = _portalBloc.state.uid;
                            _pswdController.text = _portalBloc.state.pswd;
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                key: const Key(Keys.uidLoginTextField),
                                controller: _uidController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  hintText:
                                      AppLoc.of(context).portal.usernameHint,
                                  labelText:
                                      AppLoc.of(context).portal.usernameLabel,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return AppLoc.of(context)
                                        .reporting
                                        .notEmpty;
                                  } else if (value.isNotValidEmseUsername) {
                                    return AppLoc.of(context)
                                        .reporting
                                        .isNotValidUid;
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (_) {
                                  formFocusScopeNode.nextFocus();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                key: const Key(Keys.pswdLoginTextField),
                                controller: _pswdController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  labelText: AppLoc.of(context).portal.password,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return AppLoc.of(context)
                                        .reporting
                                        .notEmpty;
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (String value) {
                                  formFocusScopeNode.unfocus();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const RememberMeSelectorWidget(),
                  const AutoLoginSelectorWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _uidController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _portalBloc = context.bloc<PortalBloc>();
    _portalStatusBloc = context.bloc<PortalStatusBloc>();

    // Remember credentials
    _portalBloc.add(AutoLoginEvent());

    _uidController.addListener(_onUidChanged);
    _pswdController.addListener(_onPswdChanged);
  }

  void _onPswdChanged() {
    _portalBloc.add(
      PswdChanged(pswd: _pswdController.text),
    );
  }

  void _onUidChanged() {
    _portalBloc.add(
      UidChanged(uid: _uidController.text),
    );
  }
}

class UrlSelectorWidget extends StatelessWidget {
  const UrlSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: <Widget>[
          Text(AppLoc.of(context).portal.domainNameHeader),
          BlocBuilder<PortalBloc, PortalState>(builder: (context, state) {
            return DropdownButton<String>(
              key: const Key(Keys.nameServerDropdown),
              value: state.selectedUrl,
              items: <DropdownMenuItem<String>>[
                for (String value in LoginConstants.urlRootList)
                  DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  )
              ],
              onChanged: (selectedUrl) =>
                  _onSelectedUrlChanged(context, selectedUrl),
            );
          })
        ],
      ),
    );
  }

  void _onSelectedUrlChanged(BuildContext context, String selectedUrl) {
    context
        .bloc<PortalBloc>()
        .add(SelectedUrlChanged(selectedUrl: selectedUrl));
  }
}

class TimeSelectorWidget extends StatelessWidget {
  const TimeSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: <Widget>[
          Text(AppLoc.of(context).portal.authTime),
          BlocBuilder<PortalBloc, PortalState>(
            builder: (context, state) {
              return DropdownButton<String>(
                key: const Key(Keys.timeDropdown),
                value: state.selectedTime,
                items: <DropdownMenuItem<String>>[
                  for (String value in LoginConstants.timeMap.keys)
                    DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                ],
                onChanged: (selectedTime) =>
                    _onSelectedTimeChanged(context, selectedTime),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onSelectedTimeChanged(BuildContext context, String selectedTime) {
    context
        .bloc<PortalBloc>()
        .add(SelectedTimeChanged(selectedTime: selectedTime));
  }
}

class RememberMeSelectorWidget extends StatelessWidget {
  const RememberMeSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(AppLoc.of(context).portal.rememberMe),
        BlocBuilder<PortalBloc, PortalState>(
          builder: (context, state) {
            return Checkbox(
              key: const Key(Keys.rememberMeButton),
              value: state.rememberMe,
              onChanged: (rememberMe) =>
                  _onRememberMeChanged(context, rememberMe),
            );
          },
        ),
      ],
    );
  }

  void _onRememberMeChanged(BuildContext context, bool rememberMe) {
    if (!rememberMe) {
      context.bloc<PortalBloc>().add(AutoLoginChanged(autoLogin: false));
    }
    context.bloc<PortalBloc>().add(RememberMeChanged(rememberMe: rememberMe));
  }
}

class AutoLoginSelectorWidget extends StatelessWidget {
  const AutoLoginSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(AppLoc.of(context).portal.autoLogin),
        BlocBuilder<PortalBloc, PortalState>(
          builder: (context, state) {
            return Checkbox(
              key: const Key(Keys.autoLoginButton),
              value: state.autoLogin,
              onChanged: (autoLogin) => _onAutoLoginChanged(context, autoLogin),
            );
          },
        ),
      ],
    );
  }

  void _onAutoLoginChanged(BuildContext context, bool autoLogin) {
    if (autoLogin) {
      context.bloc<PortalBloc>().add(RememberMeChanged(rememberMe: true));
    }
    context.bloc<PortalBloc>().add(AutoLoginChanged(autoLogin: autoLogin));
  }
}