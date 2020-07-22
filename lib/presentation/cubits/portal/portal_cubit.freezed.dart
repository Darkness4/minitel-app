// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'portal_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PortalStateTearOff {
  const _$PortalStateTearOff();

// ignore: unused_element
  _PortalState call(
      {@required bool rememberMe,
      @required bool autoLogin,
      @required @nullable String uid,
      @required String selectedTime,
      @required String selectedUrl,
      @required @nullable String pswd,
      @required bool isValidUid,
      @required bool isLoaded,
      @required bool isLoading,
      @required bool isError}) {
    return _PortalState(
      rememberMe: rememberMe,
      autoLogin: autoLogin,
      uid: uid,
      selectedTime: selectedTime,
      selectedUrl: selectedUrl,
      pswd: pswd,
      isValidUid: isValidUid,
      isLoaded: isLoaded,
      isLoading: isLoading,
      isError: isError,
    );
  }
}

// ignore: unused_element
const $PortalState = _$PortalStateTearOff();

mixin _$PortalState {
  bool get rememberMe;
  bool get autoLogin;
  @nullable
  String get uid;
  String get selectedTime;
  String get selectedUrl;
  @nullable
  String get pswd;
  bool get isValidUid;
  bool get isLoaded;
  bool get isLoading;
  bool get isError;

  $PortalStateCopyWith<PortalState> get copyWith;
}

abstract class $PortalStateCopyWith<$Res> {
  factory $PortalStateCopyWith(
          PortalState value, $Res Function(PortalState) then) =
      _$PortalStateCopyWithImpl<$Res>;
  $Res call(
      {bool rememberMe,
      bool autoLogin,
      @nullable String uid,
      String selectedTime,
      String selectedUrl,
      @nullable String pswd,
      bool isValidUid,
      bool isLoaded,
      bool isLoading,
      bool isError});
}

class _$PortalStateCopyWithImpl<$Res> implements $PortalStateCopyWith<$Res> {
  _$PortalStateCopyWithImpl(this._value, this._then);

  final PortalState _value;
  // ignore: unused_field
  final $Res Function(PortalState) _then;

  @override
  $Res call({
    Object rememberMe = freezed,
    Object autoLogin = freezed,
    Object uid = freezed,
    Object selectedTime = freezed,
    Object selectedUrl = freezed,
    Object pswd = freezed,
    Object isValidUid = freezed,
    Object isLoaded = freezed,
    Object isLoading = freezed,
    Object isError = freezed,
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
      isValidUid:
          isValidUid == freezed ? _value.isValidUid : isValidUid as bool,
      isLoaded: isLoaded == freezed ? _value.isLoaded : isLoaded as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
    ));
  }
}

abstract class _$PortalStateCopyWith<$Res>
    implements $PortalStateCopyWith<$Res> {
  factory _$PortalStateCopyWith(
          _PortalState value, $Res Function(_PortalState) then) =
      __$PortalStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool rememberMe,
      bool autoLogin,
      @nullable String uid,
      String selectedTime,
      String selectedUrl,
      @nullable String pswd,
      bool isValidUid,
      bool isLoaded,
      bool isLoading,
      bool isError});
}

class __$PortalStateCopyWithImpl<$Res> extends _$PortalStateCopyWithImpl<$Res>
    implements _$PortalStateCopyWith<$Res> {
  __$PortalStateCopyWithImpl(
      _PortalState _value, $Res Function(_PortalState) _then)
      : super(_value, (v) => _then(v as _PortalState));

  @override
  _PortalState get _value => super._value as _PortalState;

  @override
  $Res call({
    Object rememberMe = freezed,
    Object autoLogin = freezed,
    Object uid = freezed,
    Object selectedTime = freezed,
    Object selectedUrl = freezed,
    Object pswd = freezed,
    Object isValidUid = freezed,
    Object isLoaded = freezed,
    Object isLoading = freezed,
    Object isError = freezed,
  }) {
    return _then(_PortalState(
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
      isValidUid:
          isValidUid == freezed ? _value.isValidUid : isValidUid as bool,
      isLoaded: isLoaded == freezed ? _value.isLoaded : isLoaded as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
    ));
  }
}

class _$_PortalState with DiagnosticableTreeMixin implements _PortalState {
  const _$_PortalState(
      {@required this.rememberMe,
      @required this.autoLogin,
      @required @nullable this.uid,
      @required this.selectedTime,
      @required this.selectedUrl,
      @required @nullable this.pswd,
      @required this.isValidUid,
      @required this.isLoaded,
      @required this.isLoading,
      @required this.isError})
      : assert(rememberMe != null),
        assert(autoLogin != null),
        assert(selectedTime != null),
        assert(selectedUrl != null),
        assert(isValidUid != null),
        assert(isLoaded != null),
        assert(isLoading != null),
        assert(isError != null);

  @override
  final bool rememberMe;
  @override
  final bool autoLogin;
  @override
  @nullable
  final String uid;
  @override
  final String selectedTime;
  @override
  final String selectedUrl;
  @override
  @nullable
  final String pswd;
  @override
  final bool isValidUid;
  @override
  final bool isLoaded;
  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalState(rememberMe: $rememberMe, autoLogin: $autoLogin, uid: $uid, selectedTime: $selectedTime, selectedUrl: $selectedUrl, pswd: $pswd, isValidUid: $isValidUid, isLoaded: $isLoaded, isLoading: $isLoading, isError: $isError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalState'))
      ..add(DiagnosticsProperty('rememberMe', rememberMe))
      ..add(DiagnosticsProperty('autoLogin', autoLogin))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('selectedTime', selectedTime))
      ..add(DiagnosticsProperty('selectedUrl', selectedUrl))
      ..add(DiagnosticsProperty('pswd', pswd))
      ..add(DiagnosticsProperty('isValidUid', isValidUid))
      ..add(DiagnosticsProperty('isLoaded', isLoaded))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isError', isError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortalState &&
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
                const DeepCollectionEquality().equals(other.pswd, pswd)) &&
            (identical(other.isValidUid, isValidUid) ||
                const DeepCollectionEquality()
                    .equals(other.isValidUid, isValidUid)) &&
            (identical(other.isLoaded, isLoaded) ||
                const DeepCollectionEquality()
                    .equals(other.isLoaded, isLoaded)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality().equals(other.isError, isError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rememberMe) ^
      const DeepCollectionEquality().hash(autoLogin) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(selectedTime) ^
      const DeepCollectionEquality().hash(selectedUrl) ^
      const DeepCollectionEquality().hash(pswd) ^
      const DeepCollectionEquality().hash(isValidUid) ^
      const DeepCollectionEquality().hash(isLoaded) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isError);

  @override
  _$PortalStateCopyWith<_PortalState> get copyWith =>
      __$PortalStateCopyWithImpl<_PortalState>(this, _$identity);
}

abstract class _PortalState implements PortalState {
  const factory _PortalState(
      {@required bool rememberMe,
      @required bool autoLogin,
      @required @nullable String uid,
      @required String selectedTime,
      @required String selectedUrl,
      @required @nullable String pswd,
      @required bool isValidUid,
      @required bool isLoaded,
      @required bool isLoading,
      @required bool isError}) = _$_PortalState;

  @override
  bool get rememberMe;
  @override
  bool get autoLogin;
  @override
  @nullable
  String get uid;
  @override
  String get selectedTime;
  @override
  String get selectedUrl;
  @override
  @nullable
  String get pswd;
  @override
  bool get isValidUid;
  @override
  bool get isLoaded;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  _$PortalStateCopyWith<_PortalState> get copyWith;
}
