// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'github_releases_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubReleasesStateTearOff {
  const _$GithubReleasesStateTearOff();

  GithubReleasesStateInitial initial() {
    return const GithubReleasesStateInitial();
  }

  GithubReleasesStateLoading loading() {
    return const GithubReleasesStateLoading();
  }

  GithubReleasesStateLoaded loaded(List<GithubRelease> releases) {
    return GithubReleasesStateLoaded(
      releases,
    );
  }

  GithubReleasesStateError error(Exception error) {
    return GithubReleasesStateError(
      error,
    );
  }
}

/// @nodoc
const $GithubReleasesState = _$GithubReleasesStateTearOff();

/// @nodoc
mixin _$GithubReleasesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GithubRelease> releases) loaded,
    required TResult Function(Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GithubRelease> releases)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GithubReleasesStateInitial value) initial,
    required TResult Function(GithubReleasesStateLoading value) loading,
    required TResult Function(GithubReleasesStateLoaded value) loaded,
    required TResult Function(GithubReleasesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GithubReleasesStateInitial value)? initial,
    TResult Function(GithubReleasesStateLoading value)? loading,
    TResult Function(GithubReleasesStateLoaded value)? loaded,
    TResult Function(GithubReleasesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubReleasesStateCopyWith<$Res> {
  factory $GithubReleasesStateCopyWith(
          GithubReleasesState value, $Res Function(GithubReleasesState) then) =
      _$GithubReleasesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GithubReleasesStateCopyWithImpl<$Res>
    implements $GithubReleasesStateCopyWith<$Res> {
  _$GithubReleasesStateCopyWithImpl(this._value, this._then);

  final GithubReleasesState _value;
  // ignore: unused_field
  final $Res Function(GithubReleasesState) _then;
}

/// @nodoc
abstract class $GithubReleasesStateInitialCopyWith<$Res> {
  factory $GithubReleasesStateInitialCopyWith(GithubReleasesStateInitial value,
          $Res Function(GithubReleasesStateInitial) then) =
      _$GithubReleasesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$GithubReleasesStateInitialCopyWithImpl<$Res>
    extends _$GithubReleasesStateCopyWithImpl<$Res>
    implements $GithubReleasesStateInitialCopyWith<$Res> {
  _$GithubReleasesStateInitialCopyWithImpl(GithubReleasesStateInitial _value,
      $Res Function(GithubReleasesStateInitial) _then)
      : super(_value, (v) => _then(v as GithubReleasesStateInitial));

  @override
  GithubReleasesStateInitial get _value =>
      super._value as GithubReleasesStateInitial;
}

/// @nodoc
class _$GithubReleasesStateInitial
    with DiagnosticableTreeMixin
    implements GithubReleasesStateInitial {
  const _$GithubReleasesStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubReleasesState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GithubReleasesState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GithubReleasesStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GithubRelease> releases) loaded,
    required TResult Function(Exception error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GithubRelease> releases)? loaded,
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
    required TResult Function(GithubReleasesStateInitial value) initial,
    required TResult Function(GithubReleasesStateLoading value) loading,
    required TResult Function(GithubReleasesStateLoaded value) loaded,
    required TResult Function(GithubReleasesStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GithubReleasesStateInitial value)? initial,
    TResult Function(GithubReleasesStateLoading value)? loading,
    TResult Function(GithubReleasesStateLoaded value)? loaded,
    TResult Function(GithubReleasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateInitial implements GithubReleasesState {
  const factory GithubReleasesStateInitial() = _$GithubReleasesStateInitial;
}

/// @nodoc
abstract class $GithubReleasesStateLoadingCopyWith<$Res> {
  factory $GithubReleasesStateLoadingCopyWith(GithubReleasesStateLoading value,
          $Res Function(GithubReleasesStateLoading) then) =
      _$GithubReleasesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$GithubReleasesStateLoadingCopyWithImpl<$Res>
    extends _$GithubReleasesStateCopyWithImpl<$Res>
    implements $GithubReleasesStateLoadingCopyWith<$Res> {
  _$GithubReleasesStateLoadingCopyWithImpl(GithubReleasesStateLoading _value,
      $Res Function(GithubReleasesStateLoading) _then)
      : super(_value, (v) => _then(v as GithubReleasesStateLoading));

  @override
  GithubReleasesStateLoading get _value =>
      super._value as GithubReleasesStateLoading;
}

/// @nodoc
class _$GithubReleasesStateLoading
    with DiagnosticableTreeMixin
    implements GithubReleasesStateLoading {
  const _$GithubReleasesStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubReleasesState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GithubReleasesState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GithubReleasesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GithubRelease> releases) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GithubRelease> releases)? loaded,
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
    required TResult Function(GithubReleasesStateInitial value) initial,
    required TResult Function(GithubReleasesStateLoading value) loading,
    required TResult Function(GithubReleasesStateLoaded value) loaded,
    required TResult Function(GithubReleasesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GithubReleasesStateInitial value)? initial,
    TResult Function(GithubReleasesStateLoading value)? loading,
    TResult Function(GithubReleasesStateLoaded value)? loaded,
    TResult Function(GithubReleasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateLoading implements GithubReleasesState {
  const factory GithubReleasesStateLoading() = _$GithubReleasesStateLoading;
}

/// @nodoc
abstract class $GithubReleasesStateLoadedCopyWith<$Res> {
  factory $GithubReleasesStateLoadedCopyWith(GithubReleasesStateLoaded value,
          $Res Function(GithubReleasesStateLoaded) then) =
      _$GithubReleasesStateLoadedCopyWithImpl<$Res>;
  $Res call({List<GithubRelease> releases});
}

/// @nodoc
class _$GithubReleasesStateLoadedCopyWithImpl<$Res>
    extends _$GithubReleasesStateCopyWithImpl<$Res>
    implements $GithubReleasesStateLoadedCopyWith<$Res> {
  _$GithubReleasesStateLoadedCopyWithImpl(GithubReleasesStateLoaded _value,
      $Res Function(GithubReleasesStateLoaded) _then)
      : super(_value, (v) => _then(v as GithubReleasesStateLoaded));

  @override
  GithubReleasesStateLoaded get _value =>
      super._value as GithubReleasesStateLoaded;

  @override
  $Res call({
    Object? releases = freezed,
  }) {
    return _then(GithubReleasesStateLoaded(
      releases == freezed
          ? _value.releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<GithubRelease>,
    ));
  }
}

/// @nodoc
class _$GithubReleasesStateLoaded
    with DiagnosticableTreeMixin
    implements GithubReleasesStateLoaded {
  const _$GithubReleasesStateLoaded(this.releases);

  @override
  final List<GithubRelease> releases;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubReleasesState.loaded(releases: $releases)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubReleasesState.loaded'))
      ..add(DiagnosticsProperty('releases', releases));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GithubReleasesStateLoaded &&
            (identical(other.releases, releases) ||
                const DeepCollectionEquality()
                    .equals(other.releases, releases)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(releases);

  @JsonKey(ignore: true)
  @override
  $GithubReleasesStateLoadedCopyWith<GithubReleasesStateLoaded> get copyWith =>
      _$GithubReleasesStateLoadedCopyWithImpl<GithubReleasesStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GithubRelease> releases) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loaded(releases);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GithubRelease> releases)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(releases);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GithubReleasesStateInitial value) initial,
    required TResult Function(GithubReleasesStateLoading value) loading,
    required TResult Function(GithubReleasesStateLoaded value) loaded,
    required TResult Function(GithubReleasesStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GithubReleasesStateInitial value)? initial,
    TResult Function(GithubReleasesStateLoading value)? loading,
    TResult Function(GithubReleasesStateLoaded value)? loaded,
    TResult Function(GithubReleasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateLoaded implements GithubReleasesState {
  const factory GithubReleasesStateLoaded(List<GithubRelease> releases) =
      _$GithubReleasesStateLoaded;

  List<GithubRelease> get releases => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubReleasesStateLoadedCopyWith<GithubReleasesStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubReleasesStateErrorCopyWith<$Res> {
  factory $GithubReleasesStateErrorCopyWith(GithubReleasesStateError value,
          $Res Function(GithubReleasesStateError) then) =
      _$GithubReleasesStateErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class _$GithubReleasesStateErrorCopyWithImpl<$Res>
    extends _$GithubReleasesStateCopyWithImpl<$Res>
    implements $GithubReleasesStateErrorCopyWith<$Res> {
  _$GithubReleasesStateErrorCopyWithImpl(GithubReleasesStateError _value,
      $Res Function(GithubReleasesStateError) _then)
      : super(_value, (v) => _then(v as GithubReleasesStateError));

  @override
  GithubReleasesStateError get _value =>
      super._value as GithubReleasesStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(GithubReleasesStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$GithubReleasesStateError
    with DiagnosticableTreeMixin
    implements GithubReleasesStateError {
  const _$GithubReleasesStateError(this.error);

  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubReleasesState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubReleasesState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GithubReleasesStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $GithubReleasesStateErrorCopyWith<GithubReleasesStateError> get copyWith =>
      _$GithubReleasesStateErrorCopyWithImpl<GithubReleasesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GithubRelease> releases) loaded,
    required TResult Function(Exception error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GithubRelease> releases)? loaded,
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
    required TResult Function(GithubReleasesStateInitial value) initial,
    required TResult Function(GithubReleasesStateLoading value) loading,
    required TResult Function(GithubReleasesStateLoaded value) loaded,
    required TResult Function(GithubReleasesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GithubReleasesStateInitial value)? initial,
    TResult Function(GithubReleasesStateLoading value)? loading,
    TResult Function(GithubReleasesStateLoaded value)? loaded,
    TResult Function(GithubReleasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateError implements GithubReleasesState {
  const factory GithubReleasesStateError(Exception error) =
      _$GithubReleasesStateError;

  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubReleasesStateErrorCopyWith<GithubReleasesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
