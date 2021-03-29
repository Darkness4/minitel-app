import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:minitel_toolbox/domain/usecases/login_to_portail_emse.dart';
import 'package:minitel_toolbox/domain/usecases/login_to_printer.dart';
import 'package:minitel_toolbox/domain/usecases/login_to_stormshield.dart';

part 'portal_login_cubit.freezed.dart';
part 'portal_login_state.dart';

@injectable
class PortalLoginCubit extends Cubit<PortalLoginState> {
  final LoginToStormshield loginToStormshield;
  final ICalendarRepository iCalendarRepository;
  final LoginToPrinter loginToPrinter;
  final LoginToPortailEmse loginToPortailEmse;

  PortalLoginCubit({
    required this.loginToStormshield,
    required this.iCalendarRepository,
    required this.loginToPrinter,
    required this.loginToPortailEmse,
  }) : super(PortalLoginState.empty());

  Future<void> login({
    required String uid,
    required String pswd,
    required String selectedUrl,
    required String selectedTime,
  }) async {
    emit(PortalLoginState.loading());
    try {
      // First
      final responseStormshield = loginToStormshield(
        uid: uid,
        pswd: pswd,
        selectedUrl: selectedUrl,
        selectedTime: LoginConstants.timeMap[selectedTime]!,
      );

      final responseICalendar = iCalendarRepository.download(
        username: uid,
        password: pswd,
      );

      final responsePortailEMSE = loginToPortailEmse(
        username: uid,
        password: pswd,
      );

      final responseImprimante = loginToPrinter(
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
