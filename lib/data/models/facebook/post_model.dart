import 'package:minitel_toolbox/domain/entities/facebook/post.dart';

/// Post generated from Facebook Graph API
class PostModel extends Post {
  const PostModel({
    String message,
    String id,
    String pictureUrl,
    String permalinkUrl,
    DateTime createdTime,
  }) : super(
          message: message,
          id: id,
          pictureUrl: pictureUrl,
          permalinkUrl: permalinkUrl,
          createdTime: createdTime,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      message: json["message"] as String ?? "",
      id: json["id"] as String,
      pictureUrl: json["full_picture"] as String ?? "",
      createdTime: DateTime.parse(json["created_time"] as String),
      permalinkUrl: json["permalink_url"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'id': id,
      'full_picture': pictureUrl,
      'created_time': createdTime.toIso8601String(),
      'permalink_url': permalinkUrl,
    };
  }
}
