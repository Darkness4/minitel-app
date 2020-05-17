import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';

part 'login_settings.freezed.dart';

@freezed
abstract class LoginSettings with _$LoginSettings {
  const factory LoginSettings({
    @Default(false) @nullable bool rememberMe,
    @Default(false) @nullable bool autoLogin,
    @Default('') @nullable String uid,
    @Default('4 hours') @nullable String selectedTime,
    @Default(MyIPAdresses.stormshieldIP) @nullable String selectedUrl,
    @Default('') @nullable String pswd,
  }) = _LoginSettings;
}
