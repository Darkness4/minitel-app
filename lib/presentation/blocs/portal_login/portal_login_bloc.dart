import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

part 'portal_login_event.dart';
part 'portal_login_state.dart';

class PortalLoginBloc extends Bloc<PortalLoginEvent, PortalLoginState> {
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;
  final ICalendarRepository iCalendarRepository;
  final ImprimanteRemoteDataSource imprimanteRemoteDataSource;
  final PortailEMSERemoteDataSource portailEMSERemoteDataSource;

  PortalLoginBloc({
    @required this.stormshieldRemoteDataSource,
    @required this.iCalendarRepository,
    @required this.imprimanteRemoteDataSource,
    @required this.portailEMSERemoteDataSource,
  });

  @override
  PortalLoginState get initialState => PortalLoginState.empty();

  @override
  Stream<PortalLoginState> mapEventToState(
    PortalLoginEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield PortalLoginState.loading();
      try {
        // First
        final responseStormshield = stormshieldRemoteDataSource.login(
          uid: event.uid,
          pswd: event.pswd,
          selectedUrl: event.selectedUrl,
          selectedTime: LoginConstants.timeMap[event.selectedTime],
        );

        final responseICalendar = iCalendarRepository.download(
          username: event.uid,
          password: event.pswd,
        );

        final responsePortailEMSE = portailEMSERemoteDataSource.login(
          username: event.uid,
          password: event.pswd,
        );

        final responseImprimante = imprimanteRemoteDataSource.login(
          username: event.uid,
          password: event.pswd,
        );

        await Future.wait([
          responseStormshield,
          responseICalendar,
          responsePortailEMSE,
          responseImprimante,
        ]).timeout(const Duration(seconds: 5),
            onTimeout: () => throw ClientException("Timed out"));
        yield PortalLoginState.success();
      } catch (e) {
        yield PortalLoginState.failure(e.toString());
        yield PortalLoginState.empty();
      }
    }
  }
}