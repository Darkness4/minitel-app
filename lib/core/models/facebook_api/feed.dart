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
    var data = List<Map<String, dynamic>>.from(json["data"]);
    posts = data.map((post) => Post.fromJson(post)).toList();
    nextUrl = json["paging"]["next"];
    prevUrl = json["paging"]["previous"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.posts.map((Post post) => post.toJson());
    data['paging'] = Map<String, dynamic>();
    data["paging"]["next"] = this.nextUrl;
    data["paging"]["previous"] = this.nextUrl;
    return data;
  }
}
