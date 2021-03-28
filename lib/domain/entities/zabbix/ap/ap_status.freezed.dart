// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ap_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$APStatusTearOff {
  const _$APStatusTearOff();

  _APStatus call(
      {required String hostname,
      required Duration uptime,
      required int utilization5G,
      required int utilization2G,
      required int users,
      required int snmpAvailable}) {
    return _APStatus(
      hostname: hostname,
      uptime: uptime,
      utilization5G: utilization5G,
      utilization2G: utilization2G,
      users: users,
      snmpAvailable: snmpAvailable,
    );
  }
}

/// @nodoc
const $APStatus = _$APStatusTearOff();

/// @nodoc
mixin _$APStatus {
  String get hostname => throw _privateConstructorUsedError;
  Duration get uptime => throw _privateConstructorUsedError;
  int get utilization5G => throw _privateConstructorUsedError;
  int get utilization2G => throw _privateConstructorUsedError;
  int get users => throw _privateConstructorUsedError;
  int get snmpAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $APStatusCopyWith<APStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APStatusCopyWith<$Res> {
  factory $APStatusCopyWith(APStatus value, $Res Function(APStatus) then) =
      _$APStatusCopyWithImpl<$Res>;
  $Res call(
      {String hostname,
      Duration uptime,
      int utilization5G,
      int utilization2G,
      int users,
      int snmpAvailable});
}

/// @nodoc
class _$APStatusCopyWithImpl<$Res> implements $APStatusCopyWith<$Res> {
  _$APStatusCopyWithImpl(this._value, this._then);

  final APStatus _value;
  // ignore: unused_field
  final $Res Function(APStatus) _then;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? uptime = freezed,
    Object? utilization5G = freezed,
    Object? utilization2G = freezed,
    Object? users = freezed,
    Object? snmpAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      uptime: uptime == freezed
          ? _value.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as Duration,
      utilization5G: utilization5G == freezed
          ? _value.utilization5G
          : utilization5G // ignore: cast_nullable_to_non_nullable
              as int,
      utilization2G: utilization2G == freezed
          ? _value.utilization2G
          : utilization2G // ignore: cast_nullable_to_non_nullable
              as int,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as int,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$APStatusCopyWith<$Res> implements $APStatusCopyWith<$Res> {
  factory _$APStatusCopyWith(_APStatus value, $Res Function(_APStatus) then) =
      __$APStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String hostname,
      Duration uptime,
      int utilization5G,
      int utilization2G,
      int users,
      int snmpAvailable});
}

/// @nodoc
class __$APStatusCopyWithImpl<$Res> extends _$APStatusCopyWithImpl<$Res>
    implements _$APStatusCopyWith<$Res> {
  __$APStatusCopyWithImpl(_APStatus _value, $Res Function(_APStatus) _then)
      : super(_value, (v) => _then(v as _APStatus));

  @override
  _APStatus get _value => super._value as _APStatus;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? uptime = freezed,
    Object? utilization5G = freezed,
    Object? utilization2G = freezed,
    Object? users = freezed,
    Object? snmpAvailable = freezed,
  }) {
    return _then(_APStatus(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      uptime: uptime == freezed
          ? _value.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as Duration,
      utilization5G: utilization5G == freezed
          ? _value.utilization5G
          : utilization5G // ignore: cast_nullable_to_non_nullable
              as int,
      utilization2G: utilization2G == freezed
          ? _value.utilization2G
          : utilization2G // ignore: cast_nullable_to_non_nullable
              as int,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as int,
      snmpAvailable: snmpAvailable == freezed
          ? _value.snmpAvailable
          : snmpAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_APStatus implements _APStatus {
  const _$_APStatus(
      {required this.hostname,
      required this.uptime,
      required this.utilization5G,
      required this.utilization2G,
      required this.users,
      required this.snmpAvailable});

  @override
  final String hostname;
  @override
  final Duration uptime;
  @override
  final int utilization5G;
  @override
  final int utilization2G;
  @override
  final int users;
  @override
  final int snmpAvailable;

  @override
  String toString() {
    return 'APStatus(hostname: $hostname, uptime: $uptime, utilization5G: $utilization5G, utilization2G: $utilization2G, users: $users, snmpAvailable: $snmpAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _APStatus &&
            (identical(other.hostname, hostname) ||
                const DeepCollectionEquality()
                    .equals(other.hostname, hostname)) &&
            (identical(other.uptime, uptime) ||
                const DeepCollectionEquality().equals(other.uptime, uptime)) &&
            (identical(other.utilization5G, utilization5G) ||
                const DeepCollectionEquality()
                    .equals(other.utilization5G, utilization5G)) &&
            (identical(other.utilization2G, utilization2G) ||
                const DeepCollectionEquality()
                    .equals(other.utilization2G, utilization2G)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.snmpAvailable, snmpAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.snmpAvailable, snmpAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hostname) ^
      const DeepCollectionEquality().hash(uptime) ^
      const DeepCollectionEquality().hash(utilization5G) ^
      const DeepCollectionEquality().hash(utilization2G) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(snmpAvailable);

  @JsonKey(ignore: true)
  @override
  _$APStatusCopyWith<_APStatus> get copyWith =>
      __$APStatusCopyWithImpl<_APStatus>(this, _$identity);
}

abstract class _APStatus implements APStatus {
  const factory _APStatus(
      {required String hostname,
      required Duration uptime,
      required int utilization5G,
      required int utilization2G,
      required int users,
      required int snmpAvailable}) = _$_APStatus;

  @override
  String get hostname => throw _privateConstructorUsedError;
  @override
  Duration get uptime => throw _privateConstructorUsedError;
  @override
  int get utilization5G => throw _privateConstructorUsedError;
  @override
  int get utilization2G => throw _privateConstructorUsedError;
  @override
  int get users => throw _privateConstructorUsedError;
  @override
  int get snmpAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$APStatusCopyWith<_APStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
