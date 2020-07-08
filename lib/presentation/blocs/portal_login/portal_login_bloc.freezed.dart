// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'portal_login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PortalLoginEventTearOff {
  const _$PortalLoginEventTearOff();

  LoginEvent login(
      {@required String uid,
      @required String pswd,
      @required String selectedUrl,
      @required String selectedTime}) {
    return LoginEvent(
      uid: uid,
      pswd: pswd,
      selectedUrl: selectedUrl,
      selectedTime: selectedTime,
    );
  }
}

// ignore: unused_element
const $PortalLoginEvent = _$PortalLoginEventTearOff();

mixin _$PortalLoginEvent {
  String get uid;
  String get pswd;
  String get selectedUrl;
  String get selectedTime;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result login(
            String uid, String pswd, String selectedUrl, String selectedTime),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result login(
        String uid, String pswd, String selectedUrl, String selectedTime),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result login(LoginEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result login(LoginEvent value),
    @required Result orElse(),
  });

  $PortalLoginEventCopyWith<PortalLoginEvent> get copyWith;
}

abstract class $PortalLoginEventCopyWith<$Res> {
  factory $PortalLoginEventCopyWith(
          PortalLoginEvent value, $Res Function(PortalLoginEvent) then) =
      _$PortalLoginEventCopyWithImpl<$Res>;
  $Res call({String uid, String pswd, String selectedUrl, String selectedTime});
}

class _$PortalLoginEventCopyWithImpl<$Res>
    implements $PortalLoginEventCopyWith<$Res> {
  _$PortalLoginEventCopyWithImpl(this._value, this._then);

  final PortalLoginEvent _value;
  // ignore: unused_field
  final $Res Function(PortalLoginEvent) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object pswd = freezed,
    Object selectedUrl = freezed,
    Object selectedTime = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      pswd: pswd == freezed ? _value.pswd : pswd as String,
      selectedUrl:
          selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime as String,
    ));
  }
}

abstract class $LoginEventCopyWith<$Res>
    implements $PortalLoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String pswd, String selectedUrl, String selectedTime});
}

class _$LoginEventCopyWithImpl<$Res>
    extends _$PortalLoginEventCopyWithImpl<$Res>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(LoginEvent _value, $Res Function(LoginEvent) _then)
      : super(_value, (v) => _then(v as LoginEvent));

  @override
  LoginEvent get _value => super._value as LoginEvent;

  @override
  $Res call({
    Object uid = freezed,
    Object pswd = freezed,
    Object selectedUrl = freezed,
    Object selectedTime = freezed,
  }) {
    return _then(LoginEvent(
      uid: uid == freezed ? _value.uid : uid as String,
      pswd: pswd == freezed ? _value.pswd : pswd as String,
      selectedUrl:
          selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime as String,
    ));
  }
}

class _$LoginEvent with DiagnosticableTreeMixin implements LoginEvent {
  const _$LoginEvent(
      {@required this.uid,
      @required this.pswd,
      @required this.selectedUrl,
      @required this.selectedTime})
      : assert(uid != null),
        assert(pswd != null),
        assert(selectedUrl != null),
        assert(selectedTime != null);

  @override
  final String uid;
  @override
  final String pswd;
  @override
  final String selectedUrl;
  @override
  final String selectedTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalLoginEvent.login(uid: $uid, pswd: $pswd, selectedUrl: $selectedUrl, selectedTime: $selectedTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalLoginEvent.login'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('pswd', pswd))
      ..add(DiagnosticsProperty('selectedUrl', selectedUrl))
      ..add(DiagnosticsProperty('selectedTime', selectedTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginEvent &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.pswd, pswd) ||
                const DeepCollectionEquality().equals(other.pswd, pswd)) &&
            (identical(other.selectedUrl, selectedUrl) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUrl, selectedUrl)) &&
            (identical(other.selectedTime, selectedTime) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTime, selectedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(pswd) ^
      const DeepCollectionEquality().hash(selectedUrl) ^
      const DeepCollectionEquality().hash(selectedTime);

  @override
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      _$LoginEventCopyWithImpl<LoginEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result login(
            String uid, String pswd, String selectedUrl, String selectedTime),
  }) {
    assert(login != null);
    return login(uid, pswd, selectedUrl, selectedTime);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result login(
        String uid, String pswd, String selectedUrl, String selectedTime),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(uid, pswd, selectedUrl, selectedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result login(LoginEvent value),
  }) {
    assert(login != null);
    return login(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result login(LoginEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class LoginEvent implements PortalLoginEvent {
  const factory LoginEvent(
      {@required String uid,
      @required String pswd,
      @required String selectedUrl,
      @required String selectedTime}) = _$LoginEvent;

  @override
  String get uid;
  @override
  String get pswd;
  @override
  String get selectedUrl;
  @override
  String get selectedTime;
  @override
  $LoginEventCopyWith<LoginEvent> get copyWith;
}

class _$PortalLoginStateTearOff {
  const _$PortalLoginStateTearOff();

  _PortalLoginState call(
      {@required bool isSubmitting,
      @required bool isSuccess,
      @required bool isFailure,
      Exception error}) {
    return _PortalLoginState(
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
      error: error,
    );
  }
}

// ignore: unused_element
const $PortalLoginState = _$PortalLoginStateTearOff();

mixin _$PortalLoginState {
  bool get isSubmitting;
  bool get isSuccess;
  bool get isFailure;
  Exception get error;

  $PortalLoginStateCopyWith<PortalLoginState> get copyWith;
}

abstract class $PortalLoginStateCopyWith<$Res> {
  factory $PortalLoginStateCopyWith(
          PortalLoginState value, $Res Function(PortalLoginState) then) =
      _$PortalLoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting, bool isSuccess, bool isFailure, Exception error});
}

class _$PortalLoginStateCopyWithImpl<$Res>
    implements $PortalLoginStateCopyWith<$Res> {
  _$PortalLoginStateCopyWithImpl(this._value, this._then);

  final PortalLoginState _value;
  // ignore: unused_field
  final $Res Function(PortalLoginState) _then;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object isFailure = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
      error: error == freezed ? _value.error : error as Exception,
    ));
  }
}

abstract class _$PortalLoginStateCopyWith<$Res>
    implements $PortalLoginStateCopyWith<$Res> {
  factory _$PortalLoginStateCopyWith(
          _PortalLoginState value, $Res Function(_PortalLoginState) then) =
      __$PortalLoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting, bool isSuccess, bool isFailure, Exception error});
}

class __$PortalLoginStateCopyWithImpl<$Res>
    extends _$PortalLoginStateCopyWithImpl<$Res>
    implements _$PortalLoginStateCopyWith<$Res> {
  __$PortalLoginStateCopyWithImpl(
      _PortalLoginState _value, $Res Function(_PortalLoginState) _then)
      : super(_value, (v) => _then(v as _PortalLoginState));

  @override
  _PortalLoginState get _value => super._value as _PortalLoginState;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object isFailure = freezed,
    Object error = freezed,
  }) {
    return _then(_PortalLoginState(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
      error: error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$_PortalLoginState
    with DiagnosticableTreeMixin
    implements _PortalLoginState {
  const _$_PortalLoginState(
      {@required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      this.error})
      : assert(isSubmitting != null),
        assert(isSuccess != null),
        assert(isFailure != null);

  @override
  final bool isSubmitting;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalLoginState(isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalLoginState'))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('isFailure', isFailure))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortalLoginState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.isFailure, isFailure) ||
                const DeepCollectionEquality()
                    .equals(other.isFailure, isFailure)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(isFailure) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$PortalLoginStateCopyWith<_PortalLoginState> get copyWith =>
      __$PortalLoginStateCopyWithImpl<_PortalLoginState>(this, _$identity);
}

abstract class _PortalLoginState implements PortalLoginState {
  const factory _PortalLoginState(
      {@required bool isSubmitting,
      @required bool isSuccess,
      @required bool isFailure,
      Exception error}) = _$_PortalLoginState;

  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  Exception get error;
  @override
  _$PortalLoginStateCopyWith<_PortalLoginState> get copyWith;
}
