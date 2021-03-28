// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'diagnosis_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DiagnosisStateTearOff {
  const _$DiagnosisStateTearOff();

  DiagnosisInitial initial(Diagnosis diagnosis) {
    return DiagnosisInitial(
      diagnosis,
    );
  }

  DiagnosisLoading loading(Diagnosis diagnosis) {
    return DiagnosisLoading(
      diagnosis,
    );
  }

  DiagnosisLoaded loaded(Diagnosis diagnosis) {
    return DiagnosisLoaded(
      diagnosis,
    );
  }

  DiagnosisError error(Diagnosis? diagnosis, {required Exception error}) {
    return DiagnosisError(
      diagnosis,
      error: error,
    );
  }
}

/// @nodoc
const $DiagnosisState = _$DiagnosisStateTearOff();

/// @nodoc
mixin _$DiagnosisState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Diagnosis diagnosis) initial,
    required TResult Function(Diagnosis diagnosis) loading,
    required TResult Function(Diagnosis diagnosis) loaded,
    required TResult Function(Diagnosis? diagnosis, Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Diagnosis diagnosis)? initial,
    TResult Function(Diagnosis diagnosis)? loading,
    TResult Function(Diagnosis diagnosis)? loaded,
    TResult Function(Diagnosis? diagnosis, Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiagnosisInitial value) initial,
    required TResult Function(DiagnosisLoading value) loading,
    required TResult Function(DiagnosisLoaded value) loaded,
    required TResult Function(DiagnosisError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiagnosisInitial value)? initial,
    TResult Function(DiagnosisLoading value)? loading,
    TResult Function(DiagnosisLoaded value)? loaded,
    TResult Function(DiagnosisError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisStateCopyWith<$Res> {
  factory $DiagnosisStateCopyWith(
          DiagnosisState value, $Res Function(DiagnosisState) then) =
      _$DiagnosisStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DiagnosisStateCopyWithImpl<$Res>
    implements $DiagnosisStateCopyWith<$Res> {
  _$DiagnosisStateCopyWithImpl(this._value, this._then);

  final DiagnosisState _value;
  // ignore: unused_field
  final $Res Function(DiagnosisState) _then;
}

/// @nodoc
abstract class $DiagnosisInitialCopyWith<$Res> {
  factory $DiagnosisInitialCopyWith(
          DiagnosisInitial value, $Res Function(DiagnosisInitial) then) =
      _$DiagnosisInitialCopyWithImpl<$Res>;
  $Res call({Diagnosis diagnosis});
}

/// @nodoc
class _$DiagnosisInitialCopyWithImpl<$Res>
    extends _$DiagnosisStateCopyWithImpl<$Res>
    implements $DiagnosisInitialCopyWith<$Res> {
  _$DiagnosisInitialCopyWithImpl(
      DiagnosisInitial _value, $Res Function(DiagnosisInitial) _then)
      : super(_value, (v) => _then(v as DiagnosisInitial));

  @override
  DiagnosisInitial get _value => super._value as DiagnosisInitial;

  @override
  $Res call({
    Object? diagnosis = freezed,
  }) {
    return _then(DiagnosisInitial(
      diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as Diagnosis,
    ));
  }
}

/// @nodoc
class _$DiagnosisInitial
    with DiagnosticableTreeMixin
    implements DiagnosisInitial {
  const _$DiagnosisInitial(this.diagnosis);

  @override
  final Diagnosis diagnosis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiagnosisState.initial(diagnosis: $diagnosis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiagnosisState.initial'))
      ..add(DiagnosticsProperty('diagnosis', diagnosis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiagnosisInitial &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(diagnosis);

  @JsonKey(ignore: true)
  @override
  $DiagnosisInitialCopyWith<DiagnosisInitial> get copyWith =>
      _$DiagnosisInitialCopyWithImpl<DiagnosisInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Diagnosis diagnosis) initial,
    required TResult Function(Diagnosis diagnosis) loading,
    required TResult Function(Diagnosis diagnosis) loaded,
    required TResult Function(Diagnosis? diagnosis, Exception error) error,
  }) {
    return initial(diagnosis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Diagnosis diagnosis)? initial,
    TResult Function(Diagnosis diagnosis)? loading,
    TResult Function(Diagnosis diagnosis)? loaded,
    TResult Function(Diagnosis? diagnosis, Exception error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiagnosisInitial value) initial,
    required TResult Function(DiagnosisLoading value) loading,
    required TResult Function(DiagnosisLoaded value) loaded,
    required TResult Function(DiagnosisError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiagnosisInitial value)? initial,
    TResult Function(DiagnosisLoading value)? loading,
    TResult Function(DiagnosisLoaded value)? loaded,
    TResult Function(DiagnosisError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DiagnosisInitial implements DiagnosisState {
  const factory DiagnosisInitial(Diagnosis diagnosis) = _$DiagnosisInitial;

  Diagnosis get diagnosis => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisInitialCopyWith<DiagnosisInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisLoadingCopyWith<$Res> {
  factory $DiagnosisLoadingCopyWith(
          DiagnosisLoading value, $Res Function(DiagnosisLoading) then) =
      _$DiagnosisLoadingCopyWithImpl<$Res>;
  $Res call({Diagnosis diagnosis});
}

/// @nodoc
class _$DiagnosisLoadingCopyWithImpl<$Res>
    extends _$DiagnosisStateCopyWithImpl<$Res>
    implements $DiagnosisLoadingCopyWith<$Res> {
  _$DiagnosisLoadingCopyWithImpl(
      DiagnosisLoading _value, $Res Function(DiagnosisLoading) _then)
      : super(_value, (v) => _then(v as DiagnosisLoading));

  @override
  DiagnosisLoading get _value => super._value as DiagnosisLoading;

  @override
  $Res call({
    Object? diagnosis = freezed,
  }) {
    return _then(DiagnosisLoading(
      diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as Diagnosis,
    ));
  }
}

/// @nodoc
class _$DiagnosisLoading
    with DiagnosticableTreeMixin
    implements DiagnosisLoading {
  const _$DiagnosisLoading(this.diagnosis);

  @override
  final Diagnosis diagnosis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiagnosisState.loading(diagnosis: $diagnosis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiagnosisState.loading'))
      ..add(DiagnosticsProperty('diagnosis', diagnosis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiagnosisLoading &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(diagnosis);

  @JsonKey(ignore: true)
  @override
  $DiagnosisLoadingCopyWith<DiagnosisLoading> get copyWith =>
      _$DiagnosisLoadingCopyWithImpl<DiagnosisLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Diagnosis diagnosis) initial,
    required TResult Function(Diagnosis diagnosis) loading,
    required TResult Function(Diagnosis diagnosis) loaded,
    required TResult Function(Diagnosis? diagnosis, Exception error) error,
  }) {
    return loading(diagnosis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Diagnosis diagnosis)? initial,
    TResult Function(Diagnosis diagnosis)? loading,
    TResult Function(Diagnosis diagnosis)? loaded,
    TResult Function(Diagnosis? diagnosis, Exception error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiagnosisInitial value) initial,
    required TResult Function(DiagnosisLoading value) loading,
    required TResult Function(DiagnosisLoaded value) loaded,
    required TResult Function(DiagnosisError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiagnosisInitial value)? initial,
    TResult Function(DiagnosisLoading value)? loading,
    TResult Function(DiagnosisLoaded value)? loaded,
    TResult Function(DiagnosisError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DiagnosisLoading implements DiagnosisState {
  const factory DiagnosisLoading(Diagnosis diagnosis) = _$DiagnosisLoading;

  Diagnosis get diagnosis => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisLoadingCopyWith<DiagnosisLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisLoadedCopyWith<$Res> {
  factory $DiagnosisLoadedCopyWith(
          DiagnosisLoaded value, $Res Function(DiagnosisLoaded) then) =
      _$DiagnosisLoadedCopyWithImpl<$Res>;
  $Res call({Diagnosis diagnosis});
}

/// @nodoc
class _$DiagnosisLoadedCopyWithImpl<$Res>
    extends _$DiagnosisStateCopyWithImpl<$Res>
    implements $DiagnosisLoadedCopyWith<$Res> {
  _$DiagnosisLoadedCopyWithImpl(
      DiagnosisLoaded _value, $Res Function(DiagnosisLoaded) _then)
      : super(_value, (v) => _then(v as DiagnosisLoaded));

  @override
  DiagnosisLoaded get _value => super._value as DiagnosisLoaded;

  @override
  $Res call({
    Object? diagnosis = freezed,
  }) {
    return _then(DiagnosisLoaded(
      diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as Diagnosis,
    ));
  }
}

/// @nodoc
class _$DiagnosisLoaded
    with DiagnosticableTreeMixin
    implements DiagnosisLoaded {
  const _$DiagnosisLoaded(this.diagnosis);

  @override
  final Diagnosis diagnosis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiagnosisState.loaded(diagnosis: $diagnosis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiagnosisState.loaded'))
      ..add(DiagnosticsProperty('diagnosis', diagnosis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiagnosisLoaded &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(diagnosis);

  @JsonKey(ignore: true)
  @override
  $DiagnosisLoadedCopyWith<DiagnosisLoaded> get copyWith =>
      _$DiagnosisLoadedCopyWithImpl<DiagnosisLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Diagnosis diagnosis) initial,
    required TResult Function(Diagnosis diagnosis) loading,
    required TResult Function(Diagnosis diagnosis) loaded,
    required TResult Function(Diagnosis? diagnosis, Exception error) error,
  }) {
    return loaded(diagnosis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Diagnosis diagnosis)? initial,
    TResult Function(Diagnosis diagnosis)? loading,
    TResult Function(Diagnosis diagnosis)? loaded,
    TResult Function(Diagnosis? diagnosis, Exception error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiagnosisInitial value) initial,
    required TResult Function(DiagnosisLoading value) loading,
    required TResult Function(DiagnosisLoaded value) loaded,
    required TResult Function(DiagnosisError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiagnosisInitial value)? initial,
    TResult Function(DiagnosisLoading value)? loading,
    TResult Function(DiagnosisLoaded value)? loaded,
    TResult Function(DiagnosisError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DiagnosisLoaded implements DiagnosisState {
  const factory DiagnosisLoaded(Diagnosis diagnosis) = _$DiagnosisLoaded;

  Diagnosis get diagnosis => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisLoadedCopyWith<DiagnosisLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisErrorCopyWith<$Res> {
  factory $DiagnosisErrorCopyWith(
          DiagnosisError value, $Res Function(DiagnosisError) then) =
      _$DiagnosisErrorCopyWithImpl<$Res>;
  $Res call({Diagnosis? diagnosis, Exception error});
}

/// @nodoc
class _$DiagnosisErrorCopyWithImpl<$Res>
    extends _$DiagnosisStateCopyWithImpl<$Res>
    implements $DiagnosisErrorCopyWith<$Res> {
  _$DiagnosisErrorCopyWithImpl(
      DiagnosisError _value, $Res Function(DiagnosisError) _then)
      : super(_value, (v) => _then(v as DiagnosisError));

  @override
  DiagnosisError get _value => super._value as DiagnosisError;

  @override
  $Res call({
    Object? diagnosis = freezed,
    Object? error = freezed,
  }) {
    return _then(DiagnosisError(
      diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as Diagnosis?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$DiagnosisError with DiagnosticableTreeMixin implements DiagnosisError {
  const _$DiagnosisError(this.diagnosis, {required this.error});

  @override
  final Diagnosis? diagnosis;
  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiagnosisState.error(diagnosis: $diagnosis, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiagnosisState.error'))
      ..add(DiagnosticsProperty('diagnosis', diagnosis))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiagnosisError &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(diagnosis) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $DiagnosisErrorCopyWith<DiagnosisError> get copyWith =>
      _$DiagnosisErrorCopyWithImpl<DiagnosisError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Diagnosis diagnosis) initial,
    required TResult Function(Diagnosis diagnosis) loading,
    required TResult Function(Diagnosis diagnosis) loaded,
    required TResult Function(Diagnosis? diagnosis, Exception error) error,
  }) {
    return error(diagnosis, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Diagnosis diagnosis)? initial,
    TResult Function(Diagnosis diagnosis)? loading,
    TResult Function(Diagnosis diagnosis)? loaded,
    TResult Function(Diagnosis? diagnosis, Exception error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(diagnosis, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiagnosisInitial value) initial,
    required TResult Function(DiagnosisLoading value) loading,
    required TResult Function(DiagnosisLoaded value) loaded,
    required TResult Function(DiagnosisError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiagnosisInitial value)? initial,
    TResult Function(DiagnosisLoading value)? loading,
    TResult Function(DiagnosisLoaded value)? loaded,
    TResult Function(DiagnosisError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DiagnosisError implements DiagnosisState {
  const factory DiagnosisError(Diagnosis? diagnosis,
      {required Exception error}) = _$DiagnosisError;

  Diagnosis? get diagnosis => throw _privateConstructorUsedError;
  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisErrorCopyWith<DiagnosisError> get copyWith =>
      throw _privateConstructorUsedError;
}
