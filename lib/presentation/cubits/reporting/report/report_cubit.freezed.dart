// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReportStateTearOff {
  const _$ReportStateTearOff();

// ignore: unused_element
  ReportInitial initial() {
    return const ReportInitial();
  }

// ignore: unused_element
  ReportLoading loading() {
    return const ReportLoading();
  }

// ignore: unused_element
  ReportDone done(@nullable String status) {
    return ReportDone(
      status,
    );
  }

// ignore: unused_element
  ReportError error(Exception error) {
    return ReportError(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReportState = _$ReportStateTearOff();

/// @nodoc
mixin _$ReportState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  });
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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
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
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
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
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  $Res call({@nullable String status});
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
    Object status = freezed,
  }) {
    return _then(ReportDone(
      status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
class _$ReportDone with DiagnosticableTreeMixin implements ReportDone {
  const _$ReportDone(@nullable this.status);

  @override
  @nullable
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

  @override
  $ReportDoneCopyWith<ReportDone> get copyWith =>
      _$ReportDoneCopyWithImpl<ReportDone>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return done(status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (done != null) {
      return done(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return done(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class ReportDone implements ReportState {
  const factory ReportDone(@nullable String status) = _$ReportDone;

  @nullable
  String get status;
  $ReportDoneCopyWith<ReportDone> get copyWith;
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
    Object error = freezed,
  }) {
    return _then(ReportError(
      error == freezed ? _value.error : error as Exception,
    ));
  }
}

/// @nodoc
class _$ReportError with DiagnosticableTreeMixin implements ReportError {
  const _$ReportError(this.error) : assert(error != null);

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

  @override
  $ReportErrorCopyWith<ReportError> get copyWith =>
      _$ReportErrorCopyWithImpl<ReportError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
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
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReportError implements ReportState {
  const factory ReportError(Exception error) = _$ReportError;

  Exception get error;
  $ReportErrorCopyWith<ReportError> get copyWith;
}
