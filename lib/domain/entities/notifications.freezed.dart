// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationSettingsTearOff {
  const _$NotificationSettingsTearOff();

  _NotificationSettings call(
      {Duration early = const Duration(minutes: 10),
      Duration range = const Duration(days: 30),
      bool enabled = true}) {
    return _NotificationSettings(
      early: early,
      range: range,
      enabled: enabled,
    );
  }
}

/// @nodoc
const $NotificationSettings = _$NotificationSettingsTearOff();

/// @nodoc
mixin _$NotificationSettings {
  Duration get early => throw _privateConstructorUsedError;
  Duration get range => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res>;
  $Res call({Duration early, Duration range, bool enabled});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  final NotificationSettings _value;
  // ignore: unused_field
  final $Res Function(NotificationSettings) _then;

  @override
  $Res call({
    Object? early = freezed,
    Object? range = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      early: early == freezed
          ? _value.early
          : early // ignore: cast_nullable_to_non_nullable
              as Duration,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Duration,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NotificationSettingsCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$NotificationSettingsCopyWith(_NotificationSettings value,
          $Res Function(_NotificationSettings) then) =
      __$NotificationSettingsCopyWithImpl<$Res>;
  @override
  $Res call({Duration early, Duration range, bool enabled});
}

/// @nodoc
class __$NotificationSettingsCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res>
    implements _$NotificationSettingsCopyWith<$Res> {
  __$NotificationSettingsCopyWithImpl(
      _NotificationSettings _value, $Res Function(_NotificationSettings) _then)
      : super(_value, (v) => _then(v as _NotificationSettings));

  @override
  _NotificationSettings get _value => super._value as _NotificationSettings;

  @override
  $Res call({
    Object? early = freezed,
    Object? range = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_NotificationSettings(
      early: early == freezed
          ? _value.early
          : early // ignore: cast_nullable_to_non_nullable
              as Duration,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Duration,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_NotificationSettings implements _NotificationSettings {
  const _$_NotificationSettings(
      {this.early = const Duration(minutes: 10),
      this.range = const Duration(days: 30),
      this.enabled = true});

  @JsonKey(defaultValue: const Duration(minutes: 10))
  @override
  final Duration early;
  @JsonKey(defaultValue: const Duration(days: 30))
  @override
  final Duration range;
  @JsonKey(defaultValue: true)
  @override
  final bool enabled;

  @override
  String toString() {
    return 'NotificationSettings(early: $early, range: $range, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationSettings &&
            (identical(other.early, early) ||
                const DeepCollectionEquality().equals(other.early, early)) &&
            (identical(other.range, range) ||
                const DeepCollectionEquality().equals(other.range, range)) &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(early) ^
      const DeepCollectionEquality().hash(range) ^
      const DeepCollectionEquality().hash(enabled);

  @JsonKey(ignore: true)
  @override
  _$NotificationSettingsCopyWith<_NotificationSettings> get copyWith =>
      __$NotificationSettingsCopyWithImpl<_NotificationSettings>(
          this, _$identity);
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {Duration early, Duration range, bool enabled}) = _$_NotificationSettings;

  @override
  Duration get early => throw _privateConstructorUsedError;
  @override
  Duration get range => throw _privateConstructorUsedError;
  @override
  bool get enabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationSettingsCopyWith<_NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
