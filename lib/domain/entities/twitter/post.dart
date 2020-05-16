import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    @required @nullable String text,
    @required @nullable String id_str,
    @required @nullable String user_name,
    @required @nullable String screen_name,
    @required @nullable Uri profile_image_url_https,
    @required @nullable Uri url,
    @required @nullable DateTime created_at,
  }) = _Post;
}
