import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  final String text;
  final int id;
  final String user_name;
  final String screen_name;
  final Uri profile_image_url_https;
  final Uri url;
  final DateTime created_at;

  const Post({
    @required this.text,
    @required this.id,
    @required this.user_name,
    @required this.screen_name,
    @required this.profile_image_url_https,
    @required this.created_at,
    @required this.url,
  });

  @override
  List<Object> get props => [
        text,
        id,
        user_name,
        screen_name,
        profile_image_url_https,
        url,
        created_at,
      ];
}
