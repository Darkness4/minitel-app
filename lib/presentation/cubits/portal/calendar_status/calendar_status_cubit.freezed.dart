// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarStatusStateTearOff {
  const _$CalendarStatusStateTearOff();

  CalendarStatusInitial initial() {
    return const CalendarStatusInitial();
  }

  CalendarStatusLoading loading() {
    return const CalendarStatusLoading();
  }

  CalendarStatusError error(Exception e) {
    return CalendarStatusError(
      e,
    );
  }

  CalendarStatusLoaded loaded(bool status) {
    return CalendarStatusLoaded(
      status,
    );
  }
}

/// @nodoc
const $CalendarStatusState = _$CalendarStatusStateTearOff();

/// @nodoc
mixin _$CalendarStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool status) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool status)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStatusInitial value) initial,
    required TResult Function(CalendarStatusLoading value) loading,
    required TResult Function(CalendarStatusError value) error,
    required TResult Function(CalendarStatusLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStatusInitial value)? initial,
    TResult Function(CalendarStatusLoading value)? loading,
    TResult Function(CalendarStatusError value)? error,
    TResult Function(CalendarStatusLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStatusStateCopyWith<$Res> {
  factory $CalendarStatusStateCopyWith(
          CalendarStatusState value, $Res Function(CalendarStatusState) then) =
      _$CalendarStatusStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CalendarStatusStateCopyWithImpl<$Res>
    implements $CalendarStatusStateCopyWith<$Res> {
  _$CalendarStatusStateCopyWithImpl(this._value, this._then);

  final CalendarStatusState _value;
  // ignore: unused_field
  final $Res Function(CalendarStatusState) _then;
}

/// @nodoc
abstract class $CalendarStatusInitialCopyWith<$Res> {
  factory $CalendarStatusInitialCopyWith(CalendarStatusInitial value,
          $Res Function(CalendarStatusInitial) then) =
      _$CalendarStatusInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$CalendarStatusInitialCopyWithImpl<$Res>
    extends _$CalendarStatusStateCopyWithImpl<$Res>
    implements $CalendarStatusInitialCopyWith<$Res> {
  _$CalendarStatusInitialCopyWithImpl(
      CalendarStatusInitial _value, $Res Function(CalendarStatusInitial) _then)
      : super(_value, (v) => _then(v as CalendarStatusInitial));

  @override
  CalendarStatusInitial get _value => super._value as CalendarStatusInitial;
}

/// @nodoc
class _$CalendarStatusInitial implements CalendarStatusInitial {
  const _$CalendarStatusInitial();

  @override
  String toString() {
    return 'CalendarStatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CalendarStatusInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool status) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool status)? loaded,
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
    required TResult Function(CalendarStatusInitial value) initial,
    required TResult Function(CalendarStatusLoading value) loading,
    required TResult Function(CalendarStatusError value) error,
    required TResult Function(CalendarStatusLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStatusInitial value)? initial,
    TResult Function(CalendarStatusLoading value)? loading,
    TResult Function(CalendarStatusError value)? error,
    TResult Function(CalendarStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CalendarStatusInitial implements CalendarStatusState {
  const factory CalendarStatusInitial() = _$CalendarStatusInitial;
}

/// @nodoc
abstract class $CalendarStatusLoadingCopyWith<$Res> {
  factory $CalendarStatusLoadingCopyWith(CalendarStatusLoading value,
          $Res Function(CalendarStatusLoading) then) =
      _$CalendarStatusLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CalendarStatusLoadingCopyWithImpl<$Res>
    extends _$CalendarStatusStateCopyWithImpl<$Res>
    implements $CalendarStatusLoadingCopyWith<$Res> {
  _$CalendarStatusLoadingCopyWithImpl(
      CalendarStatusLoading _value, $Res Function(CalendarStatusLoading) _then)
      : super(_value, (v) => _then(v as CalendarStatusLoading));

  @override
  CalendarStatusLoading get _value => super._value as CalendarStatusLoading;
}

/// @nodoc
class _$CalendarStatusLoading implements CalendarStatusLoading {
  const _$CalendarStatusLoading();

  @override
  String toString() {
    return 'CalendarStatusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CalendarStatusLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool status) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool status)? loaded,
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
    required TResult Function(CalendarStatusInitial value) initial,
    required TResult Function(CalendarStatusLoading value) loading,
    required TResult Function(CalendarStatusError value) error,
    required TResult Function(CalendarStatusLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStatusInitial value)? initial,
    TResult Function(CalendarStatusLoading value)? loading,
    TResult Function(CalendarStatusError value)? error,
    TResult Function(CalendarStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CalendarStatusLoading implements CalendarStatusState {
  const factory CalendarStatusLoading() = _$CalendarStatusLoading;
}

/// @nodoc
abstract class $CalendarStatusErrorCopyWith<$Res> {
  factory $CalendarStatusErrorCopyWith(
          CalendarStatusError value, $Res Function(CalendarStatusError) then) =
      _$CalendarStatusErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$CalendarStatusErrorCopyWithImpl<$Res>
    extends _$CalendarStatusStateCopyWithImpl<$Res>
    implements $CalendarStatusErrorCopyWith<$Res> {
  _$CalendarStatusErrorCopyWithImpl(
      CalendarStatusError _value, $Res Function(CalendarStatusError) _then)
      : super(_value, (v) => _then(v as CalendarStatusError));

  @override
  CalendarStatusError get _value => super._value as CalendarStatusError;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(CalendarStatusError(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$CalendarStatusError implements CalendarStatusError {
  const _$CalendarStatusError(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'CalendarStatusState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CalendarStatusError &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $CalendarStatusErrorCopyWith<CalendarStatusError> get copyWith =>
      _$CalendarStatusErrorCopyWithImpl<CalendarStatusError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool status) loaded,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool status)? loaded,
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
    required TResult Function(CalendarStatusInitial value) initial,
    required TResult Function(CalendarStatusLoading value) loading,
    required TResult Function(CalendarStatusError value) error,
    required TResult Function(CalendarStatusLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStatusInitial value)? initial,
    TResult Function(CalendarStatusLoading value)? loading,
    TResult Function(CalendarStatusError value)? error,
    TResult Function(CalendarStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CalendarStatusError implements CalendarStatusState {
  const factory CalendarStatusError(Exception e) = _$CalendarStatusError;

  Exception get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarStatusErrorCopyWith<CalendarStatusError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStatusLoadedCopyWith<$Res> {
  factory $CalendarStatusLoadedCopyWith(CalendarStatusLoaded value,
          $Res Function(CalendarStatusLoaded) then) =
      _$CalendarStatusLoadedCopyWithImpl<$Res>;
  $Res call({bool status});
}

/// @nodoc
class _$CalendarStatusLoadedCopyWithImpl<$Res>
    extends _$CalendarStatusStateCopyWithImpl<$Res>
    implements $CalendarStatusLoadedCopyWith<$Res> {
  _$CalendarStatusLoadedCopyWithImpl(
      CalendarStatusLoaded _value, $Res Function(CalendarStatusLoaded) _then)
      : super(_value, (v) => _then(v as CalendarStatusLoaded));

  @override
  CalendarStatusLoaded get _value => super._value as CalendarStatusLoaded;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(CalendarStatusLoaded(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$CalendarStatusLoaded implements CalendarStatusLoaded {
  const _$CalendarStatusLoaded(this.status);

  @override
  final bool status;

  @override
  String toString() {
    return 'CalendarStatusState.loaded(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CalendarStatusLoaded &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  $CalendarStatusLoadedCopyWith<CalendarStatusLoaded> get copyWith =>
      _$CalendarStatusLoadedCopyWithImpl<CalendarStatusLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(bool status) loaded,
  }) {
    return loaded(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(bool status)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStatusInitial value) initial,
    required TResult Function(CalendarStatusLoading value) loading,
    required TResult Function(CalendarStatusError value) error,
    required TResult Function(CalendarStatusLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStatusInitial value)? initial,
    TResult Function(CalendarStatusLoading value)? loading,
    TResult Function(CalendarStatusError value)? error,
    TResult Function(CalendarStatusLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CalendarStatusLoaded implements CalendarStatusState {
  const factory CalendarStatusLoaded(bool status) = _$CalendarStatusLoaded;

  bool get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarStatusLoadedCopyWith<CalendarStatusLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
