import 'package:minitel_toolbox/data/models/twitter/post_model.dart';
import 'package:minitel_toolbox/domain/entities/twitter/feed.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

class FeedModel extends Feed {
  const FeedModel({
    List<Post> posts,
  }) : super(posts: posts);

  factory FeedModel.fromJson(List<dynamic> json) {
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json);
    return FeedModel(
      posts: data
          .map((Map<String, dynamic> post) => PostModel.fromJson(post))
          .toList(),
    );
  }

  List<dynamic> toJson() {
    final List<Map<String, dynamic>> data =
        posts.map((Post post) => PostModel.fromEntity(post).toJson()).toList();
    return data;
  }
}
