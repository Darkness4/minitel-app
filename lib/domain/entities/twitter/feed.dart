import 'package:freezed_annotation/freezed_annotation.dart';

import 'post.dart';

part 'feed.freezed.dart';

@freezed
abstract class Feed with _$Feed {
  const factory Feed({
    @required List<Post> posts,
  }) = _Feed;
}
