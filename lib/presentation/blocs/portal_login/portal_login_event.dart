part of 'portal_login_bloc.dart';

class LoginEvent extends PortalLoginEvent {
  final String uid;
  final String pswd;
  final String selectedUrl;
  final String selectedTime;

  const LoginEvent({
    @required this.uid,
    @required this.pswd,
    @required this.selectedUrl,
    @required this.selectedTime,
  });

  @override
  List<Object> get props => [
        this.uid,
        this.pswd,
        this.selectedUrl,
        this.selectedTime,
      ];
}

@immutable
abstract class PortalLoginEvent extends Equatable {
  const PortalLoginEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
