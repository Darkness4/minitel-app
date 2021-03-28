// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'imprimante_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
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

/// @nodoc
const $ImprimanteStatusState = _$ImprimanteStatusStateTearOff();

/// @nodoc
mixin _$ImprimanteStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool success) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool success)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImprimanteStatusInitial value) initial,
    required TResult Function(ImprimanteStatusLoading value) loading,
    required TResult Function(ImprimanteStatusError value) error,
    required TResult Function(ImprimanteStatusLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImprimanteStatusInitial value)? initial,
    TResult Function(ImprimanteStatusLoading value)? loading,
    TResult Function(ImprimanteStatusError value)? error,
    TResult Function(ImprimanteStatusLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImprimanteStatusStateCopyWith<$Res> {
  factory $ImprimanteStatusStateCopyWith(ImprimanteStatusState value,
          $Res Function(ImprimanteStatusState) then) =
      _$ImprimanteStatusStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusStateCopyWith<$Res> {
  _$ImprimanteStatusStateCopyWithImpl(this._value, this._then);

  final ImprimanteStatusState _value;
  // ignore: unused_field
  final $Res Function(ImprimanteStatusState) _then;
}

/// @nodoc
abstract class $ImprimanteStatusInitialCopyWith<$Res> {
  factory $ImprimanteStatusInitialCopyWith(ImprimanteStatusInitial value,
          $Res Function(ImprimanteStatusInitial) then) =
      _$ImprimanteStatusInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImprimanteStatusInitialCopyWithImpl<$Res>
    extends _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusInitialCopyWith<$Res> {
  _$ImprimanteStatusInitialCopyWithImpl(ImprimanteStatusInitial _value,
      $Res Function(ImprimanteStatusInitial) _then)
      : super(_value, (v) => _then(v as ImprimanteStatusInitial));

  @override
  ImprimanteStatusInitial get _value => super._value as ImprimanteStatusInitial;
}

/// @nodoc
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool success) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool success)? loaded,
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
    required TResult Function(ImprimanteStatusInitial value) initial,
    required TResult Function(ImprimanteStatusLoading value) loading,
    required TResult Function(ImprimanteStatusError value) error,
    required TResult Function(ImprimanteStatusLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImprimanteStatusInitial value)? initial,
    TResult Function(ImprimanteStatusLoading value)? loading,
    TResult Function(ImprimanteStatusError value)? error,
    TResult Function(ImprimanteStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusInitial implements ImprimanteStatusState {
  const factory ImprimanteStatusInitial() = _$ImprimanteStatusInitial;
}

/// @nodoc
abstract class $ImprimanteStatusLoadingCopyWith<$Res> {
  factory $ImprimanteStatusLoadingCopyWith(ImprimanteStatusLoading value,
          $Res Function(ImprimanteStatusLoading) then) =
      _$ImprimanteStatusLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImprimanteStatusLoadingCopyWithImpl<$Res>
    extends _$ImprimanteStatusStateCopyWithImpl<$Res>
    implements $ImprimanteStatusLoadingCopyWith<$Res> {
  _$ImprimanteStatusLoadingCopyWithImpl(ImprimanteStatusLoading _value,
      $Res Function(ImprimanteStatusLoading) _then)
      : super(_value, (v) => _then(v as ImprimanteStatusLoading));

  @override
  ImprimanteStatusLoading get _value => super._value as ImprimanteStatusLoading;
}

/// @nodoc
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool success) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool success)? loaded,
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
    required TResult Function(ImprimanteStatusInitial value) initial,
    required TResult Function(ImprimanteStatusLoading value) loading,
    required TResult Function(ImprimanteStatusError value) error,
    required TResult Function(ImprimanteStatusLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImprimanteStatusInitial value)? initial,
    TResult Function(ImprimanteStatusLoading value)? loading,
    TResult Function(ImprimanteStatusError value)? error,
    TResult Function(ImprimanteStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusLoading implements ImprimanteStatusState {
  const factory ImprimanteStatusLoading() = _$ImprimanteStatusLoading;
}

/// @nodoc
abstract class $ImprimanteStatusErrorCopyWith<$Res> {
  factory $ImprimanteStatusErrorCopyWith(ImprimanteStatusError value,
          $Res Function(ImprimanteStatusError) then) =
      _$ImprimanteStatusErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
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
    Object? e = freezed,
  }) {
    return _then(ImprimanteStatusError(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$ImprimanteStatusError implements ImprimanteStatusError {
  const _$ImprimanteStatusError(this.e);

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

  @JsonKey(ignore: true)
  @override
  $ImprimanteStatusErrorCopyWith<ImprimanteStatusError> get copyWith =>
      _$ImprimanteStatusErrorCopyWithImpl<ImprimanteStatusError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool success) loaded,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool success)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImprimanteStatusInitial value) initial,
    required TResult Function(ImprimanteStatusLoading value) loading,
    required TResult Function(ImprimanteStatusError value) error,
    required TResult Function(ImprimanteStatusLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImprimanteStatusInitial value)? initial,
    TResult Function(ImprimanteStatusLoading value)? loading,
    TResult Function(ImprimanteStatusError value)? error,
    TResult Function(ImprimanteStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusError implements ImprimanteStatusState {
  const factory ImprimanteStatusError(Exception e) = _$ImprimanteStatusError;

  Exception get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImprimanteStatusErrorCopyWith<ImprimanteStatusError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImprimanteStatusLoadedCopyWith<$Res> {
  factory $ImprimanteStatusLoadedCopyWith(ImprimanteStatusLoaded value,
          $Res Function(ImprimanteStatusLoaded) then) =
      _$ImprimanteStatusLoadedCopyWithImpl<$Res>;
  $Res call({bool success});
}

/// @nodoc
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
    Object? success = freezed,
  }) {
    return _then(ImprimanteStatusLoaded(
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$ImprimanteStatusLoaded implements ImprimanteStatusLoaded {
  const _$ImprimanteStatusLoaded(this.success);

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

  @JsonKey(ignore: true)
  @override
  $ImprimanteStatusLoadedCopyWith<ImprimanteStatusLoaded> get copyWith =>
      _$ImprimanteStatusLoadedCopyWithImpl<ImprimanteStatusLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool success) loaded,
  }) {
    return loaded(success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool success)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImprimanteStatusInitial value) initial,
    required TResult Function(ImprimanteStatusLoading value) loading,
    required TResult Function(ImprimanteStatusError value) error,
    required TResult Function(ImprimanteStatusLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImprimanteStatusInitial value)? initial,
    TResult Function(ImprimanteStatusLoading value)? loading,
    TResult Function(ImprimanteStatusError value)? error,
    TResult Function(ImprimanteStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ImprimanteStatusLoaded implements ImprimanteStatusState {
  const factory ImprimanteStatusLoaded(bool success) = _$ImprimanteStatusLoaded;

  bool get success => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImprimanteStatusLoadedCopyWith<ImprimanteStatusLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
