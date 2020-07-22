// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'diagnosis_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DiagnosisStateTearOff {
  const _$DiagnosisStateTearOff();

// ignore: unused_element
  DiagnosisInitial initial(Diagnosis diagnosis) {
    return DiagnosisInitial(
      diagnosis,
    );
  }

// ignore: unused_element
  DiagnosisLoading loading(Diagnosis diagnosis) {
    return DiagnosisLoading(
      diagnosis,
    );
  }

// ignore: unused_element
  DiagnosisLoaded loaded(Diagnosis diagnosis) {
    return DiagnosisLoaded(
      diagnosis,
    );
  }

// ignore: unused_element
  DiagnosisError error(@nullable Diagnosis diagnosis,
      {@required Exception error}) {
    return DiagnosisError(
      diagnosis,
      error: error,
    );
  }
}

// ignore: unused_element
const $DiagnosisState = _$DiagnosisStateTearOff();

mixin _$DiagnosisState {
  Diagnosis get diagnosis;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Diagnosis diagnosis),
    @required Result loading(Diagnosis diagnosis),
    @required Result loaded(Diagnosis diagnosis),
    @required Result error(@nullable Diagnosis diagnosis, Exception error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Diagnosis diagnosis),
    Result loading(Diagnosis diagnosis),
    Result loaded(Diagnosis diagnosis),
    Result error(@nullable Diagnosis diagnosis, Exception error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DiagnosisInitial value),
    @required Result loading(DiagnosisLoading value),
    @required Result loaded(DiagnosisLoaded value),
    @required Result error(DiagnosisError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(DiagnosisInitial value),
    Result loading(DiagnosisLoading value),
    Result loaded(DiagnosisLoaded value),
    Result error(DiagnosisError value),
    @required Result orElse(),
  });

  $DiagnosisStateCopyWith<DiagnosisState> get copyWith;
}

abstract class $DiagnosisStateCopyWith<$Res> {
  factory $DiagnosisStateCopyWith(
          DiagnosisState value, $Res Function(DiagnosisState) then) =
      _$DiagnosisStateCopyWithImpl<$Res>;
  $Res call({Diagnosis diagnosis});
}

class _$DiagnosisStateCopyWithImpl<$Res>
    implements $DiagnosisStateCopyWith<$Res> {
  _$DiagnosisStateCopyWithImpl(this._value, this._then);

  final DiagnosisState _value;
  // ignore: unused_field
  final $Res Function(DiagnosisState) _then;

  @override
  $Res call({
    Object diagnosis = freezed,
  }) {
    return _then(_value.copyWith(
      diagnosis:
          diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
    ));
  }
}

abstract class $DiagnosisInitialCopyWith<$Res>
    implements $DiagnosisStateCopyWith<$Res> {
  factory $DiagnosisInitialCopyWith(
          DiagnosisInitial value, $Res Function(DiagnosisInitial) then) =
      _$DiagnosisInitialCopyWithImpl<$Res>;
  @override
  $Res call({Diagnosis diagnosis});
}

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
    Object diagnosis = freezed,
  }) {
    return _then(DiagnosisInitial(
      diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
    ));
  }
}

class _$DiagnosisInitial
    with DiagnosticableTreeMixin
    implements DiagnosisInitial {
  const _$DiagnosisInitial(this.diagnosis) : assert(diagnosis != null);

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

  @override
  $DiagnosisInitialCopyWith<DiagnosisInitial> get copyWith =>
      _$DiagnosisInitialCopyWithImpl<DiagnosisInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Diagnosis diagnosis),
    @required Result loading(Diagnosis diagnosis),
    @required Result loaded(Diagnosis diagnosis),
    @required Result error(@nullable Diagnosis diagnosis, Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial(diagnosis);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Diagnosis diagnosis),
    Result loading(Diagnosis diagnosis),
    Result loaded(Diagnosis diagnosis),
    Result error(@nullable Diagnosis diagnosis, Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DiagnosisInitial value),
    @required Result loading(DiagnosisLoading value),
    @required Result loaded(DiagnosisLoaded value),
    @required Result error(DiagnosisError value),
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
    Result initial(DiagnosisInitial value),
    Result loading(DiagnosisLoading value),
    Result loaded(DiagnosisLoaded value),
    Result error(DiagnosisError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DiagnosisInitial implements DiagnosisState {
  const factory DiagnosisInitial(Diagnosis diagnosis) = _$DiagnosisInitial;

  @override
  Diagnosis get diagnosis;
  @override
  $DiagnosisInitialCopyWith<DiagnosisInitial> get copyWith;
}

abstract class $DiagnosisLoadingCopyWith<$Res>
    implements $DiagnosisStateCopyWith<$Res> {
  factory $DiagnosisLoadingCopyWith(
          DiagnosisLoading value, $Res Function(DiagnosisLoading) then) =
      _$DiagnosisLoadingCopyWithImpl<$Res>;
  @override
  $Res call({Diagnosis diagnosis});
}

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
    Object diagnosis = freezed,
  }) {
    return _then(DiagnosisLoading(
      diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
    ));
  }
}

class _$DiagnosisLoading
    with DiagnosticableTreeMixin
    implements DiagnosisLoading {
  const _$DiagnosisLoading(this.diagnosis) : assert(diagnosis != null);

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

  @override
  $DiagnosisLoadingCopyWith<DiagnosisLoading> get copyWith =>
      _$DiagnosisLoadingCopyWithImpl<DiagnosisLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Diagnosis diagnosis),
    @required Result loading(Diagnosis diagnosis),
    @required Result loaded(Diagnosis diagnosis),
    @required Result error(@nullable Diagnosis diagnosis, Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading(diagnosis);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Diagnosis diagnosis),
    Result loading(Diagnosis diagnosis),
    Result loaded(Diagnosis diagnosis),
    Result error(@nullable Diagnosis diagnosis, Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DiagnosisInitial value),
    @required Result loading(DiagnosisLoading value),
    @required Result loaded(DiagnosisLoaded value),
    @required Result error(DiagnosisError value),
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
    Result initial(DiagnosisInitial value),
    Result loading(DiagnosisLoading value),
    Result loaded(DiagnosisLoaded value),
    Result error(DiagnosisError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DiagnosisLoading implements DiagnosisState {
  const factory DiagnosisLoading(Diagnosis diagnosis) = _$DiagnosisLoading;

  @override
  Diagnosis get diagnosis;
  @override
  $DiagnosisLoadingCopyWith<DiagnosisLoading> get copyWith;
}

abstract class $DiagnosisLoadedCopyWith<$Res>
    implements $DiagnosisStateCopyWith<$Res> {
  factory $DiagnosisLoadedCopyWith(
          DiagnosisLoaded value, $Res Function(DiagnosisLoaded) then) =
      _$DiagnosisLoadedCopyWithImpl<$Res>;
  @override
  $Res call({Diagnosis diagnosis});
}

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
    Object diagnosis = freezed,
  }) {
    return _then(DiagnosisLoaded(
      diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
    ));
  }
}

class _$DiagnosisLoaded
    with DiagnosticableTreeMixin
    implements DiagnosisLoaded {
  const _$DiagnosisLoaded(this.diagnosis) : assert(diagnosis != null);

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

  @override
  $DiagnosisLoadedCopyWith<DiagnosisLoaded> get copyWith =>
      _$DiagnosisLoadedCopyWithImpl<DiagnosisLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Diagnosis diagnosis),
    @required Result loading(Diagnosis diagnosis),
    @required Result loaded(Diagnosis diagnosis),
    @required Result error(@nullable Diagnosis diagnosis, Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(diagnosis);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Diagnosis diagnosis),
    Result loading(Diagnosis diagnosis),
    Result loaded(Diagnosis diagnosis),
    Result error(@nullable Diagnosis diagnosis, Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DiagnosisInitial value),
    @required Result loading(DiagnosisLoading value),
    @required Result loaded(DiagnosisLoaded value),
    @required Result error(DiagnosisError value),
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
    Result initial(DiagnosisInitial value),
    Result loading(DiagnosisLoading value),
    Result loaded(DiagnosisLoaded value),
    Result error(DiagnosisError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DiagnosisLoaded implements DiagnosisState {
  const factory DiagnosisLoaded(Diagnosis diagnosis) = _$DiagnosisLoaded;

  @override
  Diagnosis get diagnosis;
  @override
  $DiagnosisLoadedCopyWith<DiagnosisLoaded> get copyWith;
}

abstract class $DiagnosisErrorCopyWith<$Res>
    implements $DiagnosisStateCopyWith<$Res> {
  factory $DiagnosisErrorCopyWith(
          DiagnosisError value, $Res Function(DiagnosisError) then) =
      _$DiagnosisErrorCopyWithImpl<$Res>;
  @override
  $Res call({@nullable Diagnosis diagnosis, Exception error});
}

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
    Object diagnosis = freezed,
    Object error = freezed,
  }) {
    return _then(DiagnosisError(
      diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
      error: error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$DiagnosisError with DiagnosticableTreeMixin implements DiagnosisError {
  const _$DiagnosisError(@nullable this.diagnosis, {@required this.error})
      : assert(error != null);

  @override
  @nullable
  final Diagnosis diagnosis;
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

  @override
  $DiagnosisErrorCopyWith<DiagnosisError> get copyWith =>
      _$DiagnosisErrorCopyWithImpl<DiagnosisError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Diagnosis diagnosis),
    @required Result loading(Diagnosis diagnosis),
    @required Result loaded(Diagnosis diagnosis),
    @required Result error(@nullable Diagnosis diagnosis, Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(diagnosis, this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Diagnosis diagnosis),
    Result loading(Diagnosis diagnosis),
    Result loaded(Diagnosis diagnosis),
    Result error(@nullable Diagnosis diagnosis, Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(diagnosis, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DiagnosisInitial value),
    @required Result loading(DiagnosisLoading value),
    @required Result loaded(DiagnosisLoaded value),
    @required Result error(DiagnosisError value),
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
    Result initial(DiagnosisInitial value),
    Result loading(DiagnosisLoading value),
    Result loaded(DiagnosisLoaded value),
    Result error(DiagnosisError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DiagnosisError implements DiagnosisState {
  const factory DiagnosisError(@nullable Diagnosis diagnosis,
      {@required Exception error}) = _$DiagnosisError;

  @override
  @nullable
  Diagnosis get diagnosis;
  Exception get error;
  @override
  $DiagnosisErrorCopyWith<DiagnosisError> get copyWith;
}
