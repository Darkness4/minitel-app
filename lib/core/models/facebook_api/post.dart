/// Post generated from Facebook Graph API
class Post {
  final String message;
  final String id;
  final String pictureUrl;
  final String permalinkUrl;
  final DateTime createdTime;

  const Post({
    this.message,
    this.id,
    this.pictureUrl,
    this.createdTime,
    this.permalinkUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json["message"] as String ?? "",
      id: json["id"] as String,
      pictureUrl: json["full_picture"] as String ?? "",
      createdTime: DateTime.parse(json["created_time"] as String),
      permalinkUrl: json["permalink_url"] as String,
    );
  }
}
