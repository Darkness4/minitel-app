// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationSettingsStateTearOff {
  const _$NotificationSettingsStateTearOff();

  _NotificationSettingsState call(
      {required NotificationSettings notificationSettings,
      required bool isSaved,
      required bool isLoaded}) {
    return _NotificationSettingsState(
      notificationSettings: notificationSettings,
      isSaved: isSaved,
      isLoaded: isLoaded,
    );
  }
}

/// @nodoc
const $NotificationSettingsState = _$NotificationSettingsStateTearOff();

/// @nodoc
mixin _$NotificationSettingsState {
  NotificationSettings get notificationSettings =>
      throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  bool get isLoaded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationSettingsStateCopyWith<NotificationSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsStateCopyWith<$Res> {
  factory $NotificationSettingsStateCopyWith(NotificationSettingsState value,
          $Res Function(NotificationSettingsState) then) =
      _$NotificationSettingsStateCopyWithImpl<$Res>;
  $Res call(
      {NotificationSettings notificationSettings, bool isSaved, bool isLoaded});

  $NotificationSettingsCopyWith<$Res> get notificationSettings;
}

/// @nodoc
class _$NotificationSettingsStateCopyWithImpl<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  _$NotificationSettingsStateCopyWithImpl(this._value, this._then);

  final NotificationSettingsState _value;
  // ignore: unused_field
  final $Res Function(NotificationSettingsState) _then;

  @override
  $Res call({
    Object? notificationSettings = freezed,
    Object? isSaved = freezed,
    Object? isLoaded = freezed,
  }) {
    return _then(_value.copyWith(
      notificationSettings: notificationSettings == freezed
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoaded: isLoaded == freezed
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings {
    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings,
        (value) {
      return _then(_value.copyWith(notificationSettings: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationSettingsStateCopyWith<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  factory _$NotificationSettingsStateCopyWith(_NotificationSettingsState value,
          $Res Function(_NotificationSettingsState) then) =
      __$NotificationSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NotificationSettings notificationSettings, bool isSaved, bool isLoaded});

  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
}

/// @nodoc
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
    Object? notificationSettings = freezed,
    Object? isSaved = freezed,
    Object? isLoaded = freezed,
  }) {
    return _then(_NotificationSettingsState(
      notificationSettings: notificationSettings == freezed
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoaded: isLoaded == freezed
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_NotificationSettingsState
    with DiagnosticableTreeMixin
    implements _NotificationSettingsState {
  const _$_NotificationSettingsState(
      {required this.notificationSettings,
      required this.isSaved,
      required this.isLoaded});

  @override
  final NotificationSettings notificationSettings;
  @override
  final bool isSaved;
  @override
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

  @JsonKey(ignore: true)
  @override
  _$NotificationSettingsStateCopyWith<_NotificationSettingsState>
      get copyWith =>
          __$NotificationSettingsStateCopyWithImpl<_NotificationSettingsState>(
              this, _$identity);
}

abstract class _NotificationSettingsState implements NotificationSettingsState {
  const factory _NotificationSettingsState(
      {required NotificationSettings notificationSettings,
      required bool isSaved,
      required bool isLoaded}) = _$_NotificationSettingsState;

  @override
  NotificationSettings get notificationSettings =>
      throw _privateConstructorUsedError;
  @override
  bool get isSaved => throw _privateConstructorUsedError;
  @override
  bool get isLoaded => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationSettingsStateCopyWith<_NotificationSettingsState>
      get copyWith => throw _privateConstructorUsedError;
}
