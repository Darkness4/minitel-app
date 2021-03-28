// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'portal_login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PortalLoginStateTearOff {
  const _$PortalLoginStateTearOff();

  _PortalLoginState call(
      {required bool isSubmitting,
      required bool isSuccess,
      required bool isFailure,
      Exception? error}) {
    return _PortalLoginState(
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
      error: error,
    );
  }
}

/// @nodoc
const $PortalLoginState = _$PortalLoginStateTearOff();

/// @nodoc
mixin _$PortalLoginState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortalLoginStateCopyWith<PortalLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortalLoginStateCopyWith<$Res> {
  factory $PortalLoginStateCopyWith(
          PortalLoginState value, $Res Function(PortalLoginState) then) =
      _$PortalLoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting, bool isSuccess, bool isFailure, Exception? error});
}

/// @nodoc
class _$PortalLoginStateCopyWithImpl<$Res>
    implements $PortalLoginStateCopyWith<$Res> {
  _$PortalLoginStateCopyWithImpl(this._value, this._then);

  final PortalLoginState _value;
  // ignore: unused_field
  final $Res Function(PortalLoginState) _then;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: isFailure == freezed
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$PortalLoginStateCopyWith<$Res>
    implements $PortalLoginStateCopyWith<$Res> {
  factory _$PortalLoginStateCopyWith(
          _PortalLoginState value, $Res Function(_PortalLoginState) then) =
      __$PortalLoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting, bool isSuccess, bool isFailure, Exception? error});
}

/// @nodoc
class __$PortalLoginStateCopyWithImpl<$Res>
    extends _$PortalLoginStateCopyWithImpl<$Res>
    implements _$PortalLoginStateCopyWith<$Res> {
  __$PortalLoginStateCopyWithImpl(
      _PortalLoginState _value, $Res Function(_PortalLoginState) _then)
      : super(_value, (v) => _then(v as _PortalLoginState));

  @override
  _PortalLoginState get _value => super._value as _PortalLoginState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? error = freezed,
  }) {
    return _then(_PortalLoginState(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: isFailure == freezed
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
class _$_PortalLoginState
    with DiagnosticableTreeMixin
    implements _PortalLoginState {
  const _$_PortalLoginState(
      {required this.isSubmitting,
      required this.isSuccess,
      required this.isFailure,
      this.error});

  @override
  final bool isSubmitting;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final Exception? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalLoginState(isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalLoginState'))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('isFailure', isFailure))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortalLoginState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.isFailure, isFailure) ||
                const DeepCollectionEquality()
                    .equals(other.isFailure, isFailure)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(isFailure) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$PortalLoginStateCopyWith<_PortalLoginState> get copyWith =>
      __$PortalLoginStateCopyWithImpl<_PortalLoginState>(this, _$identity);
}

abstract class _PortalLoginState implements PortalLoginState {
  const factory _PortalLoginState(
      {required bool isSubmitting,
      required bool isSuccess,
      required bool isFailure,
      Exception? error}) = _$_PortalLoginState;

  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  bool get isSuccess => throw _privateConstructorUsedError;
  @override
  bool get isFailure => throw _privateConstructorUsedError;
  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PortalLoginStateCopyWith<_PortalLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
