// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GithubAsset _$GithubAssetFromJson(Map<String, dynamic> json) {
  return _GithubAsset.fromJson(json);
}

/// @nodoc
class _$GithubAssetTearOff {
  const _$GithubAssetTearOff();

// ignore: unused_element
  _GithubAsset call(
      {@required @nullable String url,
      @required @nullable String browser_download_url,
      @required @nullable int id,
      @required @nullable String node_id,
      @required @nullable String name,
      @required @nullable String label,
      @required @nullable String state,
      @required @nullable String content_type,
      @required @nullable int size,
      @required @nullable int download_count,
      @required @nullable DateTime created_at,
      @required @nullable DateTime updated_at,
      @required @nullable GithubUser uploader}) {
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

// ignore: unused_element
  GithubAsset fromJson(Map<String, Object> json) {
    return GithubAsset.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GithubAsset = _$GithubAssetTearOff();

/// @nodoc
mixin _$GithubAsset {
  @nullable
  String get url;
  @nullable
  String get browser_download_url;
  @nullable
  int get id;
  @nullable
  String get node_id;
  @nullable
  String get name;
  @nullable
  String get label;
  @nullable
  String get state;
  @nullable
  String get content_type;
  @nullable
  int get size;
  @nullable
  int get download_count;
  @nullable
  DateTime get created_at;
  @nullable
  DateTime get updated_at;
  @nullable
  GithubUser get uploader;

  Map<String, dynamic> toJson();
  $GithubAssetCopyWith<GithubAsset> get copyWith;
}

/// @nodoc
abstract class $GithubAssetCopyWith<$Res> {
  factory $GithubAssetCopyWith(
          GithubAsset value, $Res Function(GithubAsset) then) =
      _$GithubAssetCopyWithImpl<$Res>;
  $Res call(
      {@nullable String url,
      @nullable String browser_download_url,
      @nullable int id,
      @nullable String node_id,
      @nullable String name,
      @nullable String label,
      @nullable String state,
      @nullable String content_type,
      @nullable int size,
      @nullable int download_count,
      @nullable DateTime created_at,
      @nullable DateTime updated_at,
      @nullable GithubUser uploader});

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
    Object url = freezed,
    Object browser_download_url = freezed,
    Object id = freezed,
    Object node_id = freezed,
    Object name = freezed,
    Object label = freezed,
    Object state = freezed,
    Object content_type = freezed,
    Object size = freezed,
    Object download_count = freezed,
    Object created_at = freezed,
    Object updated_at = freezed,
    Object uploader = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed ? _value.url : url as String,
      browser_download_url: browser_download_url == freezed
          ? _value.browser_download_url
          : browser_download_url as String,
      id: id == freezed ? _value.id : id as int,
      node_id: node_id == freezed ? _value.node_id : node_id as String,
      name: name == freezed ? _value.name : name as String,
      label: label == freezed ? _value.label : label as String,
      state: state == freezed ? _value.state : state as String,
      content_type: content_type == freezed
          ? _value.content_type
          : content_type as String,
      size: size == freezed ? _value.size : size as int,
      download_count: download_count == freezed
          ? _value.download_count
          : download_count as int,
      created_at:
          created_at == freezed ? _value.created_at : created_at as DateTime,
      updated_at:
          updated_at == freezed ? _value.updated_at : updated_at as DateTime,
      uploader: uploader == freezed ? _value.uploader : uploader as GithubUser,
    ));
  }

  @override
  $GithubUserCopyWith<$Res> get uploader {
    if (_value.uploader == null) {
      return null;
    }
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
      {@nullable String url,
      @nullable String browser_download_url,
      @nullable int id,
      @nullable String node_id,
      @nullable String name,
      @nullable String label,
      @nullable String state,
      @nullable String content_type,
      @nullable int size,
      @nullable int download_count,
      @nullable DateTime created_at,
      @nullable DateTime updated_at,
      @nullable GithubUser uploader});

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
    Object url = freezed,
    Object browser_download_url = freezed,
    Object id = freezed,
    Object node_id = freezed,
    Object name = freezed,
    Object label = freezed,
    Object state = freezed,
    Object content_type = freezed,
    Object size = freezed,
    Object download_count = freezed,
    Object created_at = freezed,
    Object updated_at = freezed,
    Object uploader = freezed,
  }) {
    return _then(_GithubAsset(
      url: url == freezed ? _value.url : url as String,
      browser_download_url: browser_download_url == freezed
          ? _value.browser_download_url
          : browser_download_url as String,
      id: id == freezed ? _value.id : id as int,
      node_id: node_id == freezed ? _value.node_id : node_id as String,
      name: name == freezed ? _value.name : name as String,
      label: label == freezed ? _value.label : label as String,
      state: state == freezed ? _value.state : state as String,
      content_type: content_type == freezed
          ? _value.content_type
          : content_type as String,
      size: size == freezed ? _value.size : size as int,
      download_count: download_count == freezed
          ? _value.download_count
          : download_count as int,
      created_at:
          created_at == freezed ? _value.created_at : created_at as DateTime,
      updated_at:
          updated_at == freezed ? _value.updated_at : updated_at as DateTime,
      uploader: uploader == freezed ? _value.uploader : uploader as GithubUser,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GithubAsset implements _GithubAsset {
  const _$_GithubAsset(
      {@required @nullable this.url,
      @required @nullable this.browser_download_url,
      @required @nullable this.id,
      @required @nullable this.node_id,
      @required @nullable this.name,
      @required @nullable this.label,
      @required @nullable this.state,
      @required @nullable this.content_type,
      @required @nullable this.size,
      @required @nullable this.download_count,
      @required @nullable this.created_at,
      @required @nullable this.updated_at,
      @required @nullable this.uploader});

  factory _$_GithubAsset.fromJson(Map<String, dynamic> json) =>
      _$_$_GithubAssetFromJson(json);

  @override
  @nullable
  final String url;
  @override
  @nullable
  final String browser_download_url;
  @override
  @nullable
  final int id;
  @override
  @nullable
  final String node_id;
  @override
  @nullable
  final String name;
  @override
  @nullable
  final String label;
  @override
  @nullable
  final String state;
  @override
  @nullable
  final String content_type;
  @override
  @nullable
  final int size;
  @override
  @nullable
  final int download_count;
  @override
  @nullable
  final DateTime created_at;
  @override
  @nullable
  final DateTime updated_at;
  @override
  @nullable
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
      {@required @nullable String url,
      @required @nullable String browser_download_url,
      @required @nullable int id,
      @required @nullable String node_id,
      @required @nullable String name,
      @required @nullable String label,
      @required @nullable String state,
      @required @nullable String content_type,
      @required @nullable int size,
      @required @nullable int download_count,
      @required @nullable DateTime created_at,
      @required @nullable DateTime updated_at,
      @required @nullable GithubUser uploader}) = _$_GithubAsset;

  factory _GithubAsset.fromJson(Map<String, dynamic> json) =
      _$_GithubAsset.fromJson;

  @override
  @nullable
  String get url;
  @override
  @nullable
  String get browser_download_url;
  @override
  @nullable
  int get id;
  @override
  @nullable
  String get node_id;
  @override
  @nullable
  String get name;
  @override
  @nullable
  String get label;
  @override
  @nullable
  String get state;
  @override
  @nullable
  String get content_type;
  @override
  @nullable
  int get size;
  @override
  @nullable
  int get download_count;
  @override
  @nullable
  DateTime get created_at;
  @override
  @nullable
  DateTime get updated_at;
  @override
  @nullable
  GithubUser get uploader;
  @override
  _$GithubAssetCopyWith<_GithubAsset> get copyWith;
}
