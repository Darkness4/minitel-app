// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginSettingsTearOff {
  const _$LoginSettingsTearOff();

  _LoginSettings call(
      {@nullable bool rememberMe = false,
      @nullable bool autoLogin = false,
      @nullable String uid = '',
      @nullable String selectedTime = '4 hours',
      @nullable String selectedUrl = MyIPAdresses.stormshieldIP,
      @nullable String pswd = ''}) {
    return _LoginSettings(
      rememberMe: rememberMe,
      autoLogin: autoLogin,
      uid: uid,
      selectedTime: selectedTime,
      selectedUrl: selectedUrl,
      pswd: pswd,
    );
  }
}

// ignore: unused_element
const $LoginSettings = _$LoginSettingsTearOff();

mixin _$LoginSettings {
  @nullable
  bool get rememberMe;
  @nullable
  bool get autoLogin;
  @nullable
  String get uid;
  @nullable
  String get selectedTime;
  @nullable
  String get selectedUrl;
  @nullable
  String get pswd;

  $LoginSettingsCopyWith<LoginSettings> get copyWith;
}

abstract class $LoginSettingsCopyWith<$Res> {
  factory $LoginSettingsCopyWith(
          LoginSettings value, $Res Function(LoginSettings) then) =
      _$LoginSettingsCopyWithImpl<$Res>;
  $Res call(
      {@nullable bool rememberMe,
      @nullable bool autoLogin,
      @nullable String uid,
      @nullable String selectedTime,
      @nullable String selectedUrl,
      @nullable String pswd});
}

class _$LoginSettingsCopyWithImpl<$Res>
    implements $LoginSettingsCopyWith<$Res> {
  _$LoginSettingsCopyWithImpl(this._value, this._then);

  final LoginSettings _value;
  // ignore: unused_field
  final $Res Function(LoginSettings) _then;

  @override
  $Res call({
    Object rememberMe = freezed,
    Object autoLogin = freezed,
    Object uid = freezed,
    Object selectedTime = freezed,
    Object selectedUrl = freezed,
    Object pswd = freezed,
  }) {
    return _then(_value.copyWith(
      rememberMe:
          rememberMe == freezed ? _value.rememberMe : rememberMe as bool,
      autoLogin: autoLogin == freezed ? _value.autoLogin : autoLogin as bool,
      uid: uid == freezed ? _value.uid : uid as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime as String,
      selectedUrl:
          selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
      pswd: pswd == freezed ? _value.pswd : pswd as String,
    ));
  }
}

abstract class _$LoginSettingsCopyWith<$Res>
    implements $LoginSettingsCopyWith<$Res> {
  factory _$LoginSettingsCopyWith(
          _LoginSettings value, $Res Function(_LoginSettings) then) =
      __$LoginSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable bool rememberMe,
      @nullable bool autoLogin,
      @nullable String uid,
      @nullable String selectedTime,
      @nullable String selectedUrl,
      @nullable String pswd});
}

class __$LoginSettingsCopyWithImpl<$Res>
    extends _$LoginSettingsCopyWithImpl<$Res>
    implements _$LoginSettingsCopyWith<$Res> {
  __$LoginSettingsCopyWithImpl(
      _LoginSettings _value, $Res Function(_LoginSettings) _then)
      : super(_value, (v) => _then(v as _LoginSettings));

  @override
  _LoginSettings get _value => super._value as _LoginSettings;

  @override
  $Res call({
    Object rememberMe = freezed,
    Object autoLogin = freezed,
    Object uid = freezed,
    Object selectedTime = freezed,
    Object selectedUrl = freezed,
    Object pswd = freezed,
  }) {
    return _then(_LoginSettings(
      rememberMe:
          rememberMe == freezed ? _value.rememberMe : rememberMe as bool,
      autoLogin: autoLogin == freezed ? _value.autoLogin : autoLogin as bool,
      uid: uid == freezed ? _value.uid : uid as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime as String,
      selectedUrl:
          selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
      pswd: pswd == freezed ? _value.pswd : pswd as String,
    ));
  }
}

class _$_LoginSettings implements _LoginSettings {
  const _$_LoginSettings(
      {@nullable this.rememberMe = false,
      @nullable this.autoLogin = false,
      @nullable this.uid = '',
      @nullable this.selectedTime = '4 hours',
      @nullable this.selectedUrl = MyIPAdresses.stormshieldIP,
      @nullable this.pswd = ''});

  @JsonKey(defaultValue: false)
  @override
  @nullable
  final bool rememberMe;
  @JsonKey(defaultValue: false)
  @override
  @nullable
  final bool autoLogin;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String uid;
  @JsonKey(defaultValue: '4 hours')
  @override
  @nullable
  final String selectedTime;
  @JsonKey(defaultValue: MyIPAdresses.stormshieldIP)
  @override
  @nullable
  final String selectedUrl;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String pswd;

  @override
  String toString() {
    return 'LoginSettings(rememberMe: $rememberMe, autoLogin: $autoLogin, uid: $uid, selectedTime: $selectedTime, selectedUrl: $selectedUrl, pswd: $pswd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginSettings &&
            (identical(other.rememberMe, rememberMe) ||
                const DeepCollectionEquality()
                    .equals(other.rememberMe, rememberMe)) &&
            (identical(other.autoLogin, autoLogin) ||
                const DeepCollectionEquality()
                    .equals(other.autoLogin, autoLogin)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.selectedTime, selectedTime) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTime, selectedTime)) &&
            (identical(other.selectedUrl, selectedUrl) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUrl, selectedUrl)) &&
            (identical(other.pswd, pswd) ||
                const DeepCollectionEquality().equals(other.pswd, pswd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rememberMe) ^
      const DeepCollectionEquality().hash(autoLogin) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(selectedTime) ^
      const DeepCollectionEquality().hash(selectedUrl) ^
      const DeepCollectionEquality().hash(pswd);

  @override
  _$LoginSettingsCopyWith<_LoginSettings> get copyWith =>
      __$LoginSettingsCopyWithImpl<_LoginSettings>(this, _$identity);
}

abstract class _LoginSettings implements LoginSettings {
  const factory _LoginSettings(
      {@nullable bool rememberMe,
      @nullable bool autoLogin,
      @nullable String uid,
      @nullable String selectedTime,
      @nullable String selectedUrl,
      @nullable String pswd}) = _$_LoginSettings;

  @override
  @nullable
  bool get rememberMe;
  @override
  @nullable
  bool get autoLogin;
  @override
  @nullable
  String get uid;
  @override
  @nullable
  String get selectedTime;
  @override
  @nullable
  String get selectedUrl;
  @override
  @nullable
  String get pswd;
  @override
  _$LoginSettingsCopyWith<_LoginSettings> get copyWith;
}
