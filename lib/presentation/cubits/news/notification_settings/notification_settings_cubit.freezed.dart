// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NotificationSettingsStateTearOff {
  const _$NotificationSettingsStateTearOff();

// ignore: unused_element
  _NotificationSettingsState call(
      {@required @nullable NotificationSettings notificationSettings,
      @required @nullable bool isSaved,
      @required @nullable bool isLoaded}) {
    return _NotificationSettingsState(
      notificationSettings: notificationSettings,
      isSaved: isSaved,
      isLoaded: isLoaded,
    );
  }
}

// ignore: unused_element
const $NotificationSettingsState = _$NotificationSettingsStateTearOff();

mixin _$NotificationSettingsState {
  @nullable
  NotificationSettings get notificationSettings;
  @nullable
  bool get isSaved;
  @nullable
  bool get isLoaded;

  $NotificationSettingsStateCopyWith<NotificationSettingsState> get copyWith;
}

abstract class $NotificationSettingsStateCopyWith<$Res> {
  factory $NotificationSettingsStateCopyWith(NotificationSettingsState value,
          $Res Function(NotificationSettingsState) then) =
      _$NotificationSettingsStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable NotificationSettings notificationSettings,
      @nullable bool isSaved,
      @nullable bool isLoaded});

  $NotificationSettingsCopyWith<$Res> get notificationSettings;
}

class _$NotificationSettingsStateCopyWithImpl<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  _$NotificationSettingsStateCopyWithImpl(this._value, this._then);

  final NotificationSettingsState _value;
  // ignore: unused_field
  final $Res Function(NotificationSettingsState) _then;

  @override
  $Res call({
    Object notificationSettings = freezed,
    Object isSaved = freezed,
    Object isLoaded = freezed,
  }) {
    return _then(_value.copyWith(
      notificationSettings: notificationSettings == freezed
          ? _value.notificationSettings
          : notificationSettings as NotificationSettings,
      isSaved: isSaved == freezed ? _value.isSaved : isSaved as bool,
      isLoaded: isLoaded == freezed ? _value.isLoaded : isLoaded as bool,
    ));
  }

  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings {
    if (_value.notificationSettings == null) {
      return null;
    }
    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings,
        (value) {
      return _then(_value.copyWith(notificationSettings: value));
    });
  }
}

abstract class _$NotificationSettingsStateCopyWith<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  factory _$NotificationSettingsStateCopyWith(_NotificationSettingsState value,
          $Res Function(_NotificationSettingsState) then) =
      __$NotificationSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable NotificationSettings notificationSettings,
      @nullable bool isSaved,
      @nullable bool isLoaded});

  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
}

class __$NotificationSettingsStateCopyWithImpl<$Res>
    extends _$NotificationSettingsStateCopyWithImpl<$Res>
    implements _$NotificationSettingsStateCopyWith<$Res> {
  __$NotificationSettingsStateCopyWithImpl(_NotificationSettingsState _value,
      $Res Function(_NotificationSettingsState) _then)
      : super(_value, (v) => _then(v as _NotificationSettingsState));

  @override
  _NotificationSettingsState get _value =>
      super._value as _NotificationSettingsState;

  @override
  $Res call({
    Object notificationSettings = freezed,
    Object isSaved = freezed,
    Object isLoaded = freezed,
  }) {
    return _then(_NotificationSettingsState(
      notificationSettings: notificationSettings == freezed
          ? _value.notificationSettings
          : notificationSettings as NotificationSettings,
      isSaved: isSaved == freezed ? _value.isSaved : isSaved as bool,
      isLoaded: isLoaded == freezed ? _value.isLoaded : isLoaded as bool,
    ));
  }
}

class _$_NotificationSettingsState
    with DiagnosticableTreeMixin
    implements _NotificationSettingsState {
  const _$_NotificationSettingsState(
      {@required @nullable this.notificationSettings,
      @required @nullable this.isSaved,
      @required @nullable this.isLoaded});

  @override
  @nullable
  final NotificationSettings notificationSettings;
  @override
  @nullable
  final bool isSaved;
  @override
  @nullable
  final bool isLoaded;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSettingsState(notificationSettings: $notificationSettings, isSaved: $isSaved, isLoaded: $isLoaded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationSettingsState'))
      ..add(DiagnosticsProperty('notificationSettings', notificationSettings))
      ..add(DiagnosticsProperty('isSaved', isSaved))
      ..add(DiagnosticsProperty('isLoaded', isLoaded));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationSettingsState &&
            (identical(other.notificationSettings, notificationSettings) ||
                const DeepCollectionEquality().equals(
                    other.notificationSettings, notificationSettings)) &&
            (identical(other.isSaved, isSaved) ||
                const DeepCollectionEquality()
                    .equals(other.isSaved, isSaved)) &&
            (identical(other.isLoaded, isLoaded) ||
                const DeepCollectionEquality()
                    .equals(other.isLoaded, isLoaded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notificationSettings) ^
      const DeepCollectionEquality().hash(isSaved) ^
      const DeepCollectionEquality().hash(isLoaded);

  @override
  _$NotificationSettingsStateCopyWith<_NotificationSettingsState>
      get copyWith =>
          __$NotificationSettingsStateCopyWithImpl<_NotificationSettingsState>(
              this, _$identity);
}

abstract class _NotificationSettingsState implements NotificationSettingsState {
  const factory _NotificationSettingsState(
      {@required @nullable NotificationSettings notificationSettings,
      @required @nullable bool isSaved,
      @required @nullable bool isLoaded}) = _$_NotificationSettingsState;

  @override
  @nullable
  NotificationSettings get notificationSettings;
  @override
  @nullable
  bool get isSaved;
  @override
  @nullable
  bool get isLoaded;
  @override
  _$NotificationSettingsStateCopyWith<_NotificationSettingsState> get copyWith;
}
