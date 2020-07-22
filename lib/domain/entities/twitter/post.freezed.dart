// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PostTearOff {
  const _$PostTearOff();

// ignore: unused_element
  _Post call(
      {@required @nullable String text,
      @required @nullable String id_str,
      @required @nullable String user_name,
      @required @nullable String screen_name,
      @required @nullable Uri profile_image_url_https,
      @required @nullable Uri url,
      @required @nullable DateTime created_at}) {
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

// ignore: unused_element
const $Post = _$PostTearOff();

mixin _$Post {
  @nullable
  String get text;
  @nullable
  String get id_str;
  @nullable
  String get user_name;
  @nullable
  String get screen_name;
  @nullable
  Uri get profile_image_url_https;
  @nullable
  Uri get url;
  @nullable
  DateTime get created_at;

  $PostCopyWith<Post> get copyWith;
}

abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {@nullable String text,
      @nullable String id_str,
      @nullable String user_name,
      @nullable String screen_name,
      @nullable Uri profile_image_url_https,
      @nullable Uri url,
      @nullable DateTime created_at});
}

class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object text = freezed,
    Object id_str = freezed,
    Object user_name = freezed,
    Object screen_name = freezed,
    Object profile_image_url_https = freezed,
    Object url = freezed,
    Object created_at = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed ? _value.text : text as String,
      id_str: id_str == freezed ? _value.id_str : id_str as String,
      user_name: user_name == freezed ? _value.user_name : user_name as String,
      screen_name:
          screen_name == freezed ? _value.screen_name : screen_name as String,
      profile_image_url_https: profile_image_url_https == freezed
          ? _value.profile_image_url_https
          : profile_image_url_https as Uri,
      url: url == freezed ? _value.url : url as Uri,
      created_at:
          created_at == freezed ? _value.created_at : created_at as DateTime,
    ));
  }
}

abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String text,
      @nullable String id_str,
      @nullable String user_name,
      @nullable String screen_name,
      @nullable Uri profile_image_url_https,
      @nullable Uri url,
      @nullable DateTime created_at});
}

class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object text = freezed,
    Object id_str = freezed,
    Object user_name = freezed,
    Object screen_name = freezed,
    Object profile_image_url_https = freezed,
    Object url = freezed,
    Object created_at = freezed,
  }) {
    return _then(_Post(
      text: text == freezed ? _value.text : text as String,
      id_str: id_str == freezed ? _value.id_str : id_str as String,
      user_name: user_name == freezed ? _value.user_name : user_name as String,
      screen_name:
          screen_name == freezed ? _value.screen_name : screen_name as String,
      profile_image_url_https: profile_image_url_https == freezed
          ? _value.profile_image_url_https
          : profile_image_url_https as Uri,
      url: url == freezed ? _value.url : url as Uri,
      created_at:
          created_at == freezed ? _value.created_at : created_at as DateTime,
    ));
  }
}

class _$_Post with DiagnosticableTreeMixin implements _Post {
  const _$_Post(
      {@required @nullable this.text,
      @required @nullable this.id_str,
      @required @nullable this.user_name,
      @required @nullable this.screen_name,
      @required @nullable this.profile_image_url_https,
      @required @nullable this.url,
      @required @nullable this.created_at});

  @override
  @nullable
  final String text;
  @override
  @nullable
  final String id_str;
  @override
  @nullable
  final String user_name;
  @override
  @nullable
  final String screen_name;
  @override
  @nullable
  final Uri profile_image_url_https;
  @override
  @nullable
  final Uri url;
  @override
  @nullable
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

  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);
}

abstract class _Post implements Post {
  const factory _Post(
      {@required @nullable String text,
      @required @nullable String id_str,
      @required @nullable String user_name,
      @required @nullable String screen_name,
      @required @nullable Uri profile_image_url_https,
      @required @nullable Uri url,
      @required @nullable DateTime created_at}) = _$_Post;

  @override
  @nullable
  String get text;
  @override
  @nullable
  String get id_str;
  @override
  @nullable
  String get user_name;
  @override
  @nullable
  String get screen_name;
  @override
  @nullable
  Uri get profile_image_url_https;
  @override
  @nullable
  Uri get url;
  @override
  @nullable
  DateTime get created_at;
  @override
  _$PostCopyWith<_Post> get copyWith;
}
