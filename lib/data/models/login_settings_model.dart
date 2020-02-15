import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';

class LoginSettingsModel extends LoginSettings {
  const LoginSettingsModel({
    bool rememberMe = false,
    bool autoLogin = false,
    String uid = '',
    String selectedTime = '4 hours',
    String selectedUrl = MyIPAdresses.stormshieldIP,
    String pswd = '',
  }) : super(
          rememberMe: rememberMe,
          autoLogin: autoLogin,
          uid: uid,
          selectedTime: selectedTime,
          selectedUrl: selectedUrl,
          pswd: pswd,
        );

  factory LoginSettingsModel.fromEntity(LoginSettings entity) {
    return LoginSettingsModel(
      autoLogin: entity.autoLogin,
      pswd: entity.pswd,
      rememberMe: entity.rememberMe,
      selectedTime: entity.selectedTime,
      selectedUrl: entity.selectedUrl,
      uid: entity.uid,
    );
  }
}
