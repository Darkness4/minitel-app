import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/calendar_status/calendar_status_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/portail_emse_status/portail_emse_status_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/portal_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/portal_login/portal_login_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart';
import 'package:minitel_toolbox/presentation/pages/portal/apps_screen.dart';
import 'package:minitel_toolbox/presentation/pages/portal/login_screen.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/backgrounds.dart';
import 'package:minitel_toolbox/presentation/widgets/drawers/main_drawer.dart';

class PortalPage extends StatefulWidget {
  final String title;

  const PortalPage({Key? key, required this.title}) : super(key: key);

  @override
  _PortalPageState createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StreamSubscription<PortalState> _subscription;
  late PortalCubit _portalCubit;
  late PortalLoginCubit _portalLoginCubit;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PortalLoginCubit>(
            create: (_) => _portalLoginCubit,
          ),
          BlocProvider<PortalCubit>(
            create: (_) => _portalCubit,
          ),
          BlocProvider<StormshieldStatusCubit>(
            create: (_) => sl<StormshieldStatusCubit>(),
          ),
          BlocProvider<ImprimanteStatusCubit>(
            create: (_) => sl<ImprimanteStatusCubit>(),
          ),
          BlocProvider<CalendarStatusCubit>(
            create: (_) => sl<CalendarStatusCubit>(),
          ),
          BlocProvider<PortailEmseStatusCubit>(
            create: (_) => sl<PortailEmseStatusCubit>(),
          ),
        ],
        child: Scaffold(
          body: CustomPaint(
            painter: PortailBackgroundPainter(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              foregroundColor: Theme.of(context).accentColor,
            ),
            child: MultiBlocListener(
              listeners: [
                BlocListener<PortalLoginCubit, PortalLoginState>(
                  listenWhen: (previous, current) {
                    return previous != current;
                  },
                  listener: (context, state) {
                    if (state.isSubmitting) {
                      _onPortalLoginSubmit(context);
                    } else if (state.isFailure) {
                      _onPortalLoginFailure(context, state);
                    } else if (state.isSuccess) {
                      _onPortalLoginSuccess(context);
                    }
                  },
                ),
                BlocListener<PortalCubit, PortalState>(
                  listenWhen: (previous, current) {
                    return previous.isLoaded != current.isLoaded;
                  },
                  listener: (context, state) {
                    if (state.isLoaded) {
                      _onPortalLoaded(context);
                    }
                  },
                ),
              ],
              child: NestedScrollView(
                key: const Key(Keys.portalTabs),
                body: TabBarView(
                  children: <Widget>[
                    LoginScreen(formKey: formKey),
                    const AppsScreen(),
                  ],
                ),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                  SliverAppBar(
                    title: Text(widget.title),
                    pinned: true,
                    floating: true,
                    forceElevated: true,
                    bottom: const TabBar(
                      tabs: <Tab>[
                        Tab(
                          icon: Icon(
                            Icons.vpn_key,
                            key: Key(Keys.loginTab),
                          ),
                          text: 'Login',
                        ),
                        Tab(
                          icon: Icon(
                            Icons.apps,
                            key: Key(Keys.appsTab),
                          ),
                          text: 'Apps',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: const MainDrawer(
            currentRoutePaths: RoutePaths.authentication,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<PortalLoginCubit, PortalLoginState>(
            builder: (BuildContext context, PortalLoginState state) {
              if (state.isSubmitting) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton.extended(
                  key: const Key(Keys.loginButton),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final portalState = context.read<PortalCubit>().state;
                      if (portalState.isValidUid) {
                        context.read<PortalLoginCubit>().login(
                              pswd: portalState.pswd,
                              selectedTime: portalState.selectedTime,
                              selectedUrl: portalState.selectedUrl,
                              uid: portalState.uid,
                            );
                      }
                    }
                  },
                  label: Text(
                    AppLoc.of(context).portal.login,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _portalCubit = sl<PortalCubit>();
    _portalLoginCubit = sl<PortalLoginCubit>();

    _subscription = _portalCubit.stream.listen((state) {
      if (state.autoLogin && !state.hasAutoLogged) {
        _onAutoLogin(context, state);
        _portalCubit.autoLogged();
      }
    });

    _portalCubit.loadSettings();
    super.initState();
  }

  void _onAutoLogin(BuildContext context, PortalState state) {
    _portalLoginCubit.login(
      uid: state.uid,
      pswd: state.pswd,
      selectedUrl: state.selectedUrl,
      selectedTime: state.selectedTime,
    );
  }

  void _onPortalLoaded(BuildContext context) {
    final portalState = context.read<PortalCubit>().state;

    final selectedUrl = portalState.selectedUrl;
    context.read<ImprimanteStatusCubit>().refresh();
    context.read<StormshieldStatusCubit>().refresh(selectedUrl);
    context.read<CalendarStatusCubit>().refresh();
    context.read<PortailEmseStatusCubit>().refresh();
  }

  void _onPortalLoginFailure(BuildContext context, PortalLoginState state) {
    final portalState = context.read<PortalCubit>().state;

    final selectedUrl = portalState.selectedUrl;
    context.read<ImprimanteStatusCubit>().refresh();
    context.read<StormshieldStatusCubit>().refresh(selectedUrl);
    context.read<CalendarStatusCubit>().refresh();
    context.read<PortailEmseStatusCubit>().refresh();
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(state.error.toString())),
      );
  }

  void _onPortalLoginSubmit(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Requested')),
      );

    final portalState = context.read<PortalCubit>().state;

    context.read<PortalCubit>().rememberLogin(
          autoLogin: portalState.autoLogin,
          pswd: portalState.pswd,
          rememberMe: portalState.rememberMe,
          selectedTime: portalState.selectedTime,
          selectedUrl: portalState.selectedUrl,
          uid: portalState.uid,
        );
  }

  void _onPortalLoginSuccess(BuildContext context) {
    final portalState = context.read<PortalCubit>().state;

    final selectedUrl = portalState.selectedUrl;
    context.read<ImprimanteStatusCubit>().refresh();
    context.read<StormshieldStatusCubit>().refresh(selectedUrl);
    context.read<CalendarStatusCubit>().refresh();
    context.read<PortailEmseStatusCubit>().refresh();
  }
}
