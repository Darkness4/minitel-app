import 'package:minitel_toolbox/data/models/facebook/post_model.dart';
import 'package:minitel_toolbox/domain/entities/facebook/feed.dart';
import 'package:minitel_toolbox/domain/entities/facebook/post.dart';

/// Facebook User feed generated from Fracebook 4.0 Graph API
class FeedModel extends Feed {
  const FeedModel({
    List<Post> posts,
    String nextUrl,
    String prevUrl,
  }) : super(posts: posts, nextUrl: nextUrl, prevUrl: prevUrl);

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json["data"] as List<dynamic>);
    return FeedModel(
      posts: data
          .map((Map<String, dynamic> post) => PostModel.fromJson(post))
          .toList(),
      nextUrl: json["paging"]["next"] as String,
      prevUrl: json["paging"]["previous"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> data =
        posts.map((Post post) => (post as PostModel).toJson()).toList();
    return <String, dynamic>{
      'data': data,
      'paging': {
        'next': nextUrl,
        'previous': prevUrl,
      },
    };
  }
}
