import 'package:flutter/foundation.dart';

import 'asset.dart';
import 'user.dart';

class GithubRelease {
  final String url;
  final String tag_name;
  final String name;
  final String html_url;
  final int id;
  final GithubUser author;
  final DateTime created_at;
  final DateTime published_at;
  final List<GithubAsset> assets;
  final String body;

  const GithubRelease({
    @required this.id,
    @required this.author,
    @required this.url,
    @required this.tag_name,
    @required this.name,
    @required this.html_url,
    @required this.created_at,
    @required this.published_at,
    @required this.assets,
    @required this.body,
  });

  factory GithubRelease.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> assets =
        List<Map<String, dynamic>>.from(json["assets"] as List<dynamic>);
    return GithubRelease(
      id: int.parse(json['id'].toString()),
      body: json['body'] as String,
      author: GithubUser.fromJson(json['author'] as Map<String, dynamic>),
      url: json['url'] as String,
      tag_name: json['tag_name'] as String,
      name: json['name'] as String,
      html_url: json['html_url'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      published_at: DateTime.parse(json['published_at'] as String),
      assets: assets
          .map((Map<String, dynamic> asset) => GithubAsset.fromJson(asset))
          .toList(),
    );
  }
}
