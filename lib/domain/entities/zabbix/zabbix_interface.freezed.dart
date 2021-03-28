// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'zabbix_interface.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZabbixInterface _$ZabbixInterfaceFromJson(Map<String, dynamic> json) {
  return _ZabbixInterface.fromJson(json);
}

/// @nodoc
class _$ZabbixInterfaceTearOff {
  const _$ZabbixInterfaceTearOff();

  _ZabbixInterface call({required String ip}) {
    return _ZabbixInterface(
      ip: ip,
    );
  }

  ZabbixInterface fromJson(Map<String, Object> json) {
    return ZabbixInterface.fromJson(json);
  }
}

/// @nodoc
const $ZabbixInterface = _$ZabbixInterfaceTearOff();

/// @nodoc
mixin _$ZabbixInterface {
  String get ip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZabbixInterfaceCopyWith<ZabbixInterface> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZabbixInterfaceCopyWith<$Res> {
  factory $ZabbixInterfaceCopyWith(
          ZabbixInterface value, $Res Function(ZabbixInterface) then) =
      _$ZabbixInterfaceCopyWithImpl<$Res>;
  $Res call({String ip});
}

/// @nodoc
class _$ZabbixInterfaceCopyWithImpl<$Res>
    implements $ZabbixInterfaceCopyWith<$Res> {
  _$ZabbixInterfaceCopyWithImpl(this._value, this._then);

  final ZabbixInterface _value;
  // ignore: unused_field
  final $Res Function(ZabbixInterface) _then;

  @override
  $Res call({
    Object? ip = freezed,
  }) {
    return _then(_value.copyWith(
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ZabbixInterfaceCopyWith<$Res>
    implements $ZabbixInterfaceCopyWith<$Res> {
  factory _$ZabbixInterfaceCopyWith(
          _ZabbixInterface value, $Res Function(_ZabbixInterface) then) =
      __$ZabbixInterfaceCopyWithImpl<$Res>;
  @override
  $Res call({String ip});
}

/// @nodoc
class __$ZabbixInterfaceCopyWithImpl<$Res>
    extends _$ZabbixInterfaceCopyWithImpl<$Res>
    implements _$ZabbixInterfaceCopyWith<$Res> {
  __$ZabbixInterfaceCopyWithImpl(
      _ZabbixInterface _value, $Res Function(_ZabbixInterface) _then)
      : super(_value, (v) => _then(v as _ZabbixInterface));

  @override
  _ZabbixInterface get _value => super._value as _ZabbixInterface;

  @override
  $Res call({
    Object? ip = freezed,
  }) {
    return _then(_ZabbixInterface(
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ZabbixInterface implements _ZabbixInterface {
  const _$_ZabbixInterface({required this.ip});

  factory _$_ZabbixInterface.fromJson(Map<String, dynamic> json) =>
      _$_$_ZabbixInterfaceFromJson(json);

  @override
  final String ip;

  @override
  String toString() {
    return 'ZabbixInterface(ip: $ip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ZabbixInterface &&
            (identical(other.ip, ip) ||
                const DeepCollectionEquality().equals(other.ip, ip)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ip);

  @JsonKey(ignore: true)
  @override
  _$ZabbixInterfaceCopyWith<_ZabbixInterface> get copyWith =>
      __$ZabbixInterfaceCopyWithImpl<_ZabbixInterface>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ZabbixInterfaceToJson(this);
  }
}

abstract class _ZabbixInterface implements ZabbixInterface {
  const factory _ZabbixInterface({required String ip}) = _$_ZabbixInterface;

  factory _ZabbixInterface.fromJson(Map<String, dynamic> json) =
      _$_ZabbixInterface.fromJson;

  @override
  String get ip => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ZabbixInterfaceCopyWith<_ZabbixInterface> get copyWith =>
      throw _privateConstructorUsedError;
}
