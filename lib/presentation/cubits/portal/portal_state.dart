part of 'portal_cubit.dart';

@freezed
abstract class PortalState with _$PortalState {
  const factory PortalState({
    @required bool rememberMe,
    @required bool autoLogin,
    @nullable @required String uid,
    @required String selectedTime,
    @required String selectedUrl,
    @nullable @required String pswd,
    @required bool isValidUid,
    @required bool isLoaded,
    @required bool isLoading,
    @required bool isError,
    @required bool hasAutoLogged,
  }) = _PortalState;

  factory PortalState.initial() {
    return const PortalState(
      rememberMe: false,
      autoLogin: false,
      uid: '',
      selectedTime: '4 hours',
      selectedUrl: MyIPAdresses.stormshieldIP,
      pswd: '',
      isError: false,
      isLoading: false,
      isLoaded: false,
      isValidUid: false,
      hasAutoLogged: false,
    );
  }
}

extension PortalStateX on PortalState {
  PortalState failure() {
    return copyWith(
      rememberMe: false,
      autoLogin: false,
      uid: '',
      selectedTime: '4 hours',
      selectedUrl: MyIPAdresses.stormshieldIP,
      pswd: '',
      isError: true,
      isLoading: false,
      isLoaded: true,
      isValidUid: false,
    );
  }

  PortalState loading() {
    return copyWith(
      rememberMe: false,
      autoLogin: false,
      uid: '',
      selectedTime: '4 hours',
      selectedUrl: MyIPAdresses.stormshieldIP,
      pswd: '',
      isError: false,
      isLoading: true,
      isLoaded: false,
      isValidUid: true,
    );
  }

  PortalState update({
    bool rememberMe,
    bool autoLogin,
    String uid,
    String selectedTime,
    String selectedUrl,
    String pswd,
    bool isLoaded,
    bool isValidUid,
    bool hasAutoLogged,
  }) {
    return copyWith(
      rememberMe: rememberMe ?? this.rememberMe,
      autoLogin: autoLogin ?? this.autoLogin,
      uid: uid ?? this.uid,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedUrl: selectedUrl ?? this.selectedUrl,
      pswd: pswd ?? this.pswd,
      isError: false,
      isLoading: false,
      isLoaded: isLoaded ?? this.isLoaded,
      isValidUid: isValidUid ?? this.isValidUid,
      hasAutoLogged: hasAutoLogged ?? this.hasAutoLogged,
    );
  }
}
