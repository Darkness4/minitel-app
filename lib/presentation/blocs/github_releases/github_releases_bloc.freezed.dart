// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'github_releases_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GithubReleasesEventTearOff {
  const _$GithubReleasesEventTearOff();

  GetReleasesEvent get(String repo) {
    return GetReleasesEvent(
      repo,
    );
  }
}

// ignore: unused_element
const $GithubReleasesEvent = _$GithubReleasesEventTearOff();

mixin _$GithubReleasesEvent {
  String get repo;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result get(String repo),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result get(String repo),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result get(GetReleasesEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result get(GetReleasesEvent value),
    @required Result orElse(),
  });

  $GithubReleasesEventCopyWith<GithubReleasesEvent> get copyWith;
}

abstract class $GithubReleasesEventCopyWith<$Res> {
  factory $GithubReleasesEventCopyWith(
          GithubReleasesEvent value, $Res Function(GithubReleasesEvent) then) =
      _$GithubReleasesEventCopyWithImpl<$Res>;
  $Res call({String repo});
}

class _$GithubReleasesEventCopyWithImpl<$Res>
    implements $GithubReleasesEventCopyWith<$Res> {
  _$GithubReleasesEventCopyWithImpl(this._value, this._then);

  final GithubReleasesEvent _value;
  // ignore: unused_field
  final $Res Function(GithubReleasesEvent) _then;

  @override
  $Res call({
    Object repo = freezed,
  }) {
    return _then(_value.copyWith(
      repo: repo == freezed ? _value.repo : repo as String,
    ));
  }
}

abstract class $GetReleasesEventCopyWith<$Res>
    implements $GithubReleasesEventCopyWith<$Res> {
  factory $GetReleasesEventCopyWith(
          GetReleasesEvent value, $Res Function(GetReleasesEvent) then) =
      _$GetReleasesEventCopyWithImpl<$Res>;
  @override
  $Res call({String repo});
}

class _$GetReleasesEventCopyWithImpl<$Res>
    extends _$GithubReleasesEventCopyWithImpl<$Res>
    implements $GetReleasesEventCopyWith<$Res> {
  _$GetReleasesEventCopyWithImpl(
      GetReleasesEvent _value, $Res Function(GetReleasesEvent) _then)
      : super(_value, (v) => _then(v as GetReleasesEvent));

  @override
  GetReleasesEvent get _value => super._value as GetReleasesEvent;

  @override
  $Res call({
    Object repo = freezed,
  }) {
    return _then(GetReleasesEvent(
      repo == freezed ? _value.repo : repo as String,
    ));
  }
}

class _$GetReleasesEvent
    with DiagnosticableTreeMixin
    implements GetReleasesEvent {
  const _$GetReleasesEvent(this.repo) : assert(repo != null);

  @override
  final String repo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubReleasesEvent.get(repo: $repo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubReleasesEvent.get'))
      ..add(DiagnosticsProperty('repo', repo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetReleasesEvent &&
            (identical(other.repo, repo) ||
                const DeepCollectionEquality().equals(other.repo, repo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(repo);

  @override
  $GetReleasesEventCopyWith<GetReleasesEvent> get copyWith =>
      _$GetReleasesEventCopyWithImpl<GetReleasesEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result get(String repo),
  }) {
    assert(get != null);
    return get(repo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result get(String repo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (get != null) {
      return get(repo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result get(GetReleasesEvent value),
  }) {
    assert(get != null);
    return get(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result get(GetReleasesEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetReleasesEvent implements GithubReleasesEvent {
  const factory GetReleasesEvent(String repo) = _$GetReleasesEvent;

  @override
  String get repo;
  @override
  $GetReleasesEventCopyWith<GetReleasesEvent> get copyWith;
}

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

// ignore: unused_element
const $GithubReleasesState = _$GithubReleasesStateTearOff();

mixin _$GithubReleasesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<GithubRelease> releases),
    @required Result error(Exception error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<GithubRelease> releases),
    Result error(Exception error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(GithubReleasesStateInitial value),
    @required Result loading(GithubReleasesStateLoading value),
    @required Result loaded(GithubReleasesStateLoaded value),
    @required Result error(GithubReleasesStateError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(GithubReleasesStateInitial value),
    Result loading(GithubReleasesStateLoading value),
    Result loaded(GithubReleasesStateLoaded value),
    Result error(GithubReleasesStateError value),
    @required Result orElse(),
  });
}

abstract class $GithubReleasesStateCopyWith<$Res> {
  factory $GithubReleasesStateCopyWith(
          GithubReleasesState value, $Res Function(GithubReleasesState) then) =
      _$GithubReleasesStateCopyWithImpl<$Res>;
}

class _$GithubReleasesStateCopyWithImpl<$Res>
    implements $GithubReleasesStateCopyWith<$Res> {
  _$GithubReleasesStateCopyWithImpl(this._value, this._then);

  final GithubReleasesState _value;
  // ignore: unused_field
  final $Res Function(GithubReleasesState) _then;
}

abstract class $GithubReleasesStateInitialCopyWith<$Res> {
  factory $GithubReleasesStateInitialCopyWith(GithubReleasesStateInitial value,
          $Res Function(GithubReleasesStateInitial) then) =
      _$GithubReleasesStateInitialCopyWithImpl<$Res>;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<GithubRelease> releases),
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
    Result loaded(List<GithubRelease> releases),
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
    @required Result initial(GithubReleasesStateInitial value),
    @required Result loading(GithubReleasesStateLoading value),
    @required Result loaded(GithubReleasesStateLoaded value),
    @required Result error(GithubReleasesStateError value),
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
    Result initial(GithubReleasesStateInitial value),
    Result loading(GithubReleasesStateLoading value),
    Result loaded(GithubReleasesStateLoaded value),
    Result error(GithubReleasesStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateInitial implements GithubReleasesState {
  const factory GithubReleasesStateInitial() = _$GithubReleasesStateInitial;
}

abstract class $GithubReleasesStateLoadingCopyWith<$Res> {
  factory $GithubReleasesStateLoadingCopyWith(GithubReleasesStateLoading value,
          $Res Function(GithubReleasesStateLoading) then) =
      _$GithubReleasesStateLoadingCopyWithImpl<$Res>;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<GithubRelease> releases),
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
    Result loaded(List<GithubRelease> releases),
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
    @required Result initial(GithubReleasesStateInitial value),
    @required Result loading(GithubReleasesStateLoading value),
    @required Result loaded(GithubReleasesStateLoaded value),
    @required Result error(GithubReleasesStateError value),
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
    Result initial(GithubReleasesStateInitial value),
    Result loading(GithubReleasesStateLoading value),
    Result loaded(GithubReleasesStateLoaded value),
    Result error(GithubReleasesStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateLoading implements GithubReleasesState {
  const factory GithubReleasesStateLoading() = _$GithubReleasesStateLoading;
}

abstract class $GithubReleasesStateLoadedCopyWith<$Res> {
  factory $GithubReleasesStateLoadedCopyWith(GithubReleasesStateLoaded value,
          $Res Function(GithubReleasesStateLoaded) then) =
      _$GithubReleasesStateLoadedCopyWithImpl<$Res>;
  $Res call({List<GithubRelease> releases});
}

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
    Object releases = freezed,
  }) {
    return _then(GithubReleasesStateLoaded(
      releases == freezed ? _value.releases : releases as List<GithubRelease>,
    ));
  }
}

class _$GithubReleasesStateLoaded
    with DiagnosticableTreeMixin
    implements GithubReleasesStateLoaded {
  const _$GithubReleasesStateLoaded(this.releases) : assert(releases != null);

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

  @override
  $GithubReleasesStateLoadedCopyWith<GithubReleasesStateLoaded> get copyWith =>
      _$GithubReleasesStateLoadedCopyWithImpl<GithubReleasesStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<GithubRelease> releases),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(releases);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(List<GithubRelease> releases),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(releases);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(GithubReleasesStateInitial value),
    @required Result loading(GithubReleasesStateLoading value),
    @required Result loaded(GithubReleasesStateLoaded value),
    @required Result error(GithubReleasesStateError value),
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
    Result initial(GithubReleasesStateInitial value),
    Result loading(GithubReleasesStateLoading value),
    Result loaded(GithubReleasesStateLoaded value),
    Result error(GithubReleasesStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateLoaded implements GithubReleasesState {
  const factory GithubReleasesStateLoaded(List<GithubRelease> releases) =
      _$GithubReleasesStateLoaded;

  List<GithubRelease> get releases;
  $GithubReleasesStateLoadedCopyWith<GithubReleasesStateLoaded> get copyWith;
}

abstract class $GithubReleasesStateErrorCopyWith<$Res> {
  factory $GithubReleasesStateErrorCopyWith(GithubReleasesStateError value,
          $Res Function(GithubReleasesStateError) then) =
      _$GithubReleasesStateErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

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
    Object error = freezed,
  }) {
    return _then(GithubReleasesStateError(
      error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$GithubReleasesStateError
    with DiagnosticableTreeMixin
    implements GithubReleasesStateError {
  const _$GithubReleasesStateError(this.error) : assert(error != null);

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

  @override
  $GithubReleasesStateErrorCopyWith<GithubReleasesStateError> get copyWith =>
      _$GithubReleasesStateErrorCopyWithImpl<GithubReleasesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(List<GithubRelease> releases),
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
    Result loaded(List<GithubRelease> releases),
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
    @required Result initial(GithubReleasesStateInitial value),
    @required Result loading(GithubReleasesStateLoading value),
    @required Result loaded(GithubReleasesStateLoaded value),
    @required Result error(GithubReleasesStateError value),
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
    Result initial(GithubReleasesStateInitial value),
    Result loading(GithubReleasesStateLoading value),
    Result loaded(GithubReleasesStateLoaded value),
    Result error(GithubReleasesStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GithubReleasesStateError implements GithubReleasesState {
  const factory GithubReleasesStateError(Exception error) =
      _$GithubReleasesStateError;

  Exception get error;
  $GithubReleasesStateErrorCopyWith<GithubReleasesStateError> get copyWith;
}
