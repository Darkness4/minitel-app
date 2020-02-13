import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

class PostModel extends Post {
  const PostModel({
    @required String text,
    @required String id_str,
    @required String user_name,
    @required String screen_name,
    @required Uri profile_image_url_https,
    @required Uri url,
    @required DateTime created_at,
  }) : super(
          text: text,
          id_str: id_str,
          user_name: user_name,
          screen_name: screen_name,
          profile_image_url_https: profile_image_url_https,
          url: url,
          created_at: created_at,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      text: json["text"] as String ?? "",
      id_str: json["id_str"] as String,
      user_name: json["user"]["name"] as String ?? "",
      profile_image_url_https:
          Uri.parse(json["user"]["profile_image_url_https"] as String),
      screen_name: json["user"]["screen_name"] as String,
      url: Uri.parse(
          "https://twitter.com/${json["user"]["screen_name"]}/status/${json["id_str"]}"),
      created_at: _TwitterFormat.format(json["created_at"] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'text': text,
      'id_str': id_str,
      'created_at': created_at.toTwitterFormat(),
      'user': {
        'screen_name': screen_name,
        'name': user_name,
        'profile_image_url_https': profile_image_url_https.toString(),
      },
    };
  }

  factory PostModel.fromEntity(Post entity) {
    return PostModel(
      text: entity.text,
      id_str: entity.id_str,
      user_name: entity.user_name,
      profile_image_url_https: entity.profile_image_url_https,
      screen_name: entity.screen_name,
      url: entity.url,
      created_at: entity.created_at,
    );
  }
}

class _TwitterFormat {
  static DateTime format(String date) {
    final DateFormat format = DateFormat("EEE MMM dd HH:mm:ss yyyy");
    final List<String> loosedDate = date.split(' ')..removeAt(4);
    return format.parseUtc(loosedDate.join(' '));
  }
}

extension on DateTime {
  String toTwitterFormat() {
    final DateFormat format = DateFormat("EEE MMM dd HH:mm:ss +0000 yyyy");
    return format.format(this);
  }
}
