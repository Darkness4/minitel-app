// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'agenda_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

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

// ignore: unused_element
const $AgendaState = _$AgendaStateTearOff();

mixin _$AgendaState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception exception),
    @required Result loaded(List<Event> events),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception exception),
    Result loaded(List<Event> events),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AgendaInitial value),
    @required Result loading(AgendaLoading value),
    @required Result error(AgendaError value),
    @required Result loaded(AgendaLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AgendaInitial value),
    Result loading(AgendaLoading value),
    Result error(AgendaError value),
    Result loaded(AgendaLoaded value),
    @required Result orElse(),
  });
}

abstract class $AgendaStateCopyWith<$Res> {
  factory $AgendaStateCopyWith(
          AgendaState value, $Res Function(AgendaState) then) =
      _$AgendaStateCopyWithImpl<$Res>;
}

class _$AgendaStateCopyWithImpl<$Res> implements $AgendaStateCopyWith<$Res> {
  _$AgendaStateCopyWithImpl(this._value, this._then);

  final AgendaState _value;
  // ignore: unused_field
  final $Res Function(AgendaState) _then;
}

abstract class $AgendaInitialCopyWith<$Res> {
  factory $AgendaInitialCopyWith(
          AgendaInitial value, $Res Function(AgendaInitial) then) =
      _$AgendaInitialCopyWithImpl<$Res>;
}

class _$AgendaInitialCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaInitialCopyWith<$Res> {
  _$AgendaInitialCopyWithImpl(
      AgendaInitial _value, $Res Function(AgendaInitial) _then)
      : super(_value, (v) => _then(v as AgendaInitial));

  @override
  AgendaInitial get _value => super._value as AgendaInitial;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception exception),
    @required Result loaded(List<Event> events),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception exception),
    Result loaded(List<Event> events),
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
    @required Result initial(AgendaInitial value),
    @required Result loading(AgendaLoading value),
    @required Result error(AgendaError value),
    @required Result loaded(AgendaLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AgendaInitial value),
    Result loading(AgendaLoading value),
    Result error(AgendaError value),
    Result loaded(AgendaLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AgendaInitial implements AgendaState {
  const factory AgendaInitial() = _$AgendaInitial;
}

abstract class $AgendaLoadingCopyWith<$Res> {
  factory $AgendaLoadingCopyWith(
          AgendaLoading value, $Res Function(AgendaLoading) then) =
      _$AgendaLoadingCopyWithImpl<$Res>;
}

class _$AgendaLoadingCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaLoadingCopyWith<$Res> {
  _$AgendaLoadingCopyWithImpl(
      AgendaLoading _value, $Res Function(AgendaLoading) _then)
      : super(_value, (v) => _then(v as AgendaLoading));

  @override
  AgendaLoading get _value => super._value as AgendaLoading;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception exception),
    @required Result loaded(List<Event> events),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception exception),
    Result loaded(List<Event> events),
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
    @required Result initial(AgendaInitial value),
    @required Result loading(AgendaLoading value),
    @required Result error(AgendaError value),
    @required Result loaded(AgendaLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AgendaInitial value),
    Result loading(AgendaLoading value),
    Result error(AgendaError value),
    Result loaded(AgendaLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AgendaLoading implements AgendaState {
  const factory AgendaLoading() = _$AgendaLoading;
}

abstract class $AgendaErrorCopyWith<$Res> {
  factory $AgendaErrorCopyWith(
          AgendaError value, $Res Function(AgendaError) then) =
      _$AgendaErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

class _$AgendaErrorCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaErrorCopyWith<$Res> {
  _$AgendaErrorCopyWithImpl(
      AgendaError _value, $Res Function(AgendaError) _then)
      : super(_value, (v) => _then(v as AgendaError));

  @override
  AgendaError get _value => super._value as AgendaError;

  @override
  $Res call({
    Object exception = freezed,
  }) {
    return _then(AgendaError(
      exception == freezed ? _value.exception : exception as Exception,
    ));
  }
}

class _$AgendaError with DiagnosticableTreeMixin implements AgendaError {
  const _$AgendaError(this.exception) : assert(exception != null);

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

  @override
  $AgendaErrorCopyWith<AgendaError> get copyWith =>
      _$AgendaErrorCopyWithImpl<AgendaError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception exception),
    @required Result loaded(List<Event> events),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(exception);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception exception),
    Result loaded(List<Event> events),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AgendaInitial value),
    @required Result loading(AgendaLoading value),
    @required Result error(AgendaError value),
    @required Result loaded(AgendaLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AgendaInitial value),
    Result loading(AgendaLoading value),
    Result error(AgendaError value),
    Result loaded(AgendaLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AgendaError implements AgendaState {
  const factory AgendaError(Exception exception) = _$AgendaError;

  Exception get exception;
  $AgendaErrorCopyWith<AgendaError> get copyWith;
}

abstract class $AgendaLoadedCopyWith<$Res> {
  factory $AgendaLoadedCopyWith(
          AgendaLoaded value, $Res Function(AgendaLoaded) then) =
      _$AgendaLoadedCopyWithImpl<$Res>;
  $Res call({List<Event> events});
}

class _$AgendaLoadedCopyWithImpl<$Res> extends _$AgendaStateCopyWithImpl<$Res>
    implements $AgendaLoadedCopyWith<$Res> {
  _$AgendaLoadedCopyWithImpl(
      AgendaLoaded _value, $Res Function(AgendaLoaded) _then)
      : super(_value, (v) => _then(v as AgendaLoaded));

  @override
  AgendaLoaded get _value => super._value as AgendaLoaded;

  @override
  $Res call({
    Object events = freezed,
  }) {
    return _then(AgendaLoaded(
      events == freezed ? _value.events : events as List<Event>,
    ));
  }
}

class _$AgendaLoaded with DiagnosticableTreeMixin implements AgendaLoaded {
  const _$AgendaLoaded(this.events) : assert(events != null);

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

  @override
  $AgendaLoadedCopyWith<AgendaLoaded> get copyWith =>
      _$AgendaLoadedCopyWithImpl<AgendaLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Exception exception),
    @required Result loaded(List<Event> events),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(events);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Exception exception),
    Result loaded(List<Event> events),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AgendaInitial value),
    @required Result loading(AgendaLoading value),
    @required Result error(AgendaError value),
    @required Result loaded(AgendaLoaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AgendaInitial value),
    Result loading(AgendaLoading value),
    Result error(AgendaError value),
    Result loaded(AgendaLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AgendaLoaded implements AgendaState {
  const factory AgendaLoaded(List<Event> events) = _$AgendaLoaded;

  List<Event> get events;
  $AgendaLoadedCopyWith<AgendaLoaded> get copyWith;
}
