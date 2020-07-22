// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

// ignore: unused_element
  _ThemeState call(ThemeData themeData, ThemeData darkThemeData, String value) {
    return _ThemeState(
      themeData,
      darkThemeData,
      value,
    );
  }
}

// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

mixin _$ThemeState {
  ThemeData get themeData;
  ThemeData get darkThemeData;
  String get value;

  $ThemeStateCopyWith<ThemeState> get copyWith;
}

abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeData themeData, ThemeData darkThemeData, String value});
}

class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object themeData = freezed,
    Object darkThemeData = freezed,
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
      darkThemeData: darkThemeData == freezed
          ? _value.darkThemeData
          : darkThemeData as ThemeData,
      value: value == freezed ? _value.value : value as String,
    ));
  }
}

abstract class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(
          _ThemeState value, $Res Function(_ThemeState) then) =
      __$ThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({ThemeData themeData, ThemeData darkThemeData, String value});
}

class __$ThemeStateCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(
      _ThemeState _value, $Res Function(_ThemeState) _then)
      : super(_value, (v) => _then(v as _ThemeState));

  @override
  _ThemeState get _value => super._value as _ThemeState;

  @override
  $Res call({
    Object themeData = freezed,
    Object darkThemeData = freezed,
    Object value = freezed,
  }) {
    return _then(_ThemeState(
      themeData == freezed ? _value.themeData : themeData as ThemeData,
      darkThemeData == freezed
          ? _value.darkThemeData
          : darkThemeData as ThemeData,
      value == freezed ? _value.value : value as String,
    ));
  }
}

class _$_ThemeState extends _ThemeState with DiagnosticableTreeMixin {
  const _$_ThemeState(this.themeData, this.darkThemeData, this.value)
      : assert(themeData != null),
        assert(darkThemeData != null),
        assert(value != null),
        super._();

  @override
  final ThemeData themeData;
  @override
  final ThemeData darkThemeData;
  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState(themeData: $themeData, darkThemeData: $darkThemeData, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeState'))
      ..add(DiagnosticsProperty('themeData', themeData))
      ..add(DiagnosticsProperty('darkThemeData', darkThemeData))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeState &&
            (identical(other.themeData, themeData) ||
                const DeepCollectionEquality()
                    .equals(other.themeData, themeData)) &&
            (identical(other.darkThemeData, darkThemeData) ||
                const DeepCollectionEquality()
                    .equals(other.darkThemeData, darkThemeData)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(themeData) ^
      const DeepCollectionEquality().hash(darkThemeData) ^
      const DeepCollectionEquality().hash(value);

  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);
}

abstract class _ThemeState extends ThemeState {
  const _ThemeState._() : super._();
  const factory _ThemeState(
          ThemeData themeData, ThemeData darkThemeData, String value) =
      _$_ThemeState;

  @override
  ThemeData get themeData;
  @override
  ThemeData get darkThemeData;
  @override
  String get value;
  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith;
}
