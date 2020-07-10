import 'dart:async';

import 'package:cubit/cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';
import 'package:minitel_toolbox/domain/repositories/login_settings_repository.dart';

part 'portal_cubit.freezed.dart';
part 'portal_state.dart';

@injectable
class PortalCubit extends Cubit<PortalState> {
  final LoginSettingsRepository loginSetingsRepository;

  PortalCubit({
    @required this.loginSetingsRepository,
  })  : assert(loginSetingsRepository != null),
        super(PortalState.initial());

  void autoLoginChanged(bool autoLogin) {
    emit(state.update(autoLogin: autoLogin));
  }

  /// Load settings
  Future<void> autoLogin() async {
    emit(PortalState.loading());

    try {
      final settings = await loginSetingsRepository.load();

      if (settings.rememberMe ?? false) {
        emit(state.update(
          rememberMe: settings.rememberMe,
          autoLogin: settings.autoLogin,
          uid: settings.uid,
          selectedTime: settings.selectedTime,
          selectedUrl: settings.selectedUrl,
          pswd: settings.pswd,
          isLoaded: true,
        ));
      } else {
        emit(state.update(isLoaded: true));
      }
    } catch (e) {
      emit(PortalState.failure());
      emit(state.update(isLoaded: true));
    }
  }

  void pswdChanged(String pswd) {
    emit(state.update(pswd: pswd));
  }

  /// Save settings
  Future<void> rememberLogin({
    @required String uid,
    @required String pswd,
    @required String selectedUrl,
    @required String selectedTime,
    @required bool rememberMe,
    @required bool autoLogin,
  }) async {
    if (rememberMe) {
      await loginSetingsRepository.save(LoginSettings(
        autoLogin: autoLogin,
        pswd: pswd,
        rememberMe: rememberMe,
        selectedTime: selectedTime,
        selectedUrl: selectedUrl,
        uid: uid,
      ));
      emit(state);
    } else {
      await loginSetingsRepository.clear();
      emit(state);
    }
  }

  void rememberMeChanged(bool rememberMe) {
    emit(state.update(rememberMe: rememberMe));
  }

  void selectedTimeChanged(String selectedTime) {
    emit(state.update(selectedTime: selectedTime));
  }

  void selectedUrlChanged(String selectedUrl) {
    emit(state.update(selectedUrl: selectedUrl));
  }

  void uidChanged(String uid) {
    emit(state.update(
      uid: uid,
      isValidUid: uid.isValidEmseUsername,
    ));
  }
}
