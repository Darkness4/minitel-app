// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubRelease _$GithubReleaseFromJson(Map<String, dynamic> json) {
  return _GithubRelease.fromJson(json);
}

/// @nodoc
class _$GithubReleaseTearOff {
  const _$GithubReleaseTearOff();

  _GithubRelease call(
      {required String url,
      required String html_url,
      required String assets_url,
      required String upload_url,
      required String tarball_url,
      required String zipball_url,
      required int id,
      required String node_id,
      required String tag_name,
      required String target_commitish,
      required String name,
      required String body,
      required bool draft,
      required bool prerelease,
      required DateTime created_at,
      required DateTime published_at,
      required GithubUser author,
      required List<GithubAsset> assets}) {
    return _GithubRelease(
      url: url,
      html_url: html_url,
      assets_url: assets_url,
      upload_url: upload_url,
      tarball_url: tarball_url,
      zipball_url: zipball_url,
      id: id,
      node_id: node_id,
      tag_name: tag_name,
      target_commitish: target_commitish,
      name: name,
      body: body,
      draft: draft,
      prerelease: prerelease,
      created_at: created_at,
      published_at: published_at,
      author: author,
      assets: assets,
    );
  }

  GithubRelease fromJson(Map<String, Object> json) {
    return GithubRelease.fromJson(json);
  }
}

/// @nodoc
const $GithubRelease = _$GithubReleaseTearOff();

/// @nodoc
mixin _$GithubRelease {
  String get url => throw _privateConstructorUsedError;
  String get html_url => throw _privateConstructorUsedError;
  String get assets_url => throw _privateConstructorUsedError;
  String get upload_url => throw _privateConstructorUsedError;
  String get tarball_url => throw _privateConstructorUsedError;
  String get zipball_url => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get node_id => throw _privateConstructorUsedError;
  String get tag_name => throw _privateConstructorUsedError;
  String get target_commitish => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  bool get draft => throw _privateConstructorUsedError;
  bool get prerelease => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  DateTime get published_at => throw _privateConstructorUsedError;
  GithubUser get author => throw _privateConstructorUsedError;
  List<GithubAsset> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubReleaseCopyWith<GithubRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubReleaseCopyWith<$Res> {
  factory $GithubReleaseCopyWith(
          GithubRelease value, $Res Function(GithubRelease) then) =
      _$GithubReleaseCopyWithImpl<$Res>;
  $Res call(
      {String url,
      String html_url,
      String assets_url,
      String upload_url,
      String tarball_url,
      String zipball_url,
      int id,
      String node_id,
      String tag_name,
      String target_commitish,
      String name,
      String body,
      bool draft,
      bool prerelease,
      DateTime created_at,
      DateTime published_at,
      GithubUser author,
      List<GithubAsset> assets});

  $GithubUserCopyWith<$Res> get author;
}

/// @nodoc
class _$GithubReleaseCopyWithImpl<$Res>
    implements $GithubReleaseCopyWith<$Res> {
  _$GithubReleaseCopyWithImpl(this._value, this._then);

  final GithubRelease _value;
  // ignore: unused_field
  final $Res Function(GithubRelease) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? html_url = freezed,
    Object? assets_url = freezed,
    Object? upload_url = freezed,
    Object? tarball_url = freezed,
    Object? zipball_url = freezed,
    Object? id = freezed,
    Object? node_id = freezed,
    Object? tag_name = freezed,
    Object? target_commitish = freezed,
    Object? name = freezed,
    Object? body = freezed,
    Object? draft = freezed,
    Object? prerelease = freezed,
    Object? created_at = freezed,
    Object? published_at = freezed,
    Object? author = freezed,
    Object? assets = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      html_url: html_url == freezed
          ? _value.html_url
          : html_url // ignore: cast_nullable_to_non_nullable
              as String,
      assets_url: assets_url == freezed
          ? _value.assets_url
          : assets_url // ignore: cast_nullable_to_non_nullable
              as String,
      upload_url: upload_url == freezed
          ? _value.upload_url
          : upload_url // ignore: cast_nullable_to_non_nullable
              as String,
      tarball_url: tarball_url == freezed
          ? _value.tarball_url
          : tarball_url // ignore: cast_nullable_to_non_nullable
              as String,
      zipball_url: zipball_url == freezed
          ? _value.zipball_url
          : zipball_url // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      node_id: node_id == freezed
          ? _value.node_id
          : node_id // ignore: cast_nullable_to_non_nullable
              as String,
      tag_name: tag_name == freezed
          ? _value.tag_name
          : tag_name // ignore: cast_nullable_to_non_nullable
              as String,
      target_commitish: target_commitish == freezed
          ? _value.target_commitish
          : target_commitish // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      draft: draft == freezed
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool,
      prerelease: prerelease == freezed
          ? _value.prerelease
          : prerelease // ignore: cast_nullable_to_non_nullable
              as bool,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      published_at: published_at == freezed
          ? _value.published_at
          : published_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as GithubUser,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GithubAsset>,
    ));
  }

  @override
  $GithubUserCopyWith<$Res> get author {
    return $GithubUserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }
}

/// @nodoc
abstract class _$GithubReleaseCopyWith<$Res>
    implements $GithubReleaseCopyWith<$Res> {
  factory _$GithubReleaseCopyWith(
          _GithubRelease value, $Res Function(_GithubRelease) then) =
      __$GithubReleaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String url,
      String html_url,
      String assets_url,
      String upload_url,
      String tarball_url,
      String zipball_url,
      int id,
      String node_id,
      String tag_name,
      String target_commitish,
      String name,
      String body,
      bool draft,
      bool prerelease,
      DateTime created_at,
      DateTime published_at,
      GithubUser author,
      List<GithubAsset> assets});

  @override
  $GithubUserCopyWith<$Res> get author;
}

/// @nodoc
class __$GithubReleaseCopyWithImpl<$Res>
    extends _$GithubReleaseCopyWithImpl<$Res>
    implements _$GithubReleaseCopyWith<$Res> {
  __$GithubReleaseCopyWithImpl(
      _GithubRelease _value, $Res Function(_GithubRelease) _then)
      : super(_value, (v) => _then(v as _GithubRelease));

  @override
  _GithubRelease get _value => super._value as _GithubRelease;

  @override
  $Res call({
    Object? url = freezed,
    Object? html_url = freezed,
    Object? assets_url = freezed,
    Object? upload_url = freezed,
    Object? tarball_url = freezed,
    Object? zipball_url = freezed,
    Object? id = freezed,
    Object? node_id = freezed,
    Object? tag_name = freezed,
    Object? target_commitish = freezed,
    Object? name = freezed,
    Object? body = freezed,
    Object? draft = freezed,
    Object? prerelease = freezed,
    Object? created_at = freezed,
    Object? published_at = freezed,
    Object? author = freezed,
    Object? assets = freezed,
  }) {
    return _then(_GithubRelease(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      html_url: html_url == freezed
          ? _value.html_url
          : html_url // ignore: cast_nullable_to_non_nullable
              as String,
      assets_url: assets_url == freezed
          ? _value.assets_url
          : assets_url // ignore: cast_nullable_to_non_nullable
              as String,
      upload_url: upload_url == freezed
          ? _value.upload_url
          : upload_url // ignore: cast_nullable_to_non_nullable
              as String,
      tarball_url: tarball_url == freezed
          ? _value.tarball_url
          : tarball_url // ignore: cast_nullable_to_non_nullable
              as String,
      zipball_url: zipball_url == freezed
          ? _value.zipball_url
          : zipball_url // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      node_id: node_id == freezed
          ? _value.node_id
          : node_id // ignore: cast_nullable_to_non_nullable
              as String,
      tag_name: tag_name == freezed
          ? _value.tag_name
          : tag_name // ignore: cast_nullable_to_non_nullable
              as String,
      target_commitish: target_commitish == freezed
          ? _value.target_commitish
          : target_commitish // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      draft: draft == freezed
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool,
      prerelease: prerelease == freezed
          ? _value.prerelease
          : prerelease // ignore: cast_nullable_to_non_nullable
              as bool,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      published_at: published_at == freezed
          ? _value.published_at
          : published_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as GithubUser,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GithubAsset>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GithubRelease implements _GithubRelease {
  const _$_GithubRelease(
      {required this.url,
      required this.html_url,
      required this.assets_url,
      required this.upload_url,
      required this.tarball_url,
      required this.zipball_url,
      required this.id,
      required this.node_id,
      required this.tag_name,
      required this.target_commitish,
      required this.name,
      required this.body,
      required this.draft,
      required this.prerelease,
      required this.created_at,
      required this.published_at,
      required this.author,
      required this.assets});

  factory _$_GithubRelease.fromJson(Map<String, dynamic> json) =>
      _$_$_GithubReleaseFromJson(json);

  @override
  final String url;
  @override
  final String html_url;
  @override
  final String assets_url;
  @override
  final String upload_url;
  @override
  final String tarball_url;
  @override
  final String zipball_url;
  @override
  final int id;
  @override
  final String node_id;
  @override
  final String tag_name;
  @override
  final String target_commitish;
  @override
  final String name;
  @override
  final String body;
  @override
  final bool draft;
  @override
  final bool prerelease;
  @override
  final DateTime created_at;
  @override
  final DateTime published_at;
  @override
  final GithubUser author;
  @override
  final List<GithubAsset> assets;

  @override
  String toString() {
    return 'GithubRelease(url: $url, html_url: $html_url, assets_url: $assets_url, upload_url: $upload_url, tarball_url: $tarball_url, zipball_url: $zipball_url, id: $id, node_id: $node_id, tag_name: $tag_name, target_commitish: $target_commitish, name: $name, body: $body, draft: $draft, prerelease: $prerelease, created_at: $created_at, published_at: $published_at, author: $author, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubRelease &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.html_url, html_url) ||
                const DeepCollectionEquality()
                    .equals(other.html_url, html_url)) &&
            (identical(other.assets_url, assets_url) ||
                const DeepCollectionEquality()
                    .equals(other.assets_url, assets_url)) &&
            (identical(other.upload_url, upload_url) ||
                const DeepCollectionEquality()
                    .equals(other.upload_url, upload_url)) &&
            (identical(other.tarball_url, tarball_url) ||
                const DeepCollectionEquality()
                    .equals(other.tarball_url, tarball_url)) &&
            (identical(other.zipball_url, zipball_url) ||
                const DeepCollectionEquality()
                    .equals(other.zipball_url, zipball_url)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.node_id, node_id) ||
                const DeepCollectionEquality()
                    .equals(other.node_id, node_id)) &&
            (identical(other.tag_name, tag_name) ||
                const DeepCollectionEquality()
                    .equals(other.tag_name, tag_name)) &&
            (identical(other.target_commitish, target_commitish) ||
                const DeepCollectionEquality()
                    .equals(other.target_commitish, target_commitish)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.draft, draft) ||
                const DeepCollectionEquality().equals(other.draft, draft)) &&
            (identical(other.prerelease, prerelease) ||
                const DeepCollectionEquality()
                    .equals(other.prerelease, prerelease)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.published_at, published_at) ||
                const DeepCollectionEquality()
                    .equals(other.published_at, published_at)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(html_url) ^
      const DeepCollectionEquality().hash(assets_url) ^
      const DeepCollectionEquality().hash(upload_url) ^
      const DeepCollectionEquality().hash(tarball_url) ^
      const DeepCollectionEquality().hash(zipball_url) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(node_id) ^
      const DeepCollectionEquality().hash(tag_name) ^
      const DeepCollectionEquality().hash(target_commitish) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(draft) ^
      const DeepCollectionEquality().hash(prerelease) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(published_at) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(assets);

  @JsonKey(ignore: true)
  @override
  _$GithubReleaseCopyWith<_GithubRelease> get copyWith =>
      __$GithubReleaseCopyWithImpl<_GithubRelease>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GithubReleaseToJson(this);
  }
}

abstract class _GithubRelease implements GithubRelease {
  const factory _GithubRelease(
      {required String url,
      required String html_url,
      required String assets_url,
      required String upload_url,
      required String tarball_url,
      required String zipball_url,
      required int id,
      required String node_id,
      required String tag_name,
      required String target_commitish,
      required String name,
      required String body,
      required bool draft,
      required bool prerelease,
      required DateTime created_at,
      required DateTime published_at,
      required GithubUser author,
      required List<GithubAsset> assets}) = _$_GithubRelease;

  factory _GithubRelease.fromJson(Map<String, dynamic> json) =
      _$_GithubRelease.fromJson;

  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get html_url => throw _privateConstructorUsedError;
  @override
  String get assets_url => throw _privateConstructorUsedError;
  @override
  String get upload_url => throw _privateConstructorUsedError;
  @override
  String get tarball_url => throw _privateConstructorUsedError;
  @override
  String get zipball_url => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get node_id => throw _privateConstructorUsedError;
  @override
  String get tag_name => throw _privateConstructorUsedError;
  @override
  String get target_commitish => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  bool get draft => throw _privateConstructorUsedError;
  @override
  bool get prerelease => throw _privateConstructorUsedError;
  @override
  DateTime get created_at => throw _privateConstructorUsedError;
  @override
  DateTime get published_at => throw _privateConstructorUsedError;
  @override
  GithubUser get author => throw _privateConstructorUsedError;
  @override
  List<GithubAsset> get assets => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubReleaseCopyWith<_GithubRelease> get copyWith =>
      throw _privateConstructorUsedError;
}
