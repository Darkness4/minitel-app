// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'zabbix_hosts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ZabbixHostsStateTearOff {
  const _$ZabbixHostsStateTearOff();

// ignore: unused_element
  ZabbixHostsStateInitial initial() {
    return const ZabbixHostsStateInitial();
  }

// ignore: unused_element
  ZabbixHostsStateLoading loading() {
    return const ZabbixHostsStateLoading();
  }

// ignore: unused_element
  ZabbixHostsStateLoaded loaded(List<ZabbixHost> hosts) {
    return ZabbixHostsStateLoaded(
      hosts,
    );
  }

// ignore: unused_element
  ZabbixHostsStateError error(Exception error) {
    return ZabbixHostsStateError(
      error,
    );
  }
}

// ignore: unused_element
const $ZabbixHostsState = _$ZabbixHostsStateTearOff();

mixin _$ZabbixHostsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<ZabbixHost> hosts),
    @required Result error(Exception error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<ZabbixHost> hosts),
    Result error(Exception error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ZabbixHostsStateInitial value),
    @required Result loading(ZabbixHostsStateLoading value),
    @required Result loaded(ZabbixHostsStateLoaded value),
    @required Result error(ZabbixHostsStateError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ZabbixHostsStateInitial value),
    Result loading(ZabbixHostsStateLoading value),
    Result loaded(ZabbixHostsStateLoaded value),
    Result error(ZabbixHostsStateError value),
    @required Result orElse(),
  });
}

abstract class $ZabbixHostsStateCopyWith<$Res> {
  factory $ZabbixHostsStateCopyWith(
          ZabbixHostsState value, $Res Function(ZabbixHostsState) then) =
      _$ZabbixHostsStateCopyWithImpl<$Res>;
}

class _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateCopyWith<$Res> {
  _$ZabbixHostsStateCopyWithImpl(this._value, this._then);

  final ZabbixHostsState _value;
  // ignore: unused_field
  final $Res Function(ZabbixHostsState) _then;
}

abstract class $ZabbixHostsStateInitialCopyWith<$Res> {
  factory $ZabbixHostsStateInitialCopyWith(ZabbixHostsStateInitial value,
          $Res Function(ZabbixHostsStateInitial) then) =
      _$ZabbixHostsStateInitialCopyWithImpl<$Res>;
}

class _$ZabbixHostsStateInitialCopyWithImpl<$Res>
    extends _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateInitialCopyWith<$Res> {
  _$ZabbixHostsStateInitialCopyWithImpl(ZabbixHostsStateInitial _value,
      $Res Function(ZabbixHostsStateInitial) _then)
      : super(_value, (v) => _then(v as ZabbixHostsStateInitial));

  @override
  ZabbixHostsStateInitial get _value => super._value as ZabbixHostsStateInitial;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<ZabbixHost> hosts),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<ZabbixHost> hosts),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ZabbixHostsStateInitial value),
    @required Result loading(ZabbixHostsStateLoading value),
    @required Result loaded(ZabbixHostsStateLoaded value),
    @required Result error(ZabbixHostsStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ZabbixHostsStateInitial value),
    Result loading(ZabbixHostsStateLoading value),
    Result loaded(ZabbixHostsStateLoaded value),
    Result error(ZabbixHostsStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateInitial implements ZabbixHostsState {
  const factory ZabbixHostsStateInitial() = _$ZabbixHostsStateInitial;
}

abstract class $ZabbixHostsStateLoadingCopyWith<$Res> {
  factory $ZabbixHostsStateLoadingCopyWith(ZabbixHostsStateLoading value,
          $Res Function(ZabbixHostsStateLoading) then) =
      _$ZabbixHostsStateLoadingCopyWithImpl<$Res>;
}

class _$ZabbixHostsStateLoadingCopyWithImpl<$Res>
    extends _$ZabbixHostsStateCopyWithImpl<$Res>
    implements $ZabbixHostsStateLoadingCopyWith<$Res> {
  _$ZabbixHostsStateLoadingCopyWithImpl(ZabbixHostsStateLoading _value,
      $Res Function(ZabbixHostsStateLoading) _then)
      : super(_value, (v) => _then(v as ZabbixHostsStateLoading));

  @override
  ZabbixHostsStateLoading get _value => super._value as ZabbixHostsStateLoading;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<ZabbixHost> hosts),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<ZabbixHost> hosts),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ZabbixHostsStateInitial value),
    @required Result loading(ZabbixHostsStateLoading value),
    @required Result loaded(ZabbixHostsStateLoaded value),
    @required Result error(ZabbixHostsStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ZabbixHostsStateInitial value),
    Result loading(ZabbixHostsStateLoading value),
    Result loaded(ZabbixHostsStateLoaded value),
    Result error(ZabbixHostsStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateLoading implements ZabbixHostsState {
  const factory ZabbixHostsStateLoading() = _$ZabbixHostsStateLoading;
}

abstract class $ZabbixHostsStateLoadedCopyWith<$Res> {
  factory $ZabbixHostsStateLoadedCopyWith(ZabbixHostsStateLoaded value,
          $Res Function(ZabbixHostsStateLoaded) then) =
      _$ZabbixHostsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<ZabbixHost> hosts});
}

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
    Object hosts = freezed,
  }) {
    return _then(ZabbixHostsStateLoaded(
      hosts == freezed ? _value.hosts : hosts as List<ZabbixHost>,
    ));
  }
}

class _$ZabbixHostsStateLoaded
    with DiagnosticableTreeMixin
    implements ZabbixHostsStateLoaded {
  const _$ZabbixHostsStateLoaded(this.hosts) : assert(hosts != null);

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

  @override
  $ZabbixHostsStateLoadedCopyWith<ZabbixHostsStateLoaded> get copyWith =>
      _$ZabbixHostsStateLoadedCopyWithImpl<ZabbixHostsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<ZabbixHost> hosts),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(hosts);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<ZabbixHost> hosts),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(hosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ZabbixHostsStateInitial value),
    @required Result loading(ZabbixHostsStateLoading value),
    @required Result loaded(ZabbixHostsStateLoaded value),
    @required Result error(ZabbixHostsStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ZabbixHostsStateInitial value),
    Result loading(ZabbixHostsStateLoading value),
    Result loaded(ZabbixHostsStateLoaded value),
    Result error(ZabbixHostsStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateLoaded implements ZabbixHostsState {
  const factory ZabbixHostsStateLoaded(List<ZabbixHost> hosts) =
      _$ZabbixHostsStateLoaded;

  List<ZabbixHost> get hosts;
  $ZabbixHostsStateLoadedCopyWith<ZabbixHostsStateLoaded> get copyWith;
}

abstract class $ZabbixHostsStateErrorCopyWith<$Res> {
  factory $ZabbixHostsStateErrorCopyWith(ZabbixHostsStateError value,
          $Res Function(ZabbixHostsStateError) then) =
      _$ZabbixHostsStateErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

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
    Object error = freezed,
  }) {
    return _then(ZabbixHostsStateError(
      error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$ZabbixHostsStateError
    with DiagnosticableTreeMixin
    implements ZabbixHostsStateError {
  const _$ZabbixHostsStateError(this.error) : assert(error != null);

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

  @override
  $ZabbixHostsStateErrorCopyWith<ZabbixHostsStateError> get copyWith =>
      _$ZabbixHostsStateErrorCopyWithImpl<ZabbixHostsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<ZabbixHost> hosts),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<ZabbixHost> hosts),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ZabbixHostsStateInitial value),
    @required Result loading(ZabbixHostsStateLoading value),
    @required Result loaded(ZabbixHostsStateLoaded value),
    @required Result error(ZabbixHostsStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ZabbixHostsStateInitial value),
    Result loading(ZabbixHostsStateLoading value),
    Result loaded(ZabbixHostsStateLoaded value),
    Result error(ZabbixHostsStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ZabbixHostsStateError implements ZabbixHostsState {
  const factory ZabbixHostsStateError(Exception error) =
      _$ZabbixHostsStateError;

  Exception get error;
  $ZabbixHostsStateErrorCopyWith<ZabbixHostsStateError> get copyWith;
}
