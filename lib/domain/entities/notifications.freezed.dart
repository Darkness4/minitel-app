// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NotificationSettingsTearOff {
  const _$NotificationSettingsTearOff();

  _NotificationSettings call(
      {@required @nullable Duration early,
      @required @nullable Duration range,
      @required @nullable bool enabled}) {
    return _NotificationSettings(
      early: early,
      range: range,
      enabled: enabled,
    );
  }
}

// ignore: unused_element
const $NotificationSettings = _$NotificationSettingsTearOff();

mixin _$NotificationSettings {
  @nullable
  Duration get early;
  @nullable
  Duration get range;
  @nullable
  bool get enabled;

  $NotificationSettingsCopyWith<NotificationSettings> get copyWith;
}

abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res>;
  $Res call(
      {@nullable Duration early,
      @nullable Duration range,
      @nullable bool enabled});
}

class _$NotificationSettingsCopyWithImpl<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  final NotificationSettings _value;
  // ignore: unused_field
  final $Res Function(NotificationSettings) _then;

  @override
  $Res call({
    Object early = freezed,
    Object range = freezed,
    Object enabled = freezed,
  }) {
    return _then(_value.copyWith(
      early: early == freezed ? _value.early : early as Duration,
      range: range == freezed ? _value.range : range as Duration,
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

abstract class _$NotificationSettingsCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$NotificationSettingsCopyWith(_NotificationSettings value,
          $Res Function(_NotificationSettings) then) =
      __$NotificationSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable Duration early,
      @nullable Duration range,
      @nullable bool enabled});
}

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
    Object early = freezed,
    Object range = freezed,
    Object enabled = freezed,
  }) {
    return _then(_NotificationSettings(
      early: early == freezed ? _value.early : early as Duration,
      range: range == freezed ? _value.range : range as Duration,
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

class _$_NotificationSettings implements _NotificationSettings {
  const _$_NotificationSettings(
      {@required @nullable this.early,
      @required @nullable this.range,
      @required @nullable this.enabled});

  @override
  @nullable
  final Duration early;
  @override
  @nullable
  final Duration range;
  @override
  @nullable
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

  @override
  _$NotificationSettingsCopyWith<_NotificationSettings> get copyWith =>
      __$NotificationSettingsCopyWithImpl<_NotificationSettings>(
          this, _$identity);
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {@required @nullable Duration early,
      @required @nullable Duration range,
      @required @nullable bool enabled}) = _$_NotificationSettings;

  @override
  @nullable
  Duration get early;
  @override
  @nullable
  Duration get range;
  @override
  @nullable
  bool get enabled;
  @override
  _$NotificationSettingsCopyWith<_NotificationSettings> get copyWith;
}
