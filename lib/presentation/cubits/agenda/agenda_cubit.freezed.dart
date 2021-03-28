// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'agenda_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AgendaStateTearOff {
  const _$AgendaStateTearOff();

  AgendaInitial initial() {
    return const AgendaInitial();
  }

  AgendaLoading loading() {
    return const AgendaLoading();
  }

  AgendaError error(Exception exception) {
    return AgendaError(
      exception,
    );
  }

  AgendaLoaded loaded(List<Event> events) {
    return AgendaLoaded(
      events,
    );
  }
}

/// @nodoc
const $AgendaState = _$AgendaStateTearOff();

/// @nodoc
mixin _$AgendaState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
    required TResult Function(List<Event> events) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    TResult Function(List<Event> events)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AgendaInitial value) initial,
    required TResult Function(AgendaLoading value) loading,
    required TResult Function(AgendaError value) error,
    required TResult Function(AgendaLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AgendaInitial value)? initial,
    TResult Function(AgendaLoading value)? loading,
    TResult Function(AgendaError value)? error,
    TResult Function(AgendaLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaStateCopyWith<$Res> {
  factory $AgendaStateCopyWith(
          AgendaState value, $Res Function(AgendaState) then) =
      _$AgendaStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AgendaStateCopyWithImpl<$Res> implements $AgendaStateCopyWith<$Res> {
  _$AgendaStateCopyWithImpl(this._value, this._then);

  final AgendaState _value;
  // ignore: unused_field
  final $Res Function(AgendaState) _then;
}

/// @nodoc
abstract class $AgendaInitialCopyWith<$Res> {
  factory $AgendaInitialCopyWith(
          AgendaInitial value, $Res Function(AgendaInitial) then) =
      _$AgendaInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AgendaInitialCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaInitialCopyWith<$Res> {
  _$AgendaInitialCopyWithImpl(
      AgendaInitial _value, $Res Function(AgendaInitial) _then)
      : super(_value, (v) => _then(v as AgendaInitial));

  @override
  AgendaInitial get _value => super._value as AgendaInitial;
}

/// @nodoc
class _$AgendaInitial with DiagnosticableTreeMixin implements AgendaInitial {
  const _$AgendaInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AgendaState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AgendaState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AgendaInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
    required TResult Function(List<Event> events) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    TResult Function(List<Event> events)? loaded,
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
    required TResult Function(AgendaInitial value) initial,
    required TResult Function(AgendaLoading value) loading,
    required TResult Function(AgendaError value) error,
    required TResult Function(AgendaLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AgendaInitial value)? initial,
    TResult Function(AgendaLoading value)? loading,
    TResult Function(AgendaError value)? error,
    TResult Function(AgendaLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AgendaInitial implements AgendaState {
  const factory AgendaInitial() = _$AgendaInitial;
}

/// @nodoc
abstract class $AgendaLoadingCopyWith<$Res> {
  factory $AgendaLoadingCopyWith(
          AgendaLoading value, $Res Function(AgendaLoading) then) =
      _$AgendaLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AgendaLoadingCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaLoadingCopyWith<$Res> {
  _$AgendaLoadingCopyWithImpl(
      AgendaLoading _value, $Res Function(AgendaLoading) _then)
      : super(_value, (v) => _then(v as AgendaLoading));

  @override
  AgendaLoading get _value => super._value as AgendaLoading;
}

/// @nodoc
class _$AgendaLoading with DiagnosticableTreeMixin implements AgendaLoading {
  const _$AgendaLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AgendaState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AgendaState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AgendaLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
    required TResult Function(List<Event> events) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    TResult Function(List<Event> events)? loaded,
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
    required TResult Function(AgendaInitial value) initial,
    required TResult Function(AgendaLoading value) loading,
    required TResult Function(AgendaError value) error,
    required TResult Function(AgendaLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AgendaInitial value)? initial,
    TResult Function(AgendaLoading value)? loading,
    TResult Function(AgendaError value)? error,
    TResult Function(AgendaLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AgendaLoading implements AgendaState {
  const factory AgendaLoading() = _$AgendaLoading;
}

/// @nodoc
abstract class $AgendaErrorCopyWith<$Res> {
  factory $AgendaErrorCopyWith(
          AgendaError value, $Res Function(AgendaError) then) =
      _$AgendaErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class _$AgendaErrorCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaErrorCopyWith<$Res> {
  _$AgendaErrorCopyWithImpl(
      AgendaError _value, $Res Function(AgendaError) _then)
      : super(_value, (v) => _then(v as AgendaError));

  @override
  AgendaError get _value => super._value as AgendaError;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(AgendaError(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
class _$AgendaError with DiagnosticableTreeMixin implements AgendaError {
  const _$AgendaError(this.exception);

  @override
  final Exception exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AgendaState.error(exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AgendaState.error'))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AgendaError &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  $AgendaErrorCopyWith<AgendaError> get copyWith =>
      _$AgendaErrorCopyWithImpl<AgendaError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
    required TResult Function(List<Event> events) loaded,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    TResult Function(List<Event> events)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AgendaInitial value) initial,
    required TResult Function(AgendaLoading value) loading,
    required TResult Function(AgendaError value) error,
    required TResult Function(AgendaLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AgendaInitial value)? initial,
    TResult Function(AgendaLoading value)? loading,
    TResult Function(AgendaError value)? error,
    TResult Function(AgendaLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AgendaError implements AgendaState {
  const factory AgendaError(Exception exception) = _$AgendaError;

  Exception get exception => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgendaErrorCopyWith<AgendaError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaLoadedCopyWith<$Res> {
  factory $AgendaLoadedCopyWith(
          AgendaLoaded value, $Res Function(AgendaLoaded) then) =
      _$AgendaLoadedCopyWithImpl<$Res>;
  $Res call({List<Event> events});
}

/// @nodoc
class _$AgendaLoadedCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaLoadedCopyWith<$Res> {
  _$AgendaLoadedCopyWithImpl(
      AgendaLoaded _value, $Res Function(AgendaLoaded) _then)
      : super(_value, (v) => _then(v as AgendaLoaded));

  @override
  AgendaLoaded get _value => super._value as AgendaLoaded;

  @override
  $Res call({
    Object? events = freezed,
  }) {
    return _then(AgendaLoaded(
      events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
class _$AgendaLoaded with DiagnosticableTreeMixin implements AgendaLoaded {
  const _$AgendaLoaded(this.events);

  @override
  final List<Event> events;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AgendaState.loaded(events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AgendaState.loaded'))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AgendaLoaded &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  $AgendaLoadedCopyWith<AgendaLoaded> get copyWith =>
      _$AgendaLoadedCopyWithImpl<AgendaLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
    required TResult Function(List<Event> events) loaded,
  }) {
    return loaded(events);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    TResult Function(List<Event> events)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AgendaInitial value) initial,
    required TResult Function(AgendaLoading value) loading,
    required TResult Function(AgendaError value) error,
    required TResult Function(AgendaLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AgendaInitial value)? initial,
    TResult Function(AgendaLoading value)? loading,
    TResult Function(AgendaError value)? error,
    TResult Function(AgendaLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AgendaLoaded implements AgendaState {
  const factory AgendaLoaded(List<Event> events) = _$AgendaLoaded;

  List<Event> get events => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgendaLoadedCopyWith<AgendaLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
