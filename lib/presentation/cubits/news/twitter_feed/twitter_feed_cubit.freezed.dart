// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'twitter_feed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TwitterFeedStateTearOff {
  const _$TwitterFeedStateTearOff();

  TwitterFeedStateInitial initial() {
    return const TwitterFeedStateInitial();
  }

  TwitterFeedStateLoading loading() {
    return const TwitterFeedStateLoading();
  }

  TwitterFeedStateLoaded loaded(List<Post> feed) {
    return TwitterFeedStateLoaded(
      feed,
    );
  }

  TwitterFeedStateError error(Exception error) {
    return TwitterFeedStateError(
      error,
    );
  }
}

/// @nodoc
const $TwitterFeedState = _$TwitterFeedStateTearOff();

/// @nodoc
mixin _$TwitterFeedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> feed) loaded,
    required TResult Function(Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> feed)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TwitterFeedStateInitial value) initial,
    required TResult Function(TwitterFeedStateLoading value) loading,
    required TResult Function(TwitterFeedStateLoaded value) loaded,
    required TResult Function(TwitterFeedStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TwitterFeedStateInitial value)? initial,
    TResult Function(TwitterFeedStateLoading value)? loading,
    TResult Function(TwitterFeedStateLoaded value)? loaded,
    TResult Function(TwitterFeedStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwitterFeedStateCopyWith<$Res> {
  factory $TwitterFeedStateCopyWith(
          TwitterFeedState value, $Res Function(TwitterFeedState) then) =
      _$TwitterFeedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TwitterFeedStateCopyWithImpl<$Res>
    implements $TwitterFeedStateCopyWith<$Res> {
  _$TwitterFeedStateCopyWithImpl(this._value, this._then);

  final TwitterFeedState _value;
  // ignore: unused_field
  final $Res Function(TwitterFeedState) _then;
}

/// @nodoc
abstract class $TwitterFeedStateInitialCopyWith<$Res> {
  factory $TwitterFeedStateInitialCopyWith(TwitterFeedStateInitial value,
          $Res Function(TwitterFeedStateInitial) then) =
      _$TwitterFeedStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$TwitterFeedStateInitialCopyWithImpl<$Res>
    extends _$TwitterFeedStateCopyWithImpl<$Res>
    implements $TwitterFeedStateInitialCopyWith<$Res> {
  _$TwitterFeedStateInitialCopyWithImpl(TwitterFeedStateInitial _value,
      $Res Function(TwitterFeedStateInitial) _then)
      : super(_value, (v) => _then(v as TwitterFeedStateInitial));

  @override
  TwitterFeedStateInitial get _value => super._value as TwitterFeedStateInitial;
}

/// @nodoc
class _$TwitterFeedStateInitial
    with DiagnosticableTreeMixin
    implements TwitterFeedStateInitial {
  const _$TwitterFeedStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TwitterFeedState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TwitterFeedState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TwitterFeedStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> feed) loaded,
    required TResult Function(Exception error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> feed)? loaded,
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
    required TResult Function(TwitterFeedStateInitial value) initial,
    required TResult Function(TwitterFeedStateLoading value) loading,
    required TResult Function(TwitterFeedStateLoaded value) loaded,
    required TResult Function(TwitterFeedStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TwitterFeedStateInitial value)? initial,
    TResult Function(TwitterFeedStateLoading value)? loading,
    TResult Function(TwitterFeedStateLoaded value)? loaded,
    TResult Function(TwitterFeedStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TwitterFeedStateInitial implements TwitterFeedState {
  const factory TwitterFeedStateInitial() = _$TwitterFeedStateInitial;
}

/// @nodoc
abstract class $TwitterFeedStateLoadingCopyWith<$Res> {
  factory $TwitterFeedStateLoadingCopyWith(TwitterFeedStateLoading value,
          $Res Function(TwitterFeedStateLoading) then) =
      _$TwitterFeedStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$TwitterFeedStateLoadingCopyWithImpl<$Res>
    extends _$TwitterFeedStateCopyWithImpl<$Res>
    implements $TwitterFeedStateLoadingCopyWith<$Res> {
  _$TwitterFeedStateLoadingCopyWithImpl(TwitterFeedStateLoading _value,
      $Res Function(TwitterFeedStateLoading) _then)
      : super(_value, (v) => _then(v as TwitterFeedStateLoading));

  @override
  TwitterFeedStateLoading get _value => super._value as TwitterFeedStateLoading;
}

/// @nodoc
class _$TwitterFeedStateLoading
    with DiagnosticableTreeMixin
    implements TwitterFeedStateLoading {
  const _$TwitterFeedStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TwitterFeedState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TwitterFeedState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TwitterFeedStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> feed) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> feed)? loaded,
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
    required TResult Function(TwitterFeedStateInitial value) initial,
    required TResult Function(TwitterFeedStateLoading value) loading,
    required TResult Function(TwitterFeedStateLoaded value) loaded,
    required TResult Function(TwitterFeedStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TwitterFeedStateInitial value)? initial,
    TResult Function(TwitterFeedStateLoading value)? loading,
    TResult Function(TwitterFeedStateLoaded value)? loaded,
    TResult Function(TwitterFeedStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TwitterFeedStateLoading implements TwitterFeedState {
  const factory TwitterFeedStateLoading() = _$TwitterFeedStateLoading;
}

/// @nodoc
abstract class $TwitterFeedStateLoadedCopyWith<$Res> {
  factory $TwitterFeedStateLoadedCopyWith(TwitterFeedStateLoaded value,
          $Res Function(TwitterFeedStateLoaded) then) =
      _$TwitterFeedStateLoadedCopyWithImpl<$Res>;
  $Res call({List<Post> feed});
}

/// @nodoc
class _$TwitterFeedStateLoadedCopyWithImpl<$Res>
    extends _$TwitterFeedStateCopyWithImpl<$Res>
    implements $TwitterFeedStateLoadedCopyWith<$Res> {
  _$TwitterFeedStateLoadedCopyWithImpl(TwitterFeedStateLoaded _value,
      $Res Function(TwitterFeedStateLoaded) _then)
      : super(_value, (v) => _then(v as TwitterFeedStateLoaded));

  @override
  TwitterFeedStateLoaded get _value => super._value as TwitterFeedStateLoaded;

  @override
  $Res call({
    Object? feed = freezed,
  }) {
    return _then(TwitterFeedStateLoaded(
      feed == freezed
          ? _value.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
class _$TwitterFeedStateLoaded
    with DiagnosticableTreeMixin
    implements TwitterFeedStateLoaded {
  const _$TwitterFeedStateLoaded(this.feed);

  @override
  final List<Post> feed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TwitterFeedState.loaded(feed: $feed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TwitterFeedState.loaded'))
      ..add(DiagnosticsProperty('feed', feed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TwitterFeedStateLoaded &&
            (identical(other.feed, feed) ||
                const DeepCollectionEquality().equals(other.feed, feed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(feed);

  @JsonKey(ignore: true)
  @override
  $TwitterFeedStateLoadedCopyWith<TwitterFeedStateLoaded> get copyWith =>
      _$TwitterFeedStateLoadedCopyWithImpl<TwitterFeedStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> feed) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loaded(feed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> feed)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(feed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TwitterFeedStateInitial value) initial,
    required TResult Function(TwitterFeedStateLoading value) loading,
    required TResult Function(TwitterFeedStateLoaded value) loaded,
    required TResult Function(TwitterFeedStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TwitterFeedStateInitial value)? initial,
    TResult Function(TwitterFeedStateLoading value)? loading,
    TResult Function(TwitterFeedStateLoaded value)? loaded,
    TResult Function(TwitterFeedStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TwitterFeedStateLoaded implements TwitterFeedState {
  const factory TwitterFeedStateLoaded(List<Post> feed) =
      _$TwitterFeedStateLoaded;

  List<Post> get feed => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TwitterFeedStateLoadedCopyWith<TwitterFeedStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwitterFeedStateErrorCopyWith<$Res> {
  factory $TwitterFeedStateErrorCopyWith(TwitterFeedStateError value,
          $Res Function(TwitterFeedStateError) then) =
      _$TwitterFeedStateErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class _$TwitterFeedStateErrorCopyWithImpl<$Res>
    extends _$TwitterFeedStateCopyWithImpl<$Res>
    implements $TwitterFeedStateErrorCopyWith<$Res> {
  _$TwitterFeedStateErrorCopyWithImpl(
      TwitterFeedStateError _value, $Res Function(TwitterFeedStateError) _then)
      : super(_value, (v) => _then(v as TwitterFeedStateError));

  @override
  TwitterFeedStateError get _value => super._value as TwitterFeedStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(TwitterFeedStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$TwitterFeedStateError
    with DiagnosticableTreeMixin
    implements TwitterFeedStateError {
  const _$TwitterFeedStateError(this.error);

  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TwitterFeedState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TwitterFeedState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TwitterFeedStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $TwitterFeedStateErrorCopyWith<TwitterFeedStateError> get copyWith =>
      _$TwitterFeedStateErrorCopyWithImpl<TwitterFeedStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> feed) loaded,
    required TResult Function(Exception error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> feed)? loaded,
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
    required TResult Function(TwitterFeedStateInitial value) initial,
    required TResult Function(TwitterFeedStateLoading value) loading,
    required TResult Function(TwitterFeedStateLoaded value) loaded,
    required TResult Function(TwitterFeedStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TwitterFeedStateInitial value)? initial,
    TResult Function(TwitterFeedStateLoading value)? loading,
    TResult Function(TwitterFeedStateLoaded value)? loaded,
    TResult Function(TwitterFeedStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TwitterFeedStateError implements TwitterFeedState {
  const factory TwitterFeedStateError(Exception error) =
      _$TwitterFeedStateError;

  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TwitterFeedStateErrorCopyWith<TwitterFeedStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
