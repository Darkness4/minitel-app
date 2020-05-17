// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'notification_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NotificationSettingsEventTearOff {
  const _$NotificationSettingsEventTearOff();

  NotificationSettingsLoad load() {
    return const NotificationSettingsLoad();
  }

  SaveNotificationSettings save(NotificationSettings settings) {
    return SaveNotificationSettings(
      settings,
    );
  }

  EnablingChanged enablingChanged(bool enabled) {
    return EnablingChanged(
      enabled,
    );
  }

  RangeChanged rangeChanged(Duration range) {
    return RangeChanged(
      range,
    );
  }

  EarlyChanged earlyChanged(Duration early) {
    return EarlyChanged(
      early,
    );
  }
}

// ignore: unused_element
const $NotificationSettingsEvent = _$NotificationSettingsEventTearOff();

mixin _$NotificationSettingsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result save(NotificationSettings settings),
    @required Result enablingChanged(bool enabled),
    @required Result rangeChanged(Duration range),
    @required Result earlyChanged(Duration early),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result save(NotificationSettings settings),
    Result enablingChanged(bool enabled),
    Result rangeChanged(Duration range),
    Result earlyChanged(Duration early),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(NotificationSettingsLoad value),
    @required Result save(SaveNotificationSettings value),
    @required Result enablingChanged(EnablingChanged value),
    @required Result rangeChanged(RangeChanged value),
    @required Result earlyChanged(EarlyChanged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(NotificationSettingsLoad value),
    Result save(SaveNotificationSettings value),
    Result enablingChanged(EnablingChanged value),
    Result rangeChanged(RangeChanged value),
    Result earlyChanged(EarlyChanged value),
    @required Result orElse(),
  });
}

abstract class $NotificationSettingsEventCopyWith<$Res> {
  factory $NotificationSettingsEventCopyWith(NotificationSettingsEvent value,
          $Res Function(NotificationSettingsEvent) then) =
      _$NotificationSettingsEventCopyWithImpl<$Res>;
}

class _$NotificationSettingsEventCopyWithImpl<$Res>
    implements $NotificationSettingsEventCopyWith<$Res> {
  _$NotificationSettingsEventCopyWithImpl(this._value, this._then);

  final NotificationSettingsEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationSettingsEvent) _then;
}

abstract class $NotificationSettingsLoadCopyWith<$Res> {
  factory $NotificationSettingsLoadCopyWith(NotificationSettingsLoad value,
          $Res Function(NotificationSettingsLoad) then) =
      _$NotificationSettingsLoadCopyWithImpl<$Res>;
}

class _$NotificationSettingsLoadCopyWithImpl<$Res>
    extends _$NotificationSettingsEventCopyWithImpl<$Res>
    implements $NotificationSettingsLoadCopyWith<$Res> {
  _$NotificationSettingsLoadCopyWithImpl(NotificationSettingsLoad _value,
      $Res Function(NotificationSettingsLoad) _then)
      : super(_value, (v) => _then(v as NotificationSettingsLoad));

  @override
  NotificationSettingsLoad get _value =>
      super._value as NotificationSettingsLoad;
}

class _$NotificationSettingsLoad
    with DiagnosticableTreeMixin
    implements NotificationSettingsLoad {
  const _$NotificationSettingsLoad();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSettingsEvent.load()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationSettingsEvent.load'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotificationSettingsLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result save(NotificationSettings settings),
    @required Result enablingChanged(bool enabled),
    @required Result rangeChanged(Duration range),
    @required Result earlyChanged(Duration early),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return load();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result save(NotificationSettings settings),
    Result enablingChanged(bool enabled),
    Result rangeChanged(Duration range),
    Result earlyChanged(Duration early),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(NotificationSettingsLoad value),
    @required Result save(SaveNotificationSettings value),
    @required Result enablingChanged(EnablingChanged value),
    @required Result rangeChanged(RangeChanged value),
    @required Result earlyChanged(EarlyChanged value),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return load(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(NotificationSettingsLoad value),
    Result save(SaveNotificationSettings value),
    Result enablingChanged(EnablingChanged value),
    Result rangeChanged(RangeChanged value),
    Result earlyChanged(EarlyChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class NotificationSettingsLoad implements NotificationSettingsEvent {
  const factory NotificationSettingsLoad() = _$NotificationSettingsLoad;
}

abstract class $SaveNotificationSettingsCopyWith<$Res> {
  factory $SaveNotificationSettingsCopyWith(SaveNotificationSettings value,
          $Res Function(SaveNotificationSettings) then) =
      _$SaveNotificationSettingsCopyWithImpl<$Res>;
  $Res call({NotificationSettings settings});

  $NotificationSettingsCopyWith<$Res> get settings;
}

class _$SaveNotificationSettingsCopyWithImpl<$Res>
    extends _$NotificationSettingsEventCopyWithImpl<$Res>
    implements $SaveNotificationSettingsCopyWith<$Res> {
  _$SaveNotificationSettingsCopyWithImpl(SaveNotificationSettings _value,
      $Res Function(SaveNotificationSettings) _then)
      : super(_value, (v) => _then(v as SaveNotificationSettings));

  @override
  SaveNotificationSettings get _value =>
      super._value as SaveNotificationSettings;

  @override
  $Res call({
    Object settings = freezed,
  }) {
    return _then(SaveNotificationSettings(
      settings == freezed ? _value.settings : settings as NotificationSettings,
    ));
  }

  @override
  $NotificationSettingsCopyWith<$Res> get settings {
    if (_value.settings == null) {
      return null;
    }
    return $NotificationSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

class _$SaveNotificationSettings
    with DiagnosticableTreeMixin
    implements SaveNotificationSettings {
  const _$SaveNotificationSettings(this.settings) : assert(settings != null);

  @override
  final NotificationSettings settings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSettingsEvent.save(settings: $settings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationSettingsEvent.save'))
      ..add(DiagnosticsProperty('settings', settings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveNotificationSettings &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(settings);

  @override
  $SaveNotificationSettingsCopyWith<SaveNotificationSettings> get copyWith =>
      _$SaveNotificationSettingsCopyWithImpl<SaveNotificationSettings>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result save(NotificationSettings settings),
    @required Result enablingChanged(bool enabled),
    @required Result rangeChanged(Duration range),
    @required Result earlyChanged(Duration early),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return save(settings);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result save(NotificationSettings settings),
    Result enablingChanged(bool enabled),
    Result rangeChanged(Duration range),
    Result earlyChanged(Duration early),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (save != null) {
      return save(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(NotificationSettingsLoad value),
    @required Result save(SaveNotificationSettings value),
    @required Result enablingChanged(EnablingChanged value),
    @required Result rangeChanged(RangeChanged value),
    @required Result earlyChanged(EarlyChanged value),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return save(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(NotificationSettingsLoad value),
    Result save(SaveNotificationSettings value),
    Result enablingChanged(EnablingChanged value),
    Result rangeChanged(RangeChanged value),
    Result earlyChanged(EarlyChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveNotificationSettings implements NotificationSettingsEvent {
  const factory SaveNotificationSettings(NotificationSettings settings) =
      _$SaveNotificationSettings;

  NotificationSettings get settings;
  $SaveNotificationSettingsCopyWith<SaveNotificationSettings> get copyWith;
}

abstract class $EnablingChangedCopyWith<$Res> {
  factory $EnablingChangedCopyWith(
          EnablingChanged value, $Res Function(EnablingChanged) then) =
      _$EnablingChangedCopyWithImpl<$Res>;
  $Res call({bool enabled});
}

class _$EnablingChangedCopyWithImpl<$Res>
    extends _$NotificationSettingsEventCopyWithImpl<$Res>
    implements $EnablingChangedCopyWith<$Res> {
  _$EnablingChangedCopyWithImpl(
      EnablingChanged _value, $Res Function(EnablingChanged) _then)
      : super(_value, (v) => _then(v as EnablingChanged));

  @override
  EnablingChanged get _value => super._value as EnablingChanged;

  @override
  $Res call({
    Object enabled = freezed,
  }) {
    return _then(EnablingChanged(
      enabled == freezed ? _value.enabled : enabled as bool,
    ));
  }
}

class _$EnablingChanged
    with DiagnosticableTreeMixin
    implements EnablingChanged {
  const _$EnablingChanged(this.enabled) : assert(enabled != null);

  @override
  final bool enabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSettingsEvent.enablingChanged(enabled: $enabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'NotificationSettingsEvent.enablingChanged'))
      ..add(DiagnosticsProperty('enabled', enabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnablingChanged &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(enabled);

  @override
  $EnablingChangedCopyWith<EnablingChanged> get copyWith =>
      _$EnablingChangedCopyWithImpl<EnablingChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result save(NotificationSettings settings),
    @required Result enablingChanged(bool enabled),
    @required Result rangeChanged(Duration range),
    @required Result earlyChanged(Duration early),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return enablingChanged(enabled);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result save(NotificationSettings settings),
    Result enablingChanged(bool enabled),
    Result rangeChanged(Duration range),
    Result earlyChanged(Duration early),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (enablingChanged != null) {
      return enablingChanged(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(NotificationSettingsLoad value),
    @required Result save(SaveNotificationSettings value),
    @required Result enablingChanged(EnablingChanged value),
    @required Result rangeChanged(RangeChanged value),
    @required Result earlyChanged(EarlyChanged value),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return enablingChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(NotificationSettingsLoad value),
    Result save(SaveNotificationSettings value),
    Result enablingChanged(EnablingChanged value),
    Result rangeChanged(RangeChanged value),
    Result earlyChanged(EarlyChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (enablingChanged != null) {
      return enablingChanged(this);
    }
    return orElse();
  }
}

abstract class EnablingChanged implements NotificationSettingsEvent {
  const factory EnablingChanged(bool enabled) = _$EnablingChanged;

  bool get enabled;
  $EnablingChangedCopyWith<EnablingChanged> get copyWith;
}

abstract class $RangeChangedCopyWith<$Res> {
  factory $RangeChangedCopyWith(
          RangeChanged value, $Res Function(RangeChanged) then) =
      _$RangeChangedCopyWithImpl<$Res>;
  $Res call({Duration range});
}

class _$RangeChangedCopyWithImpl<$Res>
    extends _$NotificationSettingsEventCopyWithImpl<$Res>
    implements $RangeChangedCopyWith<$Res> {
  _$RangeChangedCopyWithImpl(
      RangeChanged _value, $Res Function(RangeChanged) _then)
      : super(_value, (v) => _then(v as RangeChanged));

  @override
  RangeChanged get _value => super._value as RangeChanged;

  @override
  $Res call({
    Object range = freezed,
  }) {
    return _then(RangeChanged(
      range == freezed ? _value.range : range as Duration,
    ));
  }
}

class _$RangeChanged with DiagnosticableTreeMixin implements RangeChanged {
  const _$RangeChanged(this.range) : assert(range != null);

  @override
  final Duration range;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSettingsEvent.rangeChanged(range: $range)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'NotificationSettingsEvent.rangeChanged'))
      ..add(DiagnosticsProperty('range', range));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RangeChanged &&
            (identical(other.range, range) ||
                const DeepCollectionEquality().equals(other.range, range)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(range);

  @override
  $RangeChangedCopyWith<RangeChanged> get copyWith =>
      _$RangeChangedCopyWithImpl<RangeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result save(NotificationSettings settings),
    @required Result enablingChanged(bool enabled),
    @required Result rangeChanged(Duration range),
    @required Result earlyChanged(Duration early),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return rangeChanged(range);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result save(NotificationSettings settings),
    Result enablingChanged(bool enabled),
    Result rangeChanged(Duration range),
    Result earlyChanged(Duration early),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rangeChanged != null) {
      return rangeChanged(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(NotificationSettingsLoad value),
    @required Result save(SaveNotificationSettings value),
    @required Result enablingChanged(EnablingChanged value),
    @required Result rangeChanged(RangeChanged value),
    @required Result earlyChanged(EarlyChanged value),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return rangeChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(NotificationSettingsLoad value),
    Result save(SaveNotificationSettings value),
    Result enablingChanged(EnablingChanged value),
    Result rangeChanged(RangeChanged value),
    Result earlyChanged(EarlyChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rangeChanged != null) {
      return rangeChanged(this);
    }
    return orElse();
  }
}

abstract class RangeChanged implements NotificationSettingsEvent {
  const factory RangeChanged(Duration range) = _$RangeChanged;

  Duration get range;
  $RangeChangedCopyWith<RangeChanged> get copyWith;
}

abstract class $EarlyChangedCopyWith<$Res> {
  factory $EarlyChangedCopyWith(
          EarlyChanged value, $Res Function(EarlyChanged) then) =
      _$EarlyChangedCopyWithImpl<$Res>;
  $Res call({Duration early});
}

class _$EarlyChangedCopyWithImpl<$Res>
    extends _$NotificationSettingsEventCopyWithImpl<$Res>
    implements $EarlyChangedCopyWith<$Res> {
  _$EarlyChangedCopyWithImpl(
      EarlyChanged _value, $Res Function(EarlyChanged) _then)
      : super(_value, (v) => _then(v as EarlyChanged));

  @override
  EarlyChanged get _value => super._value as EarlyChanged;

  @override
  $Res call({
    Object early = freezed,
  }) {
    return _then(EarlyChanged(
      early == freezed ? _value.early : early as Duration,
    ));
  }
}

class _$EarlyChanged with DiagnosticableTreeMixin implements EarlyChanged {
  const _$EarlyChanged(this.early) : assert(early != null);

  @override
  final Duration early;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSettingsEvent.earlyChanged(early: $early)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'NotificationSettingsEvent.earlyChanged'))
      ..add(DiagnosticsProperty('early', early));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EarlyChanged &&
            (identical(other.early, early) ||
                const DeepCollectionEquality().equals(other.early, early)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(early);

  @override
  $EarlyChangedCopyWith<EarlyChanged> get copyWith =>
      _$EarlyChangedCopyWithImpl<EarlyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result save(NotificationSettings settings),
    @required Result enablingChanged(bool enabled),
    @required Result rangeChanged(Duration range),
    @required Result earlyChanged(Duration early),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return earlyChanged(early);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result save(NotificationSettings settings),
    Result enablingChanged(bool enabled),
    Result rangeChanged(Duration range),
    Result earlyChanged(Duration early),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (earlyChanged != null) {
      return earlyChanged(early);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(NotificationSettingsLoad value),
    @required Result save(SaveNotificationSettings value),
    @required Result enablingChanged(EnablingChanged value),
    @required Result rangeChanged(RangeChanged value),
    @required Result earlyChanged(EarlyChanged value),
  }) {
    assert(load != null);
    assert(save != null);
    assert(enablingChanged != null);
    assert(rangeChanged != null);
    assert(earlyChanged != null);
    return earlyChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(NotificationSettingsLoad value),
    Result save(SaveNotificationSettings value),
    Result enablingChanged(EnablingChanged value),
    Result rangeChanged(RangeChanged value),
    Result earlyChanged(EarlyChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (earlyChanged != null) {
      return earlyChanged(this);
    }
    return orElse();
  }
}

abstract class EarlyChanged implements NotificationSettingsEvent {
  const factory EarlyChanged(Duration early) = _$EarlyChanged;

  Duration get early;
  $EarlyChangedCopyWith<EarlyChanged> get copyWith;
}

class _$NotificationSettingsStateTearOff {
  const _$NotificationSettingsStateTearOff();

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
