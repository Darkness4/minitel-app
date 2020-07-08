import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    @required @nullable String text,
    @required @nullable String id_str,
    @required @nullable String user_name,
    @required @nullable String screen_name,
    @required @nullable Uri profile_image_url_https,
    @required @nullable Uri url,
    @required @nullable DateTime created_at,
  }) = _Post;

  factory Post.fromMap(Map<String, dynamic> json) {
    return Post(
      text: json["text"] as String ?? "",
      id_str: json["id_str"] as String,
      user_name: json["user"]["name"] as String ?? "",
      profile_image_url_https:
          Uri.parse(json["user"]["profile_image_url_https"] as String),
      screen_name: json["user"]["screen_name"] as String,
      url: Uri.parse(
          "https://twitter.com/${json["user"]["screen_name"]}/status/${json["id_str"]}"),
      created_at: (json["created_at"] as String).toDateTime(),
    );
  }
}

extension PostX on Post {
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
}

extension on String {
  DateTime toDateTime() {
    final DateFormat format = DateFormat("EEE MMM dd HH:mm:ss yyyy");
    final List<String> loosedDate = split(' ')..removeAt(4);
    return format.parseUtc(loosedDate.join(' '));
  }
}

extension on DateTime {
  String toTwitterFormat() {
    final DateFormat format = DateFormat("EEE MMM dd HH:mm:ss +0000 yyyy");
    return format.format(toUtc());
  }
}
