// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReportStateTearOff {
  const _$ReportStateTearOff();

  ReportInitial initial() {
    return const ReportInitial();
  }

  ReportLoading loading() {
    return const ReportLoading();
  }

  ReportDone done(String status) {
    return ReportDone(
      status,
    );
  }

  ReportError error(Exception error) {
    return ReportError(
      error,
    );
  }
}

/// @nodoc
const $ReportState = _$ReportStateTearOff();

/// @nodoc
mixin _$ReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String status) done,
    required TResult Function(Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String status)? done,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportInitial value) initial,
    required TResult Function(ReportLoading value) loading,
    required TResult Function(ReportDone value) done,
    required TResult Function(ReportError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportInitial value)? initial,
    TResult Function(ReportLoading value)? loading,
    TResult Function(ReportDone value)? done,
    TResult Function(ReportError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res> implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

  final ReportState _value;
  // ignore: unused_field
  final $Res Function(ReportState) _then;
}

/// @nodoc
abstract class $ReportInitialCopyWith<$Res> {
  factory $ReportInitialCopyWith(
          ReportInitial value, $Res Function(ReportInitial) then) =
      _$ReportInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReportInitialCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportInitialCopyWith<$Res> {
  _$ReportInitialCopyWithImpl(
      ReportInitial _value, $Res Function(ReportInitial) _then)
      : super(_value, (v) => _then(v as ReportInitial));

  @override
  ReportInitial get _value => super._value as ReportInitial;
}

/// @nodoc
class _$ReportInitial with DiagnosticableTreeMixin implements ReportInitial {
  const _$ReportInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ReportState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReportInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String status) done,
    required TResult Function(Exception error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String status)? done,
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
    required TResult Function(ReportInitial value) initial,
    required TResult Function(ReportLoading value) loading,
    required TResult Function(ReportDone value) done,
    required TResult Function(ReportError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportInitial value)? initial,
    TResult Function(ReportLoading value)? loading,
    TResult Function(ReportDone value)? done,
    TResult Function(ReportError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ReportInitial implements ReportState {
  const factory ReportInitial() = _$ReportInitial;
}

/// @nodoc
abstract class $ReportLoadingCopyWith<$Res> {
  factory $ReportLoadingCopyWith(
          ReportLoading value, $Res Function(ReportLoading) then) =
      _$ReportLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReportLoadingCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportLoadingCopyWith<$Res> {
  _$ReportLoadingCopyWithImpl(
      ReportLoading _value, $Res Function(ReportLoading) _then)
      : super(_value, (v) => _then(v as ReportLoading));

  @override
  ReportLoading get _value => super._value as ReportLoading;
}

/// @nodoc
class _$ReportLoading with DiagnosticableTreeMixin implements ReportLoading {
  const _$ReportLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ReportState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReportLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String status) done,
    required TResult Function(Exception error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String status)? done,
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
    required TResult Function(ReportInitial value) initial,
    required TResult Function(ReportLoading value) loading,
    required TResult Function(ReportDone value) done,
    required TResult Function(ReportError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportInitial value)? initial,
    TResult Function(ReportLoading value)? loading,
    TResult Function(ReportDone value)? done,
    TResult Function(ReportError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReportLoading implements ReportState {
  const factory ReportLoading() = _$ReportLoading;
}

/// @nodoc
abstract class $ReportDoneCopyWith<$Res> {
  factory $ReportDoneCopyWith(
          ReportDone value, $Res Function(ReportDone) then) =
      _$ReportDoneCopyWithImpl<$Res>;
  $Res call({String status});
}

/// @nodoc
class _$ReportDoneCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportDoneCopyWith<$Res> {
  _$ReportDoneCopyWithImpl(ReportDone _value, $Res Function(ReportDone) _then)
      : super(_value, (v) => _then(v as ReportDone));

  @override
  ReportDone get _value => super._value as ReportDone;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(ReportDone(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$ReportDone with DiagnosticableTreeMixin implements ReportDone {
  const _$ReportDone(this.status);

  @override
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.done(status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportState.done'))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportDone &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  $ReportDoneCopyWith<ReportDone> get copyWith =>
      _$ReportDoneCopyWithImpl<ReportDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String status) done,
    required TResult Function(Exception error) error,
  }) {
    return done(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String status)? done,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportInitial value) initial,
    required TResult Function(ReportLoading value) loading,
    required TResult Function(ReportDone value) done,
    required TResult Function(ReportError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportInitial value)? initial,
    TResult Function(ReportLoading value)? loading,
    TResult Function(ReportDone value)? done,
    TResult Function(ReportError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class ReportDone implements ReportState {
  const factory ReportDone(String status) = _$ReportDone;

  String get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDoneCopyWith<ReportDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportErrorCopyWith<$Res> {
  factory $ReportErrorCopyWith(
          ReportError value, $Res Function(ReportError) then) =
      _$ReportErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class _$ReportErrorCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportErrorCopyWith<$Res> {
  _$ReportErrorCopyWithImpl(
      ReportError _value, $Res Function(ReportError) _then)
      : super(_value, (v) => _then(v as ReportError));

  @override
  ReportError get _value => super._value as ReportError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ReportError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$ReportError with DiagnosticableTreeMixin implements ReportError {
  const _$ReportError(this.error);

  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ReportErrorCopyWith<ReportError> get copyWith =>
      _$ReportErrorCopyWithImpl<ReportError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String status) done,
    required TResult Function(Exception error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String status)? done,
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
    required TResult Function(ReportInitial value) initial,
    required TResult Function(ReportLoading value) loading,
    required TResult Function(ReportDone value) done,
    required TResult Function(ReportError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportInitial value)? initial,
    TResult Function(ReportLoading value)? loading,
    TResult Function(ReportDone value)? done,
    TResult Function(ReportError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReportError implements ReportState {
  const factory ReportError(Exception error) = _$ReportError;

  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportErrorCopyWith<ReportError> get copyWith =>
      throw _privateConstructorUsedError;
}
