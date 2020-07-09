import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/calendar_status/calendar_status_cubit.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/imprimante_status/imprimante_status_cubit.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portail_emse_status/portail_emse_status_cubit.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/portal_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/stormshield_status/stormshield_status_cubit.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_login/portal_login_bloc.dart';
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
                      context.cubit<ImprimanteStatusCubit>().refresh();
                      context.cubit<PortailEmseStatusCubit>().refresh();
                      context.cubit<CalendarStatusCubit>().refresh();
                      context
                          .cubit<StormshieldStatusCubit>()
                          .refresh(state.selectedUrl);
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
          floatingActionButton: BlocBuilder<PortalLoginBloc, PortalLoginState>(
            builder: (BuildContext context, PortalLoginState state) {
              if (state.isSubmitting) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton.extended(
                  key: const Key(Keys.loginButton),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      final portalState = context.bloc<PortalBloc>().state;
                      if (portalState.isValidUid) {
                        context.bloc<PortalLoginBloc>().add(LoginEvent(
                              pswd: portalState.pswd,
                              selectedTime: portalState.selectedTime,
                              selectedUrl: portalState.selectedUrl,
                              uid: portalState.uid,
                            ));
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

  void _onPortalLoginFailure(BuildContext context, PortalLoginState state) {
    final portalBlocState = context.bloc<PortalBloc>().state;

    final selectedUrl = portalBlocState.selectedUrl;
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

  void _onPortalLoginSuccess(BuildContext context) {
    final portalBlocState = context.bloc<PortalBloc>().state;

    final selectedUrl = portalBlocState.selectedUrl;
    context.cubit<ImprimanteStatusCubit>().refresh();
    context.cubit<StormshieldStatusCubit>().refresh(selectedUrl);
    context.cubit<CalendarStatusCubit>().refresh();
    context.cubit<PortailEmseStatusCubit>().refresh();
  }
}
