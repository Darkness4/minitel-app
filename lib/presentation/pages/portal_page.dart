import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
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

class PortalPage extends StatelessWidget {
  final String title;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PortalPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MultiCubitProvider(
        providers: [
          CubitProvider<PortalLoginCubit>(
            create: (_) => sl<PortalLoginCubit>(),
          ),
          CubitProvider<PortalCubit>(
            create: (_) => sl<PortalCubit>()..autoLogin(),
          ),
          CubitProvider<StormshieldStatusCubit>(
            create: (_) => sl<StormshieldStatusCubit>(),
          ),
          CubitProvider<ImprimanteStatusCubit>(
            create: (_) => sl<ImprimanteStatusCubit>(),
          ),
          CubitProvider<CalendarStatusCubit>(
            create: (_) => sl<CalendarStatusCubit>(),
          ),
          CubitProvider<PortailEmseStatusCubit>(
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
            child: MultiCubitListener(
              listeners: [
                CubitListener<PortalLoginCubit, PortalLoginState>(
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
                CubitListener<PortalCubit, PortalState>(
                  listenWhen: (previous, current) {
                    return previous != current;
                  },
                  listener: (context, state) {
                    if (state.autoLogin && state.isLoaded) {
                      _onAutoLogin(context, state);
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
                    title: Text(title),
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
          floatingActionButton:
              CubitBuilder<PortalLoginCubit, PortalLoginState>(
            builder: (BuildContext context, PortalLoginState state) {
              if (state.isSubmitting) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton.extended(
                  key: const Key(Keys.loginButton),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      final portalState = context.cubit<PortalCubit>().state;
                      if (portalState.isValidUid) {
                        context.cubit<PortalLoginCubit>().login(
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

  void _onAutoLogin(BuildContext context, PortalState state) {
    context.cubit<PortalLoginCubit>().login(
          uid: state.uid,
          pswd: state.pswd,
          selectedUrl: state.selectedUrl,
          selectedTime: state.selectedTime,
        );
  }

  void _onPortalLoginFailure(BuildContext context, PortalLoginState state) {
    final portalState = context.cubit<PortalCubit>().state;

    final selectedUrl = portalState.selectedUrl;
    context.cubit<ImprimanteStatusCubit>().refresh();
    context.cubit<StormshieldStatusCubit>().refresh(selectedUrl);
    context.cubit<CalendarStatusCubit>().refresh();
    context.cubit<PortailEmseStatusCubit>().refresh();
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(state.error.toString())),
      );
  }

  void _onPortalLoginSubmit(BuildContext context) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Requested')),
      );

    final portalState = context.cubit<PortalCubit>().state;

    context.cubit<PortalCubit>().rememberLogin(
          autoLogin: portalState.autoLogin,
          pswd: portalState.pswd,
          rememberMe: portalState.rememberMe,
          selectedTime: portalState.selectedTime,
          selectedUrl: portalState.selectedUrl,
          uid: portalState.uid,
        );
  }

  void _onPortalLoginSuccess(BuildContext context) {
    final portalState = context.cubit<PortalCubit>().state;

    final selectedUrl = portalState.selectedUrl;
    context.cubit<ImprimanteStatusCubit>().refresh();
    context.cubit<StormshieldStatusCubit>().refresh(selectedUrl);
    context.cubit<CalendarStatusCubit>().refresh();
    context.cubit<PortailEmseStatusCubit>().refresh();
  }
}
