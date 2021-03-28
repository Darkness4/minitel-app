// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'zabbix_hosts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ZabbixHostsStateTearOff {
  const _$ZabbixHostsStateTearOff();

  ZabbixHostsStateInitial initial() {
    return const ZabbixHostsStateInitial();
  }

  ZabbixHostsStateLoading loading() {
    return const ZabbixHostsStateLoading();
  }

  ZabbixHostsStateLoaded loaded(List<ZabbixHost> hosts) {
    return ZabbixHostsStateLoaded(
      hosts,
    );
  }

  ZabbixHostsStateError error(Exception error) {
    return ZabbixHostsStateError(
      error,
    );
  }
}

/// @nodoc
const $ZabbixHostsState = _$ZabbixHostsStateTearOff();

/// @nodoc
mixin _$ZabbixHostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ZabbixHost> hosts) loaded,
    required TResult Function(Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ZabbixHost> hosts)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZabbixHostsStateInitial value) initial,
    required TResult Function(ZabbixHostsStateLoading value) loading,
    required TResult Function(ZabbixHostsStateLoaded value) loaded,
    required TResult Function(ZabbixHostsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZabbixHostsStateInitial value)? initial,
    TResult Function(ZabbixHostsStateLoading value)? loading,
    TResult Function(ZabbixHostsStateLoaded value)? loaded,
    TResult Function(ZabbixHostsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZabbixHostsStateCopyWith<$Res> {
  factory $ZabbixHostsStateCopyWith(
          ZabbixHostsState value, $Res Function(ZabbixHostsState) then) =
      _$ZabbixHostsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateCopyWith<$Res> {
  _$ZabbixHostsStateCopyWithImpl(this._value, this._then);

  final ZabbixHostsState _value;
  // ignore: unused_field
  final $Res Function(ZabbixHostsState) _then;
}

/// @nodoc
abstract class $ZabbixHostsStateInitialCopyWith<$Res> {
  factory $ZabbixHostsStateInitialCopyWith(ZabbixHostsStateInitial value,
          $Res Function(ZabbixHostsStateInitial) then) =
      _$ZabbixHostsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZabbixHostsStateInitialCopyWithImpl<$Res>
    extends _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateInitialCopyWith<$Res> {
  _$ZabbixHostsStateInitialCopyWithImpl(ZabbixHostsStateInitial _value,
      $Res Function(ZabbixHostsStateInitial) _then)
      : super(_value, (v) => _then(v as ZabbixHostsStateInitial));

  @override
  ZabbixHostsStateInitial get _value => super._value as ZabbixHostsStateInitial;
}

/// @nodoc
class _$ZabbixHostsStateInitial
    with DiagnosticableTreeMixin
    implements ZabbixHostsStateInitial {
  const _$ZabbixHostsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ZabbixHostsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ZabbixHostsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ZabbixHostsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ZabbixHost> hosts) loaded,
    required TResult Function(Exception error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ZabbixHost> hosts)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZabbixHostsStateInitial value) initial,
    required TResult Function(ZabbixHostsStateLoading value) loading,
    required TResult Function(ZabbixHostsStateLoaded value) loaded,
    required TResult Function(ZabbixHostsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZabbixHostsStateInitial value)? initial,
    TResult Function(ZabbixHostsStateLoading value)? loading,
    TResult Function(ZabbixHostsStateLoaded value)? loaded,
    TResult Function(ZabbixHostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateInitial implements ZabbixHostsState {
  const factory ZabbixHostsStateInitial() = _$ZabbixHostsStateInitial;
}

/// @nodoc
abstract class $ZabbixHostsStateLoadingCopyWith<$Res> {
  factory $ZabbixHostsStateLoadingCopyWith(ZabbixHostsStateLoading value,
          $Res Function(ZabbixHostsStateLoading) then) =
      _$ZabbixHostsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZabbixHostsStateLoadingCopyWithImpl<$Res>
    extends _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateLoadingCopyWith<$Res> {
  _$ZabbixHostsStateLoadingCopyWithImpl(ZabbixHostsStateLoading _value,
      $Res Function(ZabbixHostsStateLoading) _then)
      : super(_value, (v) => _then(v as ZabbixHostsStateLoading));

  @override
  ZabbixHostsStateLoading get _value => super._value as ZabbixHostsStateLoading;
}

/// @nodoc
class _$ZabbixHostsStateLoading
    with DiagnosticableTreeMixin
    implements ZabbixHostsStateLoading {
  const _$ZabbixHostsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ZabbixHostsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ZabbixHostsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ZabbixHostsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ZabbixHost> hosts) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ZabbixHost> hosts)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZabbixHostsStateInitial value) initial,
    required TResult Function(ZabbixHostsStateLoading value) loading,
    required TResult Function(ZabbixHostsStateLoaded value) loaded,
    required TResult Function(ZabbixHostsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZabbixHostsStateInitial value)? initial,
    TResult Function(ZabbixHostsStateLoading value)? loading,
    TResult Function(ZabbixHostsStateLoaded value)? loaded,
    TResult Function(ZabbixHostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateLoading implements ZabbixHostsState {
  const factory ZabbixHostsStateLoading() = _$ZabbixHostsStateLoading;
}

/// @nodoc
abstract class $ZabbixHostsStateLoadedCopyWith<$Res> {
  factory $ZabbixHostsStateLoadedCopyWith(ZabbixHostsStateLoaded value,
          $Res Function(ZabbixHostsStateLoaded) then) =
      _$ZabbixHostsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<ZabbixHost> hosts});
}

/// @nodoc
class _$ZabbixHostsStateLoadedCopyWithImpl<$Res>
    extends _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateLoadedCopyWith<$Res> {
  _$ZabbixHostsStateLoadedCopyWithImpl(ZabbixHostsStateLoaded _value,
      $Res Function(ZabbixHostsStateLoaded) _then)
      : super(_value, (v) => _then(v as ZabbixHostsStateLoaded));

  @override
  ZabbixHostsStateLoaded get _value => super._value as ZabbixHostsStateLoaded;

  @override
  $Res call({
    Object? hosts = freezed,
  }) {
    return _then(ZabbixHostsStateLoaded(
      hosts == freezed
          ? _value.hosts
          : hosts // ignore: cast_nullable_to_non_nullable
              as List<ZabbixHost>,
    ));
  }
}

/// @nodoc
class _$ZabbixHostsStateLoaded
    with DiagnosticableTreeMixin
    implements ZabbixHostsStateLoaded {
  const _$ZabbixHostsStateLoaded(this.hosts);

  @override
  final List<ZabbixHost> hosts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ZabbixHostsState.loaded(hosts: $hosts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ZabbixHostsState.loaded'))
      ..add(DiagnosticsProperty('hosts', hosts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ZabbixHostsStateLoaded &&
            (identical(other.hosts, hosts) ||
                const DeepCollectionEquality().equals(other.hosts, hosts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(hosts);

  @JsonKey(ignore: true)
  @override
  $ZabbixHostsStateLoadedCopyWith<ZabbixHostsStateLoaded> get copyWith =>
      _$ZabbixHostsStateLoadedCopyWithImpl<ZabbixHostsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ZabbixHost> hosts) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loaded(hosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ZabbixHost> hosts)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(hosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZabbixHostsStateInitial value) initial,
    required TResult Function(ZabbixHostsStateLoading value) loading,
    required TResult Function(ZabbixHostsStateLoaded value) loaded,
    required TResult Function(ZabbixHostsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZabbixHostsStateInitial value)? initial,
    TResult Function(ZabbixHostsStateLoading value)? loading,
    TResult Function(ZabbixHostsStateLoaded value)? loaded,
    TResult Function(ZabbixHostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateLoaded implements ZabbixHostsState {
  const factory ZabbixHostsStateLoaded(List<ZabbixHost> hosts) =
      _$ZabbixHostsStateLoaded;

  List<ZabbixHost> get hosts => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZabbixHostsStateLoadedCopyWith<ZabbixHostsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZabbixHostsStateErrorCopyWith<$Res> {
  factory $ZabbixHostsStateErrorCopyWith(ZabbixHostsStateError value,
          $Res Function(ZabbixHostsStateError) then) =
      _$ZabbixHostsStateErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class _$ZabbixHostsStateErrorCopyWithImpl<$Res>
    extends _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateErrorCopyWith<$Res> {
  _$ZabbixHostsStateErrorCopyWithImpl(
      ZabbixHostsStateError _value, $Res Function(ZabbixHostsStateError) _then)
      : super(_value, (v) => _then(v as ZabbixHostsStateError));

  @override
  ZabbixHostsStateError get _value => super._value as ZabbixHostsStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ZabbixHostsStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$ZabbixHostsStateError
    with DiagnosticableTreeMixin
    implements ZabbixHostsStateError {
  const _$ZabbixHostsStateError(this.error);

  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ZabbixHostsState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ZabbixHostsState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ZabbixHostsStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ZabbixHostsStateErrorCopyWith<ZabbixHostsStateError> get copyWith =>
      _$ZabbixHostsStateErrorCopyWithImpl<ZabbixHostsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ZabbixHost> hosts) loaded,
    required TResult Function(Exception error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ZabbixHost> hosts)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZabbixHostsStateInitial value) initial,
    required TResult Function(ZabbixHostsStateLoading value) loading,
    required TResult Function(ZabbixHostsStateLoaded value) loaded,
    required TResult Function(ZabbixHostsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZabbixHostsStateInitial value)? initial,
    TResult Function(ZabbixHostsStateLoading value)? loading,
    TResult Function(ZabbixHostsStateLoaded value)? loaded,
    TResult Function(ZabbixHostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateError implements ZabbixHostsState {
  const factory ZabbixHostsStateError(Exception error) =
      _$ZabbixHostsStateError;

  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZabbixHostsStateErrorCopyWith<ZabbixHostsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
