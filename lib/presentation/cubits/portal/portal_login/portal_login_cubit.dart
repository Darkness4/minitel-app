import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

part 'portal_login_cubit.freezed.dart';
part 'portal_login_state.dart';

@injectable
class PortalLoginCubit extends Cubit<PortalLoginState> {
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;
  final ICalendarRepository iCalendarRepository;
  final ImprimanteRemoteDataSource imprimanteRemoteDataSource;
  final PortailEMSERemoteDataSource portailEMSERemoteDataSource;

  PortalLoginCubit({
    @required this.stormshieldRemoteDataSource,
    @required this.iCalendarRepository,
    @required this.imprimanteRemoteDataSource,
    @required this.portailEMSERemoteDataSource,
  })  : assert(stormshieldRemoteDataSource != null),
        assert(imprimanteRemoteDataSource != null),
        assert(portailEMSERemoteDataSource != null),
        assert(iCalendarRepository != null),
        super(PortalLoginState.empty());

  Future<void> login({
    @required String uid,
    @required String pswd,
    @required String selectedUrl,
    @required String selectedTime,
  }) async {
    emit(PortalLoginState.loading());
    try {
      // First
      final responseStormshield = stormshieldRemoteDataSource.login(
        uid: uid,
        pswd: pswd,
        selectedUrl: selectedUrl,
        selectedTime: LoginConstants.timeMap[selectedTime],
      );

      final responseICalendar = iCalendarRepository.download(
        username: uid,
        password: pswd,
      );

      final responsePortailEMSE = portailEMSERemoteDataSource.login(
        username: uid,
        password: pswd,
      );

      final responseImprimante = imprimanteRemoteDataSource.login(
        username: uid,
        password: pswd,
      );

      await Future.wait([
        responseStormshield,
        responseICalendar,
        responsePortailEMSE,
        responseImprimante,
      ]).timeout(const Duration(seconds: 5),
          onTimeout: () => throw ClientException('Timed out'));
      emit(PortalLoginState.success());
    } on Exception catch (e) {
      emit(PortalLoginState.failure(e));
      emit(PortalLoginState.empty());
    }
  }
}
