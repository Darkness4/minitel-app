// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubAsset _$GithubAssetFromJson(Map<String, dynamic> json) {
  return _GithubAsset.fromJson(json);
}

/// @nodoc
class _$GithubAssetTearOff {
  const _$GithubAssetTearOff();

  _GithubAsset call(
      {required String url,
      required String browser_download_url,
      required int id,
      required String node_id,
      required String name,
      required String label,
      required String state,
      required String content_type,
      required int size,
      required int download_count,
      required DateTime created_at,
      required DateTime updated_at,
      required GithubUser uploader}) {
    return _GithubAsset(
      url: url,
      browser_download_url: browser_download_url,
      id: id,
      node_id: node_id,
      name: name,
      label: label,
      state: state,
      content_type: content_type,
      size: size,
      download_count: download_count,
      created_at: created_at,
      updated_at: updated_at,
      uploader: uploader,
    );
  }

  GithubAsset fromJson(Map<String, Object> json) {
    return GithubAsset.fromJson(json);
  }
}

/// @nodoc
const $GithubAsset = _$GithubAssetTearOff();

/// @nodoc
mixin _$GithubAsset {
  String get url => throw _privateConstructorUsedError;
  String get browser_download_url => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get node_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get content_type => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get download_count => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  DateTime get updated_at => throw _privateConstructorUsedError;
  GithubUser get uploader => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubAssetCopyWith<GithubAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubAssetCopyWith<$Res> {
  factory $GithubAssetCopyWith(
          GithubAsset value, $Res Function(GithubAsset) then) =
      _$GithubAssetCopyWithImpl<$Res>;
  $Res call(
      {String url,
      String browser_download_url,
      int id,
      String node_id,
      String name,
      String label,
      String state,
      String content_type,
      int size,
      int download_count,
      DateTime created_at,
      DateTime updated_at,
      GithubUser uploader});

  $GithubUserCopyWith<$Res> get uploader;
}

/// @nodoc
class _$GithubAssetCopyWithImpl<$Res> implements $GithubAssetCopyWith<$Res> {
  _$GithubAssetCopyWithImpl(this._value, this._then);

  final GithubAsset _value;
  // ignore: unused_field
  final $Res Function(GithubAsset) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? browser_download_url = freezed,
    Object? id = freezed,
    Object? node_id = freezed,
    Object? name = freezed,
    Object? label = freezed,
    Object? state = freezed,
    Object? content_type = freezed,
    Object? size = freezed,
    Object? download_count = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? uploader = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      browser_download_url: browser_download_url == freezed
          ? _value.browser_download_url
          : browser_download_url // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      node_id: node_id == freezed
          ? _value.node_id
          : node_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      content_type: content_type == freezed
          ? _value.content_type
          : content_type // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      download_count: download_count == freezed
          ? _value.download_count
          : download_count // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploader: uploader == freezed
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as GithubUser,
    ));
  }

  @override
  $GithubUserCopyWith<$Res> get uploader {
    return $GithubUserCopyWith<$Res>(_value.uploader, (value) {
      return _then(_value.copyWith(uploader: value));
    });
  }
}

/// @nodoc
abstract class _$GithubAssetCopyWith<$Res>
    implements $GithubAssetCopyWith<$Res> {
  factory _$GithubAssetCopyWith(
          _GithubAsset value, $Res Function(_GithubAsset) then) =
      __$GithubAssetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String url,
      String browser_download_url,
      int id,
      String node_id,
      String name,
      String label,
      String state,
      String content_type,
      int size,
      int download_count,
      DateTime created_at,
      DateTime updated_at,
      GithubUser uploader});

  @override
  $GithubUserCopyWith<$Res> get uploader;
}

/// @nodoc
class __$GithubAssetCopyWithImpl<$Res> extends _$GithubAssetCopyWithImpl<$Res>
    implements _$GithubAssetCopyWith<$Res> {
  __$GithubAssetCopyWithImpl(
      _GithubAsset _value, $Res Function(_GithubAsset) _then)
      : super(_value, (v) => _then(v as _GithubAsset));

  @override
  _GithubAsset get _value => super._value as _GithubAsset;

  @override
  $Res call({
    Object? url = freezed,
    Object? browser_download_url = freezed,
    Object? id = freezed,
    Object? node_id = freezed,
    Object? name = freezed,
    Object? label = freezed,
    Object? state = freezed,
    Object? content_type = freezed,
    Object? size = freezed,
    Object? download_count = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? uploader = freezed,
  }) {
    return _then(_GithubAsset(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      browser_download_url: browser_download_url == freezed
          ? _value.browser_download_url
          : browser_download_url // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      node_id: node_id == freezed
          ? _value.node_id
          : node_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      content_type: content_type == freezed
          ? _value.content_type
          : content_type // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      download_count: download_count == freezed
          ? _value.download_count
          : download_count // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploader: uploader == freezed
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as GithubUser,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GithubAsset implements _GithubAsset {
  const _$_GithubAsset(
      {required this.url,
      required this.browser_download_url,
      required this.id,
      required this.node_id,
      required this.name,
      required this.label,
      required this.state,
      required this.content_type,
      required this.size,
      required this.download_count,
      required this.created_at,
      required this.updated_at,
      required this.uploader});

  factory _$_GithubAsset.fromJson(Map<String, dynamic> json) =>
      _$_$_GithubAssetFromJson(json);

  @override
  final String url;
  @override
  final String browser_download_url;
  @override
  final int id;
  @override
  final String node_id;
  @override
  final String name;
  @override
  final String label;
  @override
  final String state;
  @override
  final String content_type;
  @override
  final int size;
  @override
  final int download_count;
  @override
  final DateTime created_at;
  @override
  final DateTime updated_at;
  @override
  final GithubUser uploader;

  @override
  String toString() {
    return 'GithubAsset(url: $url, browser_download_url: $browser_download_url, id: $id, node_id: $node_id, name: $name, label: $label, state: $state, content_type: $content_type, size: $size, download_count: $download_count, created_at: $created_at, updated_at: $updated_at, uploader: $uploader)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubAsset &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.browser_download_url, browser_download_url) ||
                const DeepCollectionEquality().equals(
                    other.browser_download_url, browser_download_url)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.node_id, node_id) ||
                const DeepCollectionEquality()
                    .equals(other.node_id, node_id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.content_type, content_type) ||
                const DeepCollectionEquality()
                    .equals(other.content_type, content_type)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.download_count, download_count) ||
                const DeepCollectionEquality()
                    .equals(other.download_count, download_count)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.uploader, uploader) ||
                const DeepCollectionEquality()
                    .equals(other.uploader, uploader)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(browser_download_url) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(node_id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(content_type) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(download_count) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(uploader);

  @JsonKey(ignore: true)
  @override
  _$GithubAssetCopyWith<_GithubAsset> get copyWith =>
      __$GithubAssetCopyWithImpl<_GithubAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GithubAssetToJson(this);
  }
}

abstract class _GithubAsset implements GithubAsset {
  const factory _GithubAsset(
      {required String url,
      required String browser_download_url,
      required int id,
      required String node_id,
      required String name,
      required String label,
      required String state,
      required String content_type,
      required int size,
      required int download_count,
      required DateTime created_at,
      required DateTime updated_at,
      required GithubUser uploader}) = _$_GithubAsset;

  factory _GithubAsset.fromJson(Map<String, dynamic> json) =
      _$_GithubAsset.fromJson;

  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get browser_download_url => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get node_id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  String get state => throw _privateConstructorUsedError;
  @override
  String get content_type => throw _privateConstructorUsedError;
  @override
  int get size => throw _privateConstructorUsedError;
  @override
  int get download_count => throw _privateConstructorUsedError;
  @override
  DateTime get created_at => throw _privateConstructorUsedError;
  @override
  DateTime get updated_at => throw _privateConstructorUsedError;
  @override
  GithubUser get uploader => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubAssetCopyWith<_GithubAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
