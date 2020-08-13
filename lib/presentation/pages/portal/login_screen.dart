import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/calendar_status/calendar_status_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/portail_emse_status/portail_emse_status_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/portal_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart';
import 'package:minitel_toolbox/presentation/pages/portal/login_widgets/portal_status_card.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

class LoginScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginScreen({@required this.formKey, Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _AutoLoginSelectorWidget extends StatelessWidget {
  const _AutoLoginSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(AppLoc.of(context).portal.autoLogin),
        BlocBuilder<PortalCubit, PortalState>(
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
      context.bloc<PortalCubit>().rememberMeChanged(true);
    }
    context.bloc<PortalCubit>().autoLoginChanged(autoLogin);
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _uidController;
  TextEditingController _pswdController;
  FocusScopeNode formFocusScopeNode;

  PortalCubit _portalCubit;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final portalState = _portalCubit.state;
        context.bloc<ImprimanteStatusCubit>().refresh();
        context.bloc<PortailEmseStatusCubit>().refresh();

        return Future.wait([
          context
              .bloc<StormshieldStatusCubit>()
              .refresh(portalState.selectedUrl),
          context.bloc<CalendarStatusCubit>().refresh(),
        ]);
      },
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
                  const _UrlSelectorWidget(),
                  const _TimeSelectorWidget(),
                  Form(
                    key: widget.formKey,
                    child: FocusScope(
                      node: formFocusScopeNode,
                      child: BlocListener<PortalCubit, PortalState>(
                        listener: (context, state) {
                          if (state.isLoaded &&
                              (_uidController.text == null ||
                                  (_uidController.text != null &&
                                      _uidController.text.isEmpty))) {
                            _uidController.text = _portalCubit.state.uid;
                            _pswdController.text = _portalCubit.state.pswd;
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
                  const _RememberMeSelectorWidget(),
                  const _AutoLoginSelectorWidget(),
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
    formFocusScopeNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _portalCubit = context.bloc<PortalCubit>();

    // Remember credentials
    _portalCubit.loadSettings();

    _uidController = TextEditingController();
    _pswdController = TextEditingController();
    formFocusScopeNode = FocusScopeNode();

    _uidController.addListener(_onUidChanged);
    _pswdController.addListener(_onPswdChanged);
  }

  void _onPswdChanged() {
    _portalCubit.pswdChanged(_pswdController.text);
  }

  void _onUidChanged() {
    _portalCubit.uidChanged(_uidController.text);
  }
}

class _RememberMeSelectorWidget extends StatelessWidget {
  const _RememberMeSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(AppLoc.of(context).portal.rememberMe),
        BlocBuilder<PortalCubit, PortalState>(
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
      context.bloc<PortalCubit>().autoLoginChanged(false);
    }
    context.bloc<PortalCubit>().rememberMeChanged(rememberMe);
  }
}

class _TimeSelectorWidget extends StatelessWidget {
  const _TimeSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: <Widget>[
          Text(AppLoc.of(context).portal.authTime),
          BlocBuilder<PortalCubit, PortalState>(
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
    context.bloc<PortalCubit>().selectedTimeChanged(selectedTime);
  }
}

class _UrlSelectorWidget extends StatelessWidget {
  const _UrlSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: <Widget>[
          Text(AppLoc.of(context).portal.domainNameHeader),
          BlocBuilder<PortalCubit, PortalState>(builder: (context, state) {
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
    context.bloc<PortalCubit>().selectedUrlChanged(selectedUrl);
  }
}
