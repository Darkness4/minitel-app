// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FeedTearOff {
  const _$FeedTearOff();

  _Feed call({@required List<Post> posts}) {
    return _Feed(
      posts: posts,
    );
  }
}

// ignore: unused_element
const $Feed = _$FeedTearOff();

mixin _$Feed {
  List<Post> get posts;

  $FeedCopyWith<Feed> get copyWith;
}

abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res>;
  $Res call({List<Post> posts});
}

class _$FeedCopyWithImpl<$Res> implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  final Feed _value;
  // ignore: unused_field
  final $Res Function(Feed) _then;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed ? _value.posts : posts as List<Post>,
    ));
  }
}

abstract class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) then) =
      __$FeedCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> posts});
}

class __$FeedCopyWithImpl<$Res> extends _$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(_Feed _value, $Res Function(_Feed) _then)
      : super(_value, (v) => _then(v as _Feed));

  @override
  _Feed get _value => super._value as _Feed;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(_Feed(
      posts: posts == freezed ? _value.posts : posts as List<Post>,
    ));
  }
}

class _$_Feed implements _Feed {
  const _$_Feed({@required this.posts}) : assert(posts != null);

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'Feed(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Feed &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @override
  _$FeedCopyWith<_Feed> get copyWith =>
      __$FeedCopyWithImpl<_Feed>(this, _$identity);
}

abstract class _Feed implements Feed {
  const factory _Feed({@required List<Post> posts}) = _$_Feed;

  @override
  List<Post> get posts;
  @override
  _$FeedCopyWith<_Feed> get copyWith;
}
