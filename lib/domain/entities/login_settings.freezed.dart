// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginSettingsTearOff {
  const _$LoginSettingsTearOff();

  _LoginSettings call(
      {bool rememberMe = false,
      bool autoLogin = false,
      String uid = '',
      String selectedTime = '4 hours',
      String selectedUrl = MyIPAdresses.stormshieldIP,
      String pswd = ''}) {
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

/// @nodoc
const $LoginSettings = _$LoginSettingsTearOff();

/// @nodoc
mixin _$LoginSettings {
  bool get rememberMe => throw _privateConstructorUsedError;
  bool get autoLogin => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get selectedTime => throw _privateConstructorUsedError;
  String get selectedUrl => throw _privateConstructorUsedError;
  String get pswd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginSettingsCopyWith<LoginSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginSettingsCopyWith<$Res> {
  factory $LoginSettingsCopyWith(
          LoginSettings value, $Res Function(LoginSettings) then) =
      _$LoginSettingsCopyWithImpl<$Res>;
  $Res call(
      {bool rememberMe,
      bool autoLogin,
      String uid,
      String selectedTime,
      String selectedUrl,
      String pswd});
}

/// @nodoc
class _$LoginSettingsCopyWithImpl<$Res>
    implements $LoginSettingsCopyWith<$Res> {
  _$LoginSettingsCopyWithImpl(this._value, this._then);

  final LoginSettings _value;
  // ignore: unused_field
  final $Res Function(LoginSettings) _then;

  @override
  $Res call({
    Object? rememberMe = freezed,
    Object? autoLogin = freezed,
    Object? uid = freezed,
    Object? selectedTime = freezed,
    Object? selectedUrl = freezed,
    Object? pswd = freezed,
  }) {
    return _then(_value.copyWith(
      rememberMe: rememberMe == freezed
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLogin: autoLogin == freezed
          ? _value.autoLogin
          : autoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as String,
      selectedUrl: selectedUrl == freezed
          ? _value.selectedUrl
          : selectedUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pswd: pswd == freezed
          ? _value.pswd
          : pswd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginSettingsCopyWith<$Res>
    implements $LoginSettingsCopyWith<$Res> {
  factory _$LoginSettingsCopyWith(
          _LoginSettings value, $Res Function(_LoginSettings) then) =
      __$LoginSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool rememberMe,
      bool autoLogin,
      String uid,
      String selectedTime,
      String selectedUrl,
      String pswd});
}

/// @nodoc
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
    Object? rememberMe = freezed,
    Object? autoLogin = freezed,
    Object? uid = freezed,
    Object? selectedTime = freezed,
    Object? selectedUrl = freezed,
    Object? pswd = freezed,
  }) {
    return _then(_LoginSettings(
      rememberMe: rememberMe == freezed
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLogin: autoLogin == freezed
          ? _value.autoLogin
          : autoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as String,
      selectedUrl: selectedUrl == freezed
          ? _value.selectedUrl
          : selectedUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pswd: pswd == freezed
          ? _value.pswd
          : pswd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_LoginSettings implements _LoginSettings {
  const _$_LoginSettings(
      {this.rememberMe = false,
      this.autoLogin = false,
      this.uid = '',
      this.selectedTime = '4 hours',
      this.selectedUrl = MyIPAdresses.stormshieldIP,
      this.pswd = ''});

  @JsonKey(defaultValue: false)
  @override
  final bool rememberMe;
  @JsonKey(defaultValue: false)
  @override
  final bool autoLogin;
  @JsonKey(defaultValue: '')
  @override
  final String uid;
  @JsonKey(defaultValue: '4 hours')
  @override
  final String selectedTime;
  @JsonKey(defaultValue: MyIPAdresses.stormshieldIP)
  @override
  final String selectedUrl;
  @JsonKey(defaultValue: '')
  @override
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

  @JsonKey(ignore: true)
  @override
  _$LoginSettingsCopyWith<_LoginSettings> get copyWith =>
      __$LoginSettingsCopyWithImpl<_LoginSettings>(this, _$identity);
}

abstract class _LoginSettings implements LoginSettings {
  const factory _LoginSettings(
      {bool rememberMe,
      bool autoLogin,
      String uid,
      String selectedTime,
      String selectedUrl,
      String pswd}) = _$_LoginSettings;

  @override
  bool get rememberMe => throw _privateConstructorUsedError;
  @override
  bool get autoLogin => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get selectedTime => throw _privateConstructorUsedError;
  @override
  String get selectedUrl => throw _privateConstructorUsedError;
  @override
  String get pswd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginSettingsCopyWith<_LoginSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
