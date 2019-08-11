class Post {
  String message;
  String id;
  String pictureUrl;
  DateTime createdTime;

  Post({
    this.message,
    this.id,
    this.pictureUrl,
    this.createdTime,
  });

  Post.fromJson(Map<String, dynamic> json) {
    message = json["message"] ?? "";
    id = json["id"] ?? "";
    pictureUrl = json["full_picture"] ?? "";
    createdTime = DateTime.parse(json["created_time"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['id'] = id;
    data['full_picture'] = pictureUrl;
    data['created_time'] = createdTime.toIso8601String();
    return data;
  }
}
