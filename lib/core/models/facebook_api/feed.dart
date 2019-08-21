import 'post.dart';

/// Facebook User feed generated from Fracebook 4.0 Graph API
class Feed {
  List<Post> posts;
  String nextUrl;
  String prevUrl;

  Feed({
    this.posts,
    this.nextUrl,
    this.prevUrl,
  });

  Feed.fromJson(Map<String, dynamic> json) {
    final data = List<Map<String, dynamic>>.from(json["data"]);
    posts = data.map((post) => Post.fromJson(post)).toList();
    nextUrl = json["paging"]["next"];
    prevUrl = json["paging"]["previous"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = posts.map((Post post) => post.toJson()).toList();
    data['paging'] = <String, dynamic>{};
    data["paging"]["next"] = nextUrl;
    data["paging"]["previous"] = prevUrl;
    return data;
  }
}
