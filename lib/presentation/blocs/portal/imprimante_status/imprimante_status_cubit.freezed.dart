// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'imprimante_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ImprimanteStatusStateTearOff {
  const _$ImprimanteStatusStateTearOff();

  ImprimanteStatusInitial initial() {
    return const ImprimanteStatusInitial();
  }

  ImprimanteStatusLoading loading() {
    return const ImprimanteStatusLoading();
  }

  ImprimanteStatusError error(Exception e) {
    return ImprimanteStatusError(
      e,
    );
  }

  ImprimanteStatusLoaded loaded(bool success) {
    return ImprimanteStatusLoaded(
      success,
    );
  }
}

// ignore: unused_element
const $ImprimanteStatusState = _$ImprimanteStatusStateTearOff();

mixin _$ImprimanteStatusState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(bool success),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(bool success),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ImprimanteStatusInitial value),
    @required Result loading(ImprimanteStatusLoading value),
    @required Result error(ImprimanteStatusError value),
    @required Result loaded(ImprimanteStatusLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ImprimanteStatusInitial value),
    Result loading(ImprimanteStatusLoading value),
    Result error(ImprimanteStatusError value),
    Result loaded(ImprimanteStatusLoaded value),
    @required Result orElse(),
  });
}

abstract class $ImprimanteStatusStateCopyWith<$Res> {
  factory $ImprimanteStatusStateCopyWith(ImprimanteStatusState value,
          $Res Function(ImprimanteStatusState) then) =
      _$ImprimanteStatusStateCopyWithImpl<$Res>;
}

class _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusStateCopyWith<$Res> {
  _$ImprimanteStatusStateCopyWithImpl(this._value, this._then);

  final ImprimanteStatusState _value;
  // ignore: unused_field
  final $Res Function(ImprimanteStatusState) _then;
}

abstract class $ImprimanteStatusInitialCopyWith<$Res> {
  factory $ImprimanteStatusInitialCopyWith(ImprimanteStatusInitial value,
          $Res Function(ImprimanteStatusInitial) then) =
      _$ImprimanteStatusInitialCopyWithImpl<$Res>;
}

class _$ImprimanteStatusInitialCopyWithImpl<$Res>
    extends _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusInitialCopyWith<$Res> {
  _$ImprimanteStatusInitialCopyWithImpl(ImprimanteStatusInitial _value,
      $Res Function(ImprimanteStatusInitial) _then)
      : super(_value, (v) => _then(v as ImprimanteStatusInitial));

  @override
  ImprimanteStatusInitial get _value => super._value as ImprimanteStatusInitial;
}

class _$ImprimanteStatusInitial implements ImprimanteStatusInitial {
  const _$ImprimanteStatusInitial();

  @override
  String toString() {
    return 'ImprimanteStatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImprimanteStatusInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(bool success),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(bool success),
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
    @required Result initial(ImprimanteStatusInitial value),
    @required Result loading(ImprimanteStatusLoading value),
    @required Result error(ImprimanteStatusError value),
    @required Result loaded(ImprimanteStatusLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ImprimanteStatusInitial value),
    Result loading(ImprimanteStatusLoading value),
    Result error(ImprimanteStatusError value),
    Result loaded(ImprimanteStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusInitial implements ImprimanteStatusState {
  const factory ImprimanteStatusInitial() = _$ImprimanteStatusInitial;
}

abstract class $ImprimanteStatusLoadingCopyWith<$Res> {
  factory $ImprimanteStatusLoadingCopyWith(ImprimanteStatusLoading value,
          $Res Function(ImprimanteStatusLoading) then) =
      _$ImprimanteStatusLoadingCopyWithImpl<$Res>;
}

class _$ImprimanteStatusLoadingCopyWithImpl<$Res>
    extends _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusLoadingCopyWith<$Res> {
  _$ImprimanteStatusLoadingCopyWithImpl(ImprimanteStatusLoading _value,
      $Res Function(ImprimanteStatusLoading) _then)
      : super(_value, (v) => _then(v as ImprimanteStatusLoading));

  @override
  ImprimanteStatusLoading get _value => super._value as ImprimanteStatusLoading;
}

class _$ImprimanteStatusLoading implements ImprimanteStatusLoading {
  const _$ImprimanteStatusLoading();

  @override
  String toString() {
    return 'ImprimanteStatusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImprimanteStatusLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(bool success),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(bool success),
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
    @required Result initial(ImprimanteStatusInitial value),
    @required Result loading(ImprimanteStatusLoading value),
    @required Result error(ImprimanteStatusError value),
    @required Result loaded(ImprimanteStatusLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ImprimanteStatusInitial value),
    Result loading(ImprimanteStatusLoading value),
    Result error(ImprimanteStatusError value),
    Result loaded(ImprimanteStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusLoading implements ImprimanteStatusState {
  const factory ImprimanteStatusLoading() = _$ImprimanteStatusLoading;
}

abstract class $ImprimanteStatusErrorCopyWith<$Res> {
  factory $ImprimanteStatusErrorCopyWith(ImprimanteStatusError value,
          $Res Function(ImprimanteStatusError) then) =
      _$ImprimanteStatusErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

class _$ImprimanteStatusErrorCopyWithImpl<$Res>
    extends _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusErrorCopyWith<$Res> {
  _$ImprimanteStatusErrorCopyWithImpl(
      ImprimanteStatusError _value, $Res Function(ImprimanteStatusError) _then)
      : super(_value, (v) => _then(v as ImprimanteStatusError));

  @override
  ImprimanteStatusError get _value => super._value as ImprimanteStatusError;

  @override
  $Res call({
    Object e = freezed,
  }) {
    return _then(ImprimanteStatusError(
      e == freezed ? _value.e : e as Exception,
    ));
  }
}

class _$ImprimanteStatusError implements ImprimanteStatusError {
  const _$ImprimanteStatusError(this.e) : assert(e != null);

  @override
  final Exception e;

  @override
  String toString() {
    return 'ImprimanteStatusState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImprimanteStatusError &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @override
  $ImprimanteStatusErrorCopyWith<ImprimanteStatusError> get copyWith =>
      _$ImprimanteStatusErrorCopyWithImpl<ImprimanteStatusError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(bool success),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(e);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(bool success),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ImprimanteStatusInitial value),
    @required Result loading(ImprimanteStatusLoading value),
    @required Result error(ImprimanteStatusError value),
    @required Result loaded(ImprimanteStatusLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ImprimanteStatusInitial value),
    Result loading(ImprimanteStatusLoading value),
    Result error(ImprimanteStatusError value),
    Result loaded(ImprimanteStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusError implements ImprimanteStatusState {
  const factory ImprimanteStatusError(Exception e) = _$ImprimanteStatusError;

  Exception get e;
  $ImprimanteStatusErrorCopyWith<ImprimanteStatusError> get copyWith;
}

abstract class $ImprimanteStatusLoadedCopyWith<$Res> {
  factory $ImprimanteStatusLoadedCopyWith(ImprimanteStatusLoaded value,
          $Res Function(ImprimanteStatusLoaded) then) =
      _$ImprimanteStatusLoadedCopyWithImpl<$Res>;
  $Res call({bool success});
}

class _$ImprimanteStatusLoadedCopyWithImpl<$Res>
    extends _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusLoadedCopyWith<$Res> {
  _$ImprimanteStatusLoadedCopyWithImpl(ImprimanteStatusLoaded _value,
      $Res Function(ImprimanteStatusLoaded) _then)
      : super(_value, (v) => _then(v as ImprimanteStatusLoaded));

  @override
  ImprimanteStatusLoaded get _value => super._value as ImprimanteStatusLoaded;

  @override
  $Res call({
    Object success = freezed,
  }) {
    return _then(ImprimanteStatusLoaded(
      success == freezed ? _value.success : success as bool,
    ));
  }
}

class _$ImprimanteStatusLoaded implements ImprimanteStatusLoaded {
  const _$ImprimanteStatusLoaded(this.success) : assert(success != null);

  @override
  final bool success;

  @override
  String toString() {
    return 'ImprimanteStatusState.loaded(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImprimanteStatusLoaded &&
            (identical(other.success, success) ||
                const DeepCollectionEquality().equals(other.success, success)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(success);

  @override
  $ImprimanteStatusLoadedCopyWith<ImprimanteStatusLoaded> get copyWith =>
      _$ImprimanteStatusLoadedCopyWithImpl<ImprimanteStatusLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(bool success),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(success);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(bool success),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ImprimanteStatusInitial value),
    @required Result loading(ImprimanteStatusLoading value),
    @required Result error(ImprimanteStatusError value),
    @required Result loaded(ImprimanteStatusLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ImprimanteStatusInitial value),
    Result loading(ImprimanteStatusLoading value),
    Result error(ImprimanteStatusError value),
    Result loaded(ImprimanteStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusLoaded implements ImprimanteStatusState {
  const factory ImprimanteStatusLoaded(bool success) = _$ImprimanteStatusLoaded;

  bool get success;
  $ImprimanteStatusLoadedCopyWith<ImprimanteStatusLoaded> get copyWith;
}
