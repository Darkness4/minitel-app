import 'package:equatable/equatable.dart';

import 'post.dart';

/// Facebook User feed generated from Fracebook 4.0 Graph API
class Feed extends Equatable {
  final List<Post> posts;
  final String nextUrl;
  final String prevUrl;

  const Feed({
    this.posts,
    this.nextUrl,
    this.prevUrl,
  });

  @override
  List<Object> get props => [
        posts,
        nextUrl,
        prevUrl,
      ];
}
