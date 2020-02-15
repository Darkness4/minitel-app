import 'package:equatable/equatable.dart';

class LoginSettings extends Equatable {
  final bool rememberMe;
  final bool autoLogin;
  final String uid;
  final String selectedTime;
  final String selectedUrl;
  final String pswd;

  const LoginSettings({
    this.rememberMe,
    this.autoLogin,
    this.uid,
    this.selectedTime,
    this.selectedUrl,
    this.pswd,
  });

  @override
  List<Object> get props => [
        this.rememberMe,
        this.autoLogin,
        this.uid,
        this.selectedTime,
        this.selectedUrl,
        this.pswd,
      ];
}
