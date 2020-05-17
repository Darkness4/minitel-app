// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'portal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PortalEventTearOff {
  const _$PortalEventTearOff();

  RememberLoginEvent rememberLogin(
      {@required String uid,
      @required String pswd,
      @required String selectedUrl,
      @required String selectedTime,
      @required bool rememberMe,
      @required bool autoLogin}) {
    return RememberLoginEvent(
      uid: uid,
      pswd: pswd,
      selectedUrl: selectedUrl,
      selectedTime: selectedTime,
      rememberMe: rememberMe,
      autoLogin: autoLogin,
    );
  }

  AutoLogin autoLogin() {
    return const AutoLogin();
  }

  PswdChanged pswdChanged(String pswd) {
    return PswdChanged(
      pswd,
    );
  }

  UidChanged uidChanged(String uid) {
    return UidChanged(
      uid,
    );
  }

  SelectedUrlChanged selectedUrlChanged(String selectedUrl) {
    return SelectedUrlChanged(
      selectedUrl,
    );
  }

  SelectedTimeChanged selectedTimeChanged(String selectedTime) {
    return SelectedTimeChanged(
      selectedTime,
    );
  }

  RememberMeChanged rememberMeChanged(bool rememberMe) {
    return RememberMeChanged(
      rememberMe,
    );
  }

  AutoLoginChanged autoLoginChanged(bool autoLogin) {
    return AutoLoginChanged(
      autoLogin,
    );
  }
}

// ignore: unused_element
const $PortalEvent = _$PortalEventTearOff();

mixin _$PortalEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  });
}

abstract class $PortalEventCopyWith<$Res> {
  factory $PortalEventCopyWith(
          PortalEvent value, $Res Function(PortalEvent) then) =
      _$PortalEventCopyWithImpl<$Res>;
}

class _$PortalEventCopyWithImpl<$Res> implements $PortalEventCopyWith<$Res> {
  _$PortalEventCopyWithImpl(this._value, this._then);

  final PortalEvent _value;
  // ignore: unused_field
  final $Res Function(PortalEvent) _then;
}

abstract class $RememberLoginEventCopyWith<$Res> {
  factory $RememberLoginEventCopyWith(
          RememberLoginEvent value, $Res Function(RememberLoginEvent) then) =
      _$RememberLoginEventCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String pswd,
      String selectedUrl,
      String selectedTime,
      bool rememberMe,
      bool autoLogin});
}

class _$RememberLoginEventCopyWithImpl<$Res>
    extends _$PortalEventCopyWithImpl<$Res>
    implements $RememberLoginEventCopyWith<$Res> {
  _$RememberLoginEventCopyWithImpl(
      RememberLoginEvent _value, $Res Function(RememberLoginEvent) _then)
      : super(_value, (v) => _then(v as RememberLoginEvent));

  @override
  RememberLoginEvent get _value => super._value as RememberLoginEvent;

  @override
  $Res call({
    Object uid = freezed,
    Object pswd = freezed,
    Object selectedUrl = freezed,
    Object selectedTime = freezed,
    Object rememberMe = freezed,
    Object autoLogin = freezed,
  }) {
    return _then(RememberLoginEvent(
      uid: uid == freezed ? _value.uid : uid as String,
      pswd: pswd == freezed ? _value.pswd : pswd as String,
      selectedUrl:
          selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
      selectedTime: selectedTime == freezed
          ? _value.selectedTime
          : selectedTime as String,
      rememberMe:
          rememberMe == freezed ? _value.rememberMe : rememberMe as bool,
      autoLogin: autoLogin == freezed ? _value.autoLogin : autoLogin as bool,
    ));
  }
}

class _$RememberLoginEvent
    with DiagnosticableTreeMixin
    implements RememberLoginEvent {
  const _$RememberLoginEvent(
      {@required this.uid,
      @required this.pswd,
      @required this.selectedUrl,
      @required this.selectedTime,
      @required this.rememberMe,
      @required this.autoLogin})
      : assert(uid != null),
        assert(pswd != null),
        assert(selectedUrl != null),
        assert(selectedTime != null),
        assert(rememberMe != null),
        assert(autoLogin != null);

  @override
  final String uid;
  @override
  final String pswd;
  @override
  final String selectedUrl;
  @override
  final String selectedTime;
  @override
  final bool rememberMe;
  @override
  final bool autoLogin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.rememberLogin(uid: $uid, pswd: $pswd, selectedUrl: $selectedUrl, selectedTime: $selectedTime, rememberMe: $rememberMe, autoLogin: $autoLogin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.rememberLogin'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('pswd', pswd))
      ..add(DiagnosticsProperty('selectedUrl', selectedUrl))
      ..add(DiagnosticsProperty('selectedTime', selectedTime))
      ..add(DiagnosticsProperty('rememberMe', rememberMe))
      ..add(DiagnosticsProperty('autoLogin', autoLogin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RememberLoginEvent &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.pswd, pswd) ||
                const DeepCollectionEquality().equals(other.pswd, pswd)) &&
            (identical(other.selectedUrl, selectedUrl) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUrl, selectedUrl)) &&
            (identical(other.selectedTime, selectedTime) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTime, selectedTime)) &&
            (identical(other.rememberMe, rememberMe) ||
                const DeepCollectionEquality()
                    .equals(other.rememberMe, rememberMe)) &&
            (identical(other.autoLogin, autoLogin) ||
                const DeepCollectionEquality()
                    .equals(other.autoLogin, autoLogin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(pswd) ^
      const DeepCollectionEquality().hash(selectedUrl) ^
      const DeepCollectionEquality().hash(selectedTime) ^
      const DeepCollectionEquality().hash(rememberMe) ^
      const DeepCollectionEquality().hash(autoLogin);

  @override
  $RememberLoginEventCopyWith<RememberLoginEvent> get copyWith =>
      _$RememberLoginEventCopyWithImpl<RememberLoginEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return rememberLogin(
        uid, pswd, selectedUrl, selectedTime, rememberMe, this.autoLogin);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rememberLogin != null) {
      return rememberLogin(
          uid, pswd, selectedUrl, selectedTime, rememberMe, this.autoLogin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return rememberLogin(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rememberLogin != null) {
      return rememberLogin(this);
    }
    return orElse();
  }
}

abstract class RememberLoginEvent implements PortalEvent {
  const factory RememberLoginEvent(
      {@required String uid,
      @required String pswd,
      @required String selectedUrl,
      @required String selectedTime,
      @required bool rememberMe,
      @required bool autoLogin}) = _$RememberLoginEvent;

  String get uid;
  String get pswd;
  String get selectedUrl;
  String get selectedTime;
  bool get rememberMe;
  bool get autoLogin;
  $RememberLoginEventCopyWith<RememberLoginEvent> get copyWith;
}

abstract class $AutoLoginCopyWith<$Res> {
  factory $AutoLoginCopyWith(AutoLogin value, $Res Function(AutoLogin) then) =
      _$AutoLoginCopyWithImpl<$Res>;
}

class _$AutoLoginCopyWithImpl<$Res> extends _$PortalEventCopyWithImpl<$Res>
    implements $AutoLoginCopyWith<$Res> {
  _$AutoLoginCopyWithImpl(AutoLogin _value, $Res Function(AutoLogin) _then)
      : super(_value, (v) => _then(v as AutoLogin));

  @override
  AutoLogin get _value => super._value as AutoLogin;
}

class _$AutoLogin with DiagnosticableTreeMixin implements AutoLogin {
  const _$AutoLogin();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.autoLogin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PortalEvent.autoLogin'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AutoLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return autoLogin();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (autoLogin != null) {
      return autoLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return autoLogin(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (autoLogin != null) {
      return autoLogin(this);
    }
    return orElse();
  }
}

abstract class AutoLogin implements PortalEvent {
  const factory AutoLogin() = _$AutoLogin;
}

abstract class $PswdChangedCopyWith<$Res> {
  factory $PswdChangedCopyWith(
          PswdChanged value, $Res Function(PswdChanged) then) =
      _$PswdChangedCopyWithImpl<$Res>;
  $Res call({String pswd});
}

class _$PswdChangedCopyWithImpl<$Res> extends _$PortalEventCopyWithImpl<$Res>
    implements $PswdChangedCopyWith<$Res> {
  _$PswdChangedCopyWithImpl(
      PswdChanged _value, $Res Function(PswdChanged) _then)
      : super(_value, (v) => _then(v as PswdChanged));

  @override
  PswdChanged get _value => super._value as PswdChanged;

  @override
  $Res call({
    Object pswd = freezed,
  }) {
    return _then(PswdChanged(
      pswd == freezed ? _value.pswd : pswd as String,
    ));
  }
}

class _$PswdChanged with DiagnosticableTreeMixin implements PswdChanged {
  const _$PswdChanged(this.pswd) : assert(pswd != null);

  @override
  final String pswd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.pswdChanged(pswd: $pswd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.pswdChanged'))
      ..add(DiagnosticsProperty('pswd', pswd));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PswdChanged &&
            (identical(other.pswd, pswd) ||
                const DeepCollectionEquality().equals(other.pswd, pswd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pswd);

  @override
  $PswdChangedCopyWith<PswdChanged> get copyWith =>
      _$PswdChangedCopyWithImpl<PswdChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return pswdChanged(pswd);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pswdChanged != null) {
      return pswdChanged(pswd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return pswdChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pswdChanged != null) {
      return pswdChanged(this);
    }
    return orElse();
  }
}

abstract class PswdChanged implements PortalEvent {
  const factory PswdChanged(String pswd) = _$PswdChanged;

  String get pswd;
  $PswdChangedCopyWith<PswdChanged> get copyWith;
}

abstract class $UidChangedCopyWith<$Res> {
  factory $UidChangedCopyWith(
          UidChanged value, $Res Function(UidChanged) then) =
      _$UidChangedCopyWithImpl<$Res>;
  $Res call({String uid});
}

class _$UidChangedCopyWithImpl<$Res> extends _$PortalEventCopyWithImpl<$Res>
    implements $UidChangedCopyWith<$Res> {
  _$UidChangedCopyWithImpl(UidChanged _value, $Res Function(UidChanged) _then)
      : super(_value, (v) => _then(v as UidChanged));

  @override
  UidChanged get _value => super._value as UidChanged;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(UidChanged(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$UidChanged with DiagnosticableTreeMixin implements UidChanged {
  const _$UidChanged(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.uidChanged(uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.uidChanged'))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UidChanged &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  $UidChangedCopyWith<UidChanged> get copyWith =>
      _$UidChangedCopyWithImpl<UidChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return uidChanged(uid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uidChanged != null) {
      return uidChanged(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return uidChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uidChanged != null) {
      return uidChanged(this);
    }
    return orElse();
  }
}

abstract class UidChanged implements PortalEvent {
  const factory UidChanged(String uid) = _$UidChanged;

  String get uid;
  $UidChangedCopyWith<UidChanged> get copyWith;
}

abstract class $SelectedUrlChangedCopyWith<$Res> {
  factory $SelectedUrlChangedCopyWith(
          SelectedUrlChanged value, $Res Function(SelectedUrlChanged) then) =
      _$SelectedUrlChangedCopyWithImpl<$Res>;
  $Res call({String selectedUrl});
}

class _$SelectedUrlChangedCopyWithImpl<$Res>
    extends _$PortalEventCopyWithImpl<$Res>
    implements $SelectedUrlChangedCopyWith<$Res> {
  _$SelectedUrlChangedCopyWithImpl(
      SelectedUrlChanged _value, $Res Function(SelectedUrlChanged) _then)
      : super(_value, (v) => _then(v as SelectedUrlChanged));

  @override
  SelectedUrlChanged get _value => super._value as SelectedUrlChanged;

  @override
  $Res call({
    Object selectedUrl = freezed,
  }) {
    return _then(SelectedUrlChanged(
      selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
    ));
  }
}

class _$SelectedUrlChanged
    with DiagnosticableTreeMixin
    implements SelectedUrlChanged {
  const _$SelectedUrlChanged(this.selectedUrl) : assert(selectedUrl != null);

  @override
  final String selectedUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.selectedUrlChanged(selectedUrl: $selectedUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.selectedUrlChanged'))
      ..add(DiagnosticsProperty('selectedUrl', selectedUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectedUrlChanged &&
            (identical(other.selectedUrl, selectedUrl) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUrl, selectedUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectedUrl);

  @override
  $SelectedUrlChangedCopyWith<SelectedUrlChanged> get copyWith =>
      _$SelectedUrlChangedCopyWithImpl<SelectedUrlChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return selectedUrlChanged(selectedUrl);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectedUrlChanged != null) {
      return selectedUrlChanged(selectedUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return selectedUrlChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectedUrlChanged != null) {
      return selectedUrlChanged(this);
    }
    return orElse();
  }
}

abstract class SelectedUrlChanged implements PortalEvent {
  const factory SelectedUrlChanged(String selectedUrl) = _$SelectedUrlChanged;

  String get selectedUrl;
  $SelectedUrlChangedCopyWith<SelectedUrlChanged> get copyWith;
}

abstract class $SelectedTimeChangedCopyWith<$Res> {
  factory $SelectedTimeChangedCopyWith(
          SelectedTimeChanged value, $Res Function(SelectedTimeChanged) then) =
      _$SelectedTimeChangedCopyWithImpl<$Res>;
  $Res call({String selectedTime});
}

class _$SelectedTimeChangedCopyWithImpl<$Res>
    extends _$PortalEventCopyWithImpl<$Res>
    implements $SelectedTimeChangedCopyWith<$Res> {
  _$SelectedTimeChangedCopyWithImpl(
      SelectedTimeChanged _value, $Res Function(SelectedTimeChanged) _then)
      : super(_value, (v) => _then(v as SelectedTimeChanged));

  @override
  SelectedTimeChanged get _value => super._value as SelectedTimeChanged;

  @override
  $Res call({
    Object selectedTime = freezed,
  }) {
    return _then(SelectedTimeChanged(
      selectedTime == freezed ? _value.selectedTime : selectedTime as String,
    ));
  }
}

class _$SelectedTimeChanged
    with DiagnosticableTreeMixin
    implements SelectedTimeChanged {
  const _$SelectedTimeChanged(this.selectedTime) : assert(selectedTime != null);

  @override
  final String selectedTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.selectedTimeChanged(selectedTime: $selectedTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.selectedTimeChanged'))
      ..add(DiagnosticsProperty('selectedTime', selectedTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectedTimeChanged &&
            (identical(other.selectedTime, selectedTime) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTime, selectedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectedTime);

  @override
  $SelectedTimeChangedCopyWith<SelectedTimeChanged> get copyWith =>
      _$SelectedTimeChangedCopyWithImpl<SelectedTimeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return selectedTimeChanged(selectedTime);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectedTimeChanged != null) {
      return selectedTimeChanged(selectedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return selectedTimeChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectedTimeChanged != null) {
      return selectedTimeChanged(this);
    }
    return orElse();
  }
}

abstract class SelectedTimeChanged implements PortalEvent {
  const factory SelectedTimeChanged(String selectedTime) =
      _$SelectedTimeChanged;

  String get selectedTime;
  $SelectedTimeChangedCopyWith<SelectedTimeChanged> get copyWith;
}

abstract class $RememberMeChangedCopyWith<$Res> {
  factory $RememberMeChangedCopyWith(
          RememberMeChanged value, $Res Function(RememberMeChanged) then) =
      _$RememberMeChangedCopyWithImpl<$Res>;
  $Res call({bool rememberMe});
}

class _$RememberMeChangedCopyWithImpl<$Res>
    extends _$PortalEventCopyWithImpl<$Res>
    implements $RememberMeChangedCopyWith<$Res> {
  _$RememberMeChangedCopyWithImpl(
      RememberMeChanged _value, $Res Function(RememberMeChanged) _then)
      : super(_value, (v) => _then(v as RememberMeChanged));

  @override
  RememberMeChanged get _value => super._value as RememberMeChanged;

  @override
  $Res call({
    Object rememberMe = freezed,
  }) {
    return _then(RememberMeChanged(
      rememberMe == freezed ? _value.rememberMe : rememberMe as bool,
    ));
  }
}

class _$RememberMeChanged
    with DiagnosticableTreeMixin
    implements RememberMeChanged {
  const _$RememberMeChanged(this.rememberMe) : assert(rememberMe != null);

  @override
  final bool rememberMe;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.rememberMeChanged(rememberMe: $rememberMe)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.rememberMeChanged'))
      ..add(DiagnosticsProperty('rememberMe', rememberMe));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RememberMeChanged &&
            (identical(other.rememberMe, rememberMe) ||
                const DeepCollectionEquality()
                    .equals(other.rememberMe, rememberMe)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(rememberMe);

  @override
  $RememberMeChangedCopyWith<RememberMeChanged> get copyWith =>
      _$RememberMeChangedCopyWithImpl<RememberMeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return rememberMeChanged(rememberMe);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rememberMeChanged != null) {
      return rememberMeChanged(rememberMe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return rememberMeChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rememberMeChanged != null) {
      return rememberMeChanged(this);
    }
    return orElse();
  }
}

abstract class RememberMeChanged implements PortalEvent {
  const factory RememberMeChanged(bool rememberMe) = _$RememberMeChanged;

  bool get rememberMe;
  $RememberMeChangedCopyWith<RememberMeChanged> get copyWith;
}

abstract class $AutoLoginChangedCopyWith<$Res> {
  factory $AutoLoginChangedCopyWith(
          AutoLoginChanged value, $Res Function(AutoLoginChanged) then) =
      _$AutoLoginChangedCopyWithImpl<$Res>;
  $Res call({bool autoLogin});
}

class _$AutoLoginChangedCopyWithImpl<$Res>
    extends _$PortalEventCopyWithImpl<$Res>
    implements $AutoLoginChangedCopyWith<$Res> {
  _$AutoLoginChangedCopyWithImpl(
      AutoLoginChanged _value, $Res Function(AutoLoginChanged) _then)
      : super(_value, (v) => _then(v as AutoLoginChanged));

  @override
  AutoLoginChanged get _value => super._value as AutoLoginChanged;

  @override
  $Res call({
    Object autoLogin = freezed,
  }) {
    return _then(AutoLoginChanged(
      autoLogin == freezed ? _value.autoLogin : autoLogin as bool,
    ));
  }
}

class _$AutoLoginChanged
    with DiagnosticableTreeMixin
    implements AutoLoginChanged {
  const _$AutoLoginChanged(this.autoLogin) : assert(autoLogin != null);

  @override
  final bool autoLogin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalEvent.autoLoginChanged(autoLogin: $autoLogin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalEvent.autoLoginChanged'))
      ..add(DiagnosticsProperty('autoLogin', autoLogin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AutoLoginChanged &&
            (identical(other.autoLogin, autoLogin) ||
                const DeepCollectionEquality()
                    .equals(other.autoLogin, autoLogin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(autoLogin);

  @override
  $AutoLoginChangedCopyWith<AutoLoginChanged> get copyWith =>
      _$AutoLoginChangedCopyWithImpl<AutoLoginChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result rememberLogin(String uid, String pswd, String selectedUrl,
            String selectedTime, bool rememberMe, bool autoLogin),
    @required Result autoLogin(),
    @required Result pswdChanged(String pswd),
    @required Result uidChanged(String uid),
    @required Result selectedUrlChanged(String selectedUrl),
    @required Result selectedTimeChanged(String selectedTime),
    @required Result rememberMeChanged(bool rememberMe),
    @required Result autoLoginChanged(bool autoLogin),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return autoLoginChanged(this.autoLogin);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rememberLogin(String uid, String pswd, String selectedUrl,
        String selectedTime, bool rememberMe, bool autoLogin),
    Result autoLogin(),
    Result pswdChanged(String pswd),
    Result uidChanged(String uid),
    Result selectedUrlChanged(String selectedUrl),
    Result selectedTimeChanged(String selectedTime),
    Result rememberMeChanged(bool rememberMe),
    Result autoLoginChanged(bool autoLogin),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (autoLoginChanged != null) {
      return autoLoginChanged(this.autoLogin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rememberLogin(RememberLoginEvent value),
    @required Result autoLogin(AutoLogin value),
    @required Result pswdChanged(PswdChanged value),
    @required Result uidChanged(UidChanged value),
    @required Result selectedUrlChanged(SelectedUrlChanged value),
    @required Result selectedTimeChanged(SelectedTimeChanged value),
    @required Result rememberMeChanged(RememberMeChanged value),
    @required Result autoLoginChanged(AutoLoginChanged value),
  }) {
    assert(rememberLogin != null);
    assert(autoLogin != null);
    assert(pswdChanged != null);
    assert(uidChanged != null);
    assert(selectedUrlChanged != null);
    assert(selectedTimeChanged != null);
    assert(rememberMeChanged != null);
    assert(autoLoginChanged != null);
    return autoLoginChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rememberLogin(RememberLoginEvent value),
    Result autoLogin(AutoLogin value),
    Result pswdChanged(PswdChanged value),
    Result uidChanged(UidChanged value),
    Result selectedUrlChanged(SelectedUrlChanged value),
    Result selectedTimeChanged(SelectedTimeChanged value),
    Result rememberMeChanged(RememberMeChanged value),
    Result autoLoginChanged(AutoLoginChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (autoLoginChanged != null) {
      return autoLoginChanged(this);
    }
    return orElse();
  }
}

abstract class AutoLoginChanged implements PortalEvent {
  const factory AutoLoginChanged(bool autoLogin) = _$AutoLoginChanged;

  bool get autoLogin;
  $AutoLoginChangedCopyWith<AutoLoginChanged> get copyWith;
}

class _$PortalStateTearOff {
  const _$PortalStateTearOff();

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
