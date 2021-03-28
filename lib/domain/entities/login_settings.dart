import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';

part 'login_settings.freezed.dart';

@freezed
class LoginSettings with _$LoginSettings {
  const factory LoginSettings({
    @Default(false) bool rememberMe,
    @Default(false) bool autoLogin,
    @Default('') String uid,
    @Default('4 hours') String selectedTime,
    @Default(MyIPAdresses.stormshieldIP) String selectedUrl,
    @Default('') String pswd,
  }) = _LoginSettings;
}
