// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required String text,
      required String id_str,
      required String user_name,
      required String screen_name,
      required Uri profile_image_url_https,
      required Uri url,
      required DateTime created_at}) {
    return _Post(
      text: text,
      id_str: id_str,
      user_name: user_name,
      screen_name: screen_name,
      profile_image_url_https: profile_image_url_https,
      url: url,
      created_at: created_at,
    );
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get text => throw _privateConstructorUsedError;
  String get id_str => throw _privateConstructorUsedError;
  String get user_name => throw _privateConstructorUsedError;
  String get screen_name => throw _privateConstructorUsedError;
  Uri get profile_image_url_https => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String text,
      String id_str,
      String user_name,
      String screen_name,
      Uri profile_image_url_https,
      Uri url,
      DateTime created_at});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? id_str = freezed,
    Object? user_name = freezed,
    Object? screen_name = freezed,
    Object? profile_image_url_https = freezed,
    Object? url = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      id_str: id_str == freezed
          ? _value.id_str
          : id_str // ignore: cast_nullable_to_non_nullable
              as String,
      user_name: user_name == freezed
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String,
      screen_name: screen_name == freezed
          ? _value.screen_name
          : screen_name // ignore: cast_nullable_to_non_nullable
              as String,
      profile_image_url_https: profile_image_url_https == freezed
          ? _value.profile_image_url_https
          : profile_image_url_https // ignore: cast_nullable_to_non_nullable
              as Uri,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String text,
      String id_str,
      String user_name,
      String screen_name,
      Uri profile_image_url_https,
      Uri url,
      DateTime created_at});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? text = freezed,
    Object? id_str = freezed,
    Object? user_name = freezed,
    Object? screen_name = freezed,
    Object? profile_image_url_https = freezed,
    Object? url = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_Post(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      id_str: id_str == freezed
          ? _value.id_str
          : id_str // ignore: cast_nullable_to_non_nullable
              as String,
      user_name: user_name == freezed
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String,
      screen_name: screen_name == freezed
          ? _value.screen_name
          : screen_name // ignore: cast_nullable_to_non_nullable
              as String,
      profile_image_url_https: profile_image_url_https == freezed
          ? _value.profile_image_url_https
          : profile_image_url_https // ignore: cast_nullable_to_non_nullable
              as Uri,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
class _$_Post with DiagnosticableTreeMixin implements _Post {
  const _$_Post(
      {required this.text,
      required this.id_str,
      required this.user_name,
      required this.screen_name,
      required this.profile_image_url_https,
      required this.url,
      required this.created_at});

  @override
  final String text;
  @override
  final String id_str;
  @override
  final String user_name;
  @override
  final String screen_name;
  @override
  final Uri profile_image_url_https;
  @override
  final Uri url;
  @override
  final DateTime created_at;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Post(text: $text, id_str: $id_str, user_name: $user_name, screen_name: $screen_name, profile_image_url_https: $profile_image_url_https, url: $url, created_at: $created_at)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Post'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('id_str', id_str))
      ..add(DiagnosticsProperty('user_name', user_name))
      ..add(DiagnosticsProperty('screen_name', screen_name))
      ..add(DiagnosticsProperty(
          'profile_image_url_https', profile_image_url_https))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('created_at', created_at));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.id_str, id_str) ||
                const DeepCollectionEquality().equals(other.id_str, id_str)) &&
            (identical(other.user_name, user_name) ||
                const DeepCollectionEquality()
                    .equals(other.user_name, user_name)) &&
            (identical(other.screen_name, screen_name) ||
                const DeepCollectionEquality()
                    .equals(other.screen_name, screen_name)) &&
            (identical(
                    other.profile_image_url_https, profile_image_url_https) ||
                const DeepCollectionEquality().equals(
                    other.profile_image_url_https, profile_image_url_https)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(id_str) ^
      const DeepCollectionEquality().hash(user_name) ^
      const DeepCollectionEquality().hash(screen_name) ^
      const DeepCollectionEquality().hash(profile_image_url_https) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(created_at);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);
}

abstract class _Post implements Post {
  const factory _Post(
      {required String text,
      required String id_str,
      required String user_name,
      required String screen_name,
      required Uri profile_image_url_https,
      required Uri url,
      required DateTime created_at}) = _$_Post;

  @override
  String get text => throw _privateConstructorUsedError;
  @override
  String get id_str => throw _privateConstructorUsedError;
  @override
  String get user_name => throw _privateConstructorUsedError;
  @override
  String get screen_name => throw _privateConstructorUsedError;
  @override
  Uri get profile_image_url_https => throw _privateConstructorUsedError;
  @override
  Uri get url => throw _privateConstructorUsedError;
  @override
  DateTime get created_at => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
