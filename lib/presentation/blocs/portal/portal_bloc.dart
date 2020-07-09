import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';
import 'package:minitel_toolbox/domain/repositories/login_settings_repository.dart';
import 'package:rxdart/rxdart.dart' show DebounceExtensions, MergeExtension;

part 'portal_bloc.freezed.dart';
part 'portal_event.dart';
part 'portal_state.dart';

@injectable
class PortalBloc extends Bloc<PortalEvent, PortalState> {
  final LoginSettingsRepository loginSetingsRepository;

  PortalBloc({
    @required this.loginSetingsRepository,
  })  : assert(loginSetingsRepository != null),
        super(PortalState.initial());

  @override
  Stream<PortalState> mapEventToState(
    PortalEvent event,
  ) {
    return event.map(
      rememberLogin: _mapRememberLoginEventToState,
      autoLogin: _mapAutoLoginEventToState,
      pswdChanged: _mapPswdChangedEventToState,
      uidChanged: _mapUidChangedEventToState,
      selectedUrlChanged: _mapSelectedUrlChangedEventToState,
      selectedTimeChanged: _mapSelectedTimeChangedEventToState,
      rememberMeChanged: _mapRememberMeChangedEventToState,
      autoLoginChanged: _mapAutoLoginChangedEventToState,
    );
  }

  @override
  Stream<Transition<PortalEvent, PortalState>> transformEvents(
    Stream<PortalEvent> events,
    Stream<Transition<PortalEvent, PortalState>> Function(PortalEvent)
        transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return event is! UidChanged && event is! PswdChanged;
    });
    final debounceStream = events.where((event) {
      return event is UidChanged || event is PswdChanged;
    }).debounceTime(const Duration(milliseconds: 100));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  Stream<PortalState> _mapAutoLoginChangedEventToState(
      AutoLoginChanged event) async* {
    yield state.update(autoLogin: event.autoLogin);
  }

  /// Load settings
  Stream<PortalState> _mapAutoLoginEventToState(AutoLogin event) async* {
    yield PortalState.loading();

    try {
      final settings = await loginSetingsRepository.load();

      if (settings.rememberMe ?? false) {
        yield state.update(
          rememberMe: settings.rememberMe,
          autoLogin: settings.autoLogin,
          uid: settings.uid,
          selectedTime: settings.selectedTime,
          selectedUrl: settings.selectedUrl,
          pswd: settings.pswd,
          isLoaded: true,
        );
      } else {
        yield state.update(isLoaded: true);
      }
    } catch (e) {
      yield PortalState.failure();
      yield state.update(isLoaded: true);
    }
  }

  Stream<PortalState> _mapPswdChangedEventToState(PswdChanged event) async* {
    yield state.update(pswd: event.pswd);
  }

  /// Save settings
  Stream<PortalState> _mapRememberLoginEventToState(
      RememberLoginEvent event) async* {
    if (event.rememberMe) {
      await loginSetingsRepository.save(event.toLoginSettings());
      yield state;
    } else {
      await loginSetingsRepository.clear();
      yield state;
    }
  }

  Stream<PortalState> _mapRememberMeChangedEventToState(
      RememberMeChanged event) async* {
    yield state.update(rememberMe: event.rememberMe);
  }

  Stream<PortalState> _mapSelectedTimeChangedEventToState(
      SelectedTimeChanged event) async* {
    yield state.update(selectedTime: event.selectedTime);
  }

  Stream<PortalState> _mapSelectedUrlChangedEventToState(
      SelectedUrlChanged event) async* {
    yield state.update(selectedUrl: event.selectedUrl);
  }

  Stream<PortalState> _mapUidChangedEventToState(UidChanged event) async* {
    yield state.update(
      uid: event.uid,
      isValidUid: event.uid.isValidEmseUsername,
    );
  }
}
