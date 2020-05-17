part of 'portal_login_bloc.dart';

@freezed
abstract class PortalLoginEvent with _$PortalLoginEvent {
  const factory PortalLoginEvent.login({
    @required String uid,
    @required String pswd,
    @required String selectedUrl,
    @required String selectedTime,
  }) = LoginEvent;
}
