import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_settings.freezed.dart';

@freezed
abstract class LoginSettings with _$LoginSettings {
  const factory LoginSettings({
    @required @nullable bool rememberMe,
    @required @nullable bool autoLogin,
    @required @nullable String uid,
    @required @nullable String selectedTime,
    @required @nullable String selectedUrl,
    @required @nullable String pswd,
  }) = _LoginSettings;
}
