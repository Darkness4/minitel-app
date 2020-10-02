// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stormshield_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StormshieldStatusStateTearOff {
  const _$StormshieldStatusStateTearOff();

// ignore: unused_element
  StormshieldStatusInitial initial() {
    return const StormshieldStatusInitial();
  }

// ignore: unused_element
  StormshieldStatusLoading loading() {
    return const StormshieldStatusLoading();
  }

// ignore: unused_element
  StormshieldStatusError error(Exception e) {
    return StormshieldStatusError(
      e,
    );
  }

// ignore: unused_element
  StormshieldStatusLoaded loaded(String status) {
    return StormshieldStatusLoaded(
      status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StormshieldStatusState = _$StormshieldStatusStateTearOff();

/// @nodoc
mixin _$StormshieldStatusState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(String status),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(String status),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(StormshieldStatusInitial value),
    @required Result loading(StormshieldStatusLoading value),
    @required Result error(StormshieldStatusError value),
    @required Result loaded(StormshieldStatusLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(StormshieldStatusInitial value),
    Result loading(StormshieldStatusLoading value),
    Result error(StormshieldStatusError value),
    Result loaded(StormshieldStatusLoaded value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $StormshieldStatusStateCopyWith<$Res> {
  factory $StormshieldStatusStateCopyWith(StormshieldStatusState value,
          $Res Function(StormshieldStatusState) then) =
      _$StormshieldStatusStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$StormshieldStatusStateCopyWithImpl<$Res>
    implements $StormshieldStatusStateCopyWith<$Res> {
  _$StormshieldStatusStateCopyWithImpl(this._value, this._then);

  final StormshieldStatusState _value;
  // ignore: unused_field
  final $Res Function(StormshieldStatusState) _then;
}

/// @nodoc
abstract class $StormshieldStatusInitialCopyWith<$Res> {
  factory $StormshieldStatusInitialCopyWith(StormshieldStatusInitial value,
          $Res Function(StormshieldStatusInitial) then) =
      _$StormshieldStatusInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$StormshieldStatusInitialCopyWithImpl<$Res>
    extends _$StormshieldStatusStateCopyWithImpl<$Res>
    implements $StormshieldStatusInitialCopyWith<$Res> {
  _$StormshieldStatusInitialCopyWithImpl(StormshieldStatusInitial _value,
      $Res Function(StormshieldStatusInitial) _then)
      : super(_value, (v) => _then(v as StormshieldStatusInitial));

  @override
  StormshieldStatusInitial get _value =>
      super._value as StormshieldStatusInitial;
}

/// @nodoc
class _$StormshieldStatusInitial implements StormshieldStatusInitial {
  const _$StormshieldStatusInitial();

  @override
  String toString() {
    return 'StormshieldStatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StormshieldStatusInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(String status),
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
    Result loaded(String status),
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
    @required Result initial(StormshieldStatusInitial value),
    @required Result loading(StormshieldStatusLoading value),
    @required Result error(StormshieldStatusError value),
    @required Result loaded(StormshieldStatusLoaded value),
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
    Result initial(StormshieldStatusInitial value),
    Result loading(StormshieldStatusLoading value),
    Result error(StormshieldStatusError value),
    Result loaded(StormshieldStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StormshieldStatusInitial implements StormshieldStatusState {
  const factory StormshieldStatusInitial() = _$StormshieldStatusInitial;
}

/// @nodoc
abstract class $StormshieldStatusLoadingCopyWith<$Res> {
  factory $StormshieldStatusLoadingCopyWith(StormshieldStatusLoading value,
          $Res Function(StormshieldStatusLoading) then) =
      _$StormshieldStatusLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$StormshieldStatusLoadingCopyWithImpl<$Res>
    extends _$StormshieldStatusStateCopyWithImpl<$Res>
    implements $StormshieldStatusLoadingCopyWith<$Res> {
  _$StormshieldStatusLoadingCopyWithImpl(StormshieldStatusLoading _value,
      $Res Function(StormshieldStatusLoading) _then)
      : super(_value, (v) => _then(v as StormshieldStatusLoading));

  @override
  StormshieldStatusLoading get _value =>
      super._value as StormshieldStatusLoading;
}

/// @nodoc
class _$StormshieldStatusLoading implements StormshieldStatusLoading {
  const _$StormshieldStatusLoading();

  @override
  String toString() {
    return 'StormshieldStatusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StormshieldStatusLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(String status),
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
    Result loaded(String status),
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
    @required Result initial(StormshieldStatusInitial value),
    @required Result loading(StormshieldStatusLoading value),
    @required Result error(StormshieldStatusError value),
    @required Result loaded(StormshieldStatusLoaded value),
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
    Result initial(StormshieldStatusInitial value),
    Result loading(StormshieldStatusLoading value),
    Result error(StormshieldStatusError value),
    Result loaded(StormshieldStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StormshieldStatusLoading implements StormshieldStatusState {
  const factory StormshieldStatusLoading() = _$StormshieldStatusLoading;
}

/// @nodoc
abstract class $StormshieldStatusErrorCopyWith<$Res> {
  factory $StormshieldStatusErrorCopyWith(StormshieldStatusError value,
          $Res Function(StormshieldStatusError) then) =
      _$StormshieldStatusErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$StormshieldStatusErrorCopyWithImpl<$Res>
    extends _$StormshieldStatusStateCopyWithImpl<$Res>
    implements $StormshieldStatusErrorCopyWith<$Res> {
  _$StormshieldStatusErrorCopyWithImpl(StormshieldStatusError _value,
      $Res Function(StormshieldStatusError) _then)
      : super(_value, (v) => _then(v as StormshieldStatusError));

  @override
  StormshieldStatusError get _value => super._value as StormshieldStatusError;

  @override
  $Res call({
    Object e = freezed,
  }) {
    return _then(StormshieldStatusError(
      e == freezed ? _value.e : e as Exception,
    ));
  }
}

/// @nodoc
class _$StormshieldStatusError implements StormshieldStatusError {
  const _$StormshieldStatusError(this.e) : assert(e != null);

  @override
  final Exception e;

  @override
  String toString() {
    return 'StormshieldStatusState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StormshieldStatusError &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @override
  $StormshieldStatusErrorCopyWith<StormshieldStatusError> get copyWith =>
      _$StormshieldStatusErrorCopyWithImpl<StormshieldStatusError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(String status),
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
    Result loaded(String status),
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
    @required Result initial(StormshieldStatusInitial value),
    @required Result loading(StormshieldStatusLoading value),
    @required Result error(StormshieldStatusError value),
    @required Result loaded(StormshieldStatusLoaded value),
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
    Result initial(StormshieldStatusInitial value),
    Result loading(StormshieldStatusLoading value),
    Result error(StormshieldStatusError value),
    Result loaded(StormshieldStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StormshieldStatusError implements StormshieldStatusState {
  const factory StormshieldStatusError(Exception e) = _$StormshieldStatusError;

  Exception get e;
  $StormshieldStatusErrorCopyWith<StormshieldStatusError> get copyWith;
}

/// @nodoc
abstract class $StormshieldStatusLoadedCopyWith<$Res> {
  factory $StormshieldStatusLoadedCopyWith(StormshieldStatusLoaded value,
          $Res Function(StormshieldStatusLoaded) then) =
      _$StormshieldStatusLoadedCopyWithImpl<$Res>;
  $Res call({String status});
}

/// @nodoc
class _$StormshieldStatusLoadedCopyWithImpl<$Res>
    extends _$StormshieldStatusStateCopyWithImpl<$Res>
    implements $StormshieldStatusLoadedCopyWith<$Res> {
  _$StormshieldStatusLoadedCopyWithImpl(StormshieldStatusLoaded _value,
      $Res Function(StormshieldStatusLoaded) _then)
      : super(_value, (v) => _then(v as StormshieldStatusLoaded));

  @override
  StormshieldStatusLoaded get _value => super._value as StormshieldStatusLoaded;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(StormshieldStatusLoaded(
      status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
class _$StormshieldStatusLoaded implements StormshieldStatusLoaded {
  const _$StormshieldStatusLoaded(this.status) : assert(status != null);

  @override
  final String status;

  @override
  String toString() {
    return 'StormshieldStatusState.loaded(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StormshieldStatusLoaded &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @override
  $StormshieldStatusLoadedCopyWith<StormshieldStatusLoaded> get copyWith =>
      _$StormshieldStatusLoadedCopyWithImpl<StormshieldStatusLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception e),
    @required Result loaded(String status),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception e),
    Result loaded(String status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(StormshieldStatusInitial value),
    @required Result loading(StormshieldStatusLoading value),
    @required Result error(StormshieldStatusError value),
    @required Result loaded(StormshieldStatusLoaded value),
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
    Result initial(StormshieldStatusInitial value),
    Result loading(StormshieldStatusLoading value),
    Result error(StormshieldStatusError value),
    Result loaded(StormshieldStatusLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StormshieldStatusLoaded implements StormshieldStatusState {
  const factory StormshieldStatusLoaded(String status) =
      _$StormshieldStatusLoaded;

  String get status;
  $StormshieldStatusLoadedCopyWith<StormshieldStatusLoaded> get copyWith;
}
