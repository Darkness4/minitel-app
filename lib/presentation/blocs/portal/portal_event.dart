part of 'portal_bloc.dart';

@freezed
abstract class PortalEvent with _$PortalEvent {
  const factory PortalEvent.rememberLogin({
    @required String uid,
    @required String pswd,
    @required String selectedUrl,
    @required String selectedTime,
    @required bool rememberMe,
    @required bool autoLogin,
  }) = RememberLoginEvent;
  const factory PortalEvent.autoLogin() = AutoLogin;
  const factory PortalEvent.pswdChanged(String pswd) = PswdChanged;
  const factory PortalEvent.uidChanged(String uid) = UidChanged;
  const factory PortalEvent.selectedUrlChanged(String selectedUrl) =
      SelectedUrlChanged;
  const factory PortalEvent.selectedTimeChanged(String selectedTime) =
      SelectedTimeChanged;
  const factory PortalEvent.rememberMeChanged(bool rememberMe) =
      RememberMeChanged;
  const factory PortalEvent.autoLoginChanged(bool autoLogin) = AutoLoginChanged;
}

extension RememberLoginEventX on RememberLoginEvent {
  LoginSettings toLoginSettings() {
    return LoginSettings(
      autoLogin: this.autoLogin,
      pswd: this.pswd,
      rememberMe: this.rememberMe,
      selectedTime: this.selectedTime,
      selectedUrl: this.selectedUrl,
      uid: this.uid,
    );
  }
}
