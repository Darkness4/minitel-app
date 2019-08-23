/// Post generated from Facebook Graph API
class Post {
  final String message;
  final String id;
  final String pictureUrl;
  final String permalinkUrl;
  final DateTime createdTime;

  Post({
    this.message,
    this.id,
    this.pictureUrl,
    this.createdTime,
    this.permalinkUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json["message"] ?? "",
      id: json["id"],
      pictureUrl: json["full_picture"] ?? "",
      createdTime: DateTime.parse(json["created_time"]),
      permalinkUrl: json["permalink_url"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['id'] = id;
    data['full_picture'] = pictureUrl;
    data['created_time'] = createdTime.toIso8601String();
    return data;
  }
}
