import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portal_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_login/portal_login_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_status/portal_status_bloc.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PortalLoginBloc>(
            create: (_) => sl<PortalLoginBloc>(),
          ),
          BlocProvider<PortalBloc>(
            create: (_) => sl<PortalBloc>(),
          ),
          BlocProvider<PortalStatusBloc>(
            create: (_) => sl<PortalStatusBloc>(),
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
                BlocListener<PortalLoginBloc, PortalLoginState>(
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
                BlocListener<PortalBloc, PortalState>(
                  listener: (context, state) {
                    if (state.isLoaded) {
                      context
                          .bloc<PortalStatusBloc>()
                          .add(RefreshEvent(state.selectedUrl));
                    }
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
                          text: "Login",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.apps,
                            key: Key(Keys.appsTab),
                          ),
                          text: "Apps",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: const MainDrawer(
            currentRoutePaths: RoutePaths.Authentication,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<PortalLoginBloc, PortalLoginState>(
            builder: (BuildContext context, PortalLoginState state) {
              if (state.isSubmitting) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton.extended(
                  key: const Key(Keys.loginButton),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      context.bloc<PortalBloc>().state;
                      final portalState = context.bloc<PortalBloc>().state;
                      if (portalState.isValidUid) {
                        context.bloc<PortalLoginBloc>().add(LoginEvent(
                              pswd: portalState.pswd,
                              selectedTime: portalState.selectedTime,
                              selectedUrl: portalState.selectedUrl,
                              uid: portalState.uid,
                            ));
                      } else {
                        print(
                            "Uid seems not valid. Must contains '.' and not '@': ${portalState.uid}");
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
    context.bloc<PortalLoginBloc>().add(
          LoginEvent(
            uid: state.uid,
            pswd: state.pswd,
            selectedUrl: state.selectedUrl,
            selectedTime: state.selectedTime,
          ),
        );
  }

  void _onPortalLoginSubmit(BuildContext context) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Requested')),
      );

    final portalBlocState = context.bloc<PortalBloc>().state;

    context.bloc<PortalBloc>().add(RememberLoginEvent(
          autoLogin: portalBlocState.autoLogin,
          pswd: portalBlocState.pswd,
          rememberMe: portalBlocState.rememberMe,
          selectedTime: portalBlocState.selectedTime,
          selectedUrl: portalBlocState.selectedUrl,
          uid: portalBlocState.uid,
        ));
  }

  void _onPortalLoginFailure(BuildContext context, PortalLoginState state) {
    final portalBlocState = context.bloc<PortalBloc>().state;

    final selectedUrl = portalBlocState.selectedUrl;
    context.bloc<PortalStatusBloc>().add(RefreshEvent(selectedUrl));
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(state.error.toString())),
      );
  }

  void _onPortalLoginSuccess(BuildContext context) {
    final portalBlocState = context.bloc<PortalBloc>().state;

    final selectedUrl = portalBlocState.selectedUrl;
    context.bloc<PortalStatusBloc>().add(RefreshEvent(selectedUrl));
  }
}
