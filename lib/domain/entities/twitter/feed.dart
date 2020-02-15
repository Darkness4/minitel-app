import 'package:equatable/equatable.dart';

import 'post.dart';

class Feed extends Equatable {
  final List<Post> posts;

  const Feed({
    this.posts,
  });

  @override
  List<Object> get props => [
        posts,
      ];
}
