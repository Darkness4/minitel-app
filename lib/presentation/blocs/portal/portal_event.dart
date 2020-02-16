part of 'portal_bloc.dart';

abstract class PortalEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class RememberLoginEvent extends PortalEvent {
  final String uid;
  final String pswd;
  final String selectedUrl;
  final String selectedTime;
  final bool rememberMe;
  final bool autoLogin;

  RememberLoginEvent({
    @required this.uid,
    @required this.pswd,
    @required this.selectedUrl,
    @required this.selectedTime,
    @required this.rememberMe,
    @required this.autoLogin,
  });

  @override
  List<Object> get props => [
        this.uid,
        this.pswd,
        this.selectedUrl,
        this.selectedTime,
        this.rememberMe,
        this.autoLogin,
      ];

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

class AutoLoginEvent extends PortalEvent {}

class PswdChanged extends PortalEvent {
  final String pswd;

  PswdChanged({@required this.pswd});

  @override
  List<Object> get props => [pswd];
}

class UidChanged extends PortalEvent {
  final String uid;

  UidChanged({@required this.uid});

  @override
  List<Object> get props => [uid];
}

class SelectedUrlChanged extends PortalEvent {
  final String selectedUrl;

  SelectedUrlChanged({@required this.selectedUrl});

  @override
  List<Object> get props => [selectedUrl];
}

class SelectedTimeChanged extends PortalEvent {
  final String selectedTime;

  SelectedTimeChanged({@required this.selectedTime});

  @override
  List<Object> get props => [selectedTime];
}

class RememberMeChanged extends PortalEvent {
  final bool rememberMe;

  RememberMeChanged({@required this.rememberMe});

  @override
  List<Object> get props => [rememberMe];
}

class AutoLoginChanged extends PortalEvent {
  final bool autoLogin;

  AutoLoginChanged({@required this.autoLogin});

  @override
  List<Object> get props => [autoLogin];
}
