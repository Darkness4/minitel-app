import 'post.dart';

/// Facebook User feed generated from Fracebook 4.0 Graph API
class Feed {
  final List<Post> posts;
  final String nextUrl;
  final String prevUrl;

  Feed({
    this.posts,
    this.nextUrl,
    this.prevUrl,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json["data"]);
    return Feed(
      posts:
          data.map((Map<String, dynamic> post) => Post.fromJson(post)).toList(),
      nextUrl: json["paging"]["next"],
      prevUrl: json["paging"]["previous"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = posts.map((Post post) => post.toJson()).toList();
    data['paging'] = <String, dynamic>{};
    data["paging"]["next"] = nextUrl;
    data["paging"]["previous"] = prevUrl;
    return data;
  }
}
