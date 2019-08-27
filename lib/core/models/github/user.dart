import 'package:flutter/foundation.dart';

class GithubUser {
  final String login;
  final int id;
  final String html_url;
  final String url;
  final String avatar_url;

  const GithubUser({
    @required this.id,
    @required this.login,
    @required this.html_url,
    @required this.url,
    @required this.avatar_url,
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
      login: json['login'],
      id: json['id'],
      html_url: json['html_url'],
      url: json['url'],
      avatar_url: json['avatar_url'],
    );
  }
}
